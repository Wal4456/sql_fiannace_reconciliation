SELECT 
    i.invoice_id,
    c.client_name,
    i.total_sar AS invoice_amount_sar,
    COALESCE(SUM(p.amount_paid_sar), 0.00) AS total_paid_sar,
    (i.total_sar - COALESCE(SUM(p.amount_paid_sar), 0.00)) AS balance_due_sar,
    CASE 
        WHEN COALESCE(SUM(p.amount_paid_sar), 0.00) = 0 THEN 'Unpaid'
        WHEN COALESCE(SUM(p.amount_paid_sar), 0.00) < i.total_sar THEN 'Partially Paid'
        WHEN COALESCE(SUM(p.amount_paid_sar), 0.00) = i.total_sar THEN 'Paid'
        ELSE 'Overpaid'
    END AS reconciliation_status
FROM invoices i
JOIN clients c ON i.client_id = c.client_id
LEFT JOIN payments p ON i.invoice_id = p.invoice_id
WHERE i.status = 'Issued'
GROUP BY 
    i.invoice_id, 
    c.client_name, 
    i.total_sar
ORDER BY balance_due_sar DESC;

SELECT 
    SUBSTRING(CAST(i.invoice_date AS CHAR(10)), 1, 7) AS month_year,
    COUNT(i.invoice_id) AS total_invoices_issued,
    SUM(i.subtotal_sar) AS total_subtotal_sar,
    SUM(i.vat_sar) AS total_vat_sar,
    SUM(i.total_sar) AS gross_revenue_sar
FROM invoices i
WHERE i.status = 'Issued'
GROUP BY SUBSTRING(CAST(i.invoice_date AS CHAR(10)), 1, 7)
ORDER BY month_year ASC;

SELECT 
    c.client_name,
    c.client_type,
    COUNT(DISTINCT i.invoice_id) AS total_invoices,
    SUM(i.total_sar) AS total_billed_sar,
    COALESCE(SUM(p.amount_paid_sar), 0.00) AS total_collected_sar,
    ROUND(
        (COALESCE(SUM(p.amount_paid_sar), 0.00) / SUM(i.total_sar)) * 100, 
        2
    ) AS collection_rate_pct
FROM clients c
JOIN invoices i ON c.client_id = i.client_id
LEFT JOIN payments p ON i.invoice_id = p.invoice_id
WHERE i.status = 'Issued'
GROUP BY 
    c.client_id, 
    c.client_name, 
    c.client_type
ORDER BY total_billed_sar DESC;

SELECT 
    p.payment_id,
    p.invoice_id,
    c.client_name,
    i.invoice_date,
    i.status AS invoice_status,
    p.payment_date,
    p.amount_paid_sar,
    p.payment_method
FROM payments p
INNER JOIN invoices i ON p.invoice_id = i.invoice_id
INNER JOIN clients c ON i.client_id = c.client_id
WHERE i.status = 'Cancelled';

SELECT 
    p.payment_method,
    COUNT(p.payment_id) AS total_transactions,
    SUM(p.amount_paid_sar) AS total_collected_sar,
    ROUND(AVG(p.amount_paid_sar), 2) AS average_transaction_sar
FROM payments p
GROUP BY p.payment_method
ORDER BY total_collected_sar DESC;

