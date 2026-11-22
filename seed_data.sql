-- Seed Data: Real-World Financial & Travel Operational Scenarios

-- Insert Clients (5 Clients: 3 Corporate, 2 Individual)
INSERT INTO clients (client_id, client_name, client_type, city) VALUES
(1, 'Al-Futtaim Travel Co.', 'Corporate', 'Riyadh'),
(2, 'Aramco Executive Services', 'Corporate', 'Dhahran'),
(3, 'Sara Al-Mansoor', 'Individual', 'Jeddah'),
(4, 'SABIC Business Travel', 'Corporate', 'Riyadh'),
(5, 'Tariq Al-Zahrani', 'Individual', 'Dammam');

-- Insert Invoices (10 Invoices featuring 15% VAT calculations and 1 Cancelled state)
INSERT INTO invoices (invoice_id, client_id, invoice_date, subtotal_sar, vat_sar, total_sar, status) VALUES
(101, 1, '2024-01-05', 10000.00, 1500.00, 11500.00, 'Issued'),
(102, 1, '2024-01-15',  5000.00,  750.00,  5750.00, 'Issued'),
(103, 2, '2024-01-20', 20000.00, 3000.00, 23000.00, 'Issued'),
(104, 3, '2024-01-22',  3000.00,  450.00,  3450.00, 'Issued'),
(105, 2, '2024-02-01', 15000.00, 2250.00, 17250.00, 'Issued'),
(106, 4, '2024-02-10',  8000.00, 1200.00,  9200.00, 'Issued'),
(107, 4, '2024-02-15',  4000.00,  600.00,  4600.00, 'Cancelled'), -- Cancelled Invoice Scenario
(108, 5, '2024-02-18',  2500.00,  375.00,  2875.00, 'Issued'),
(109, 1, '2024-02-25', 12000.00, 1800.00, 13800.00, 'Issued'),
(110, 3, '2024-03-01',  1500.00,  225.00,  1725.00, 'Issued');

-- Insert Payments (11 Payments: Fully Paid, Partial Payments, Overpayments, Unpaid, and Cancelled Payments)
INSERT INTO payments (payment_id, invoice_id, payment_date, amount_paid_sar, payment_method) VALUES
(501, 101, '2024-01-10', 11500.00, 'Bank Transfer'),      -- Invoice 101: Fully Paid
(502, 102, '2024-01-18',  3000.00, 'Credit Card'),         -- Invoice 102: Partial Payment 1
(503, 102, '2024-01-25',  2750.00, 'Bank Transfer'),      -- Invoice 102: Partial Payment 2 (Fully Settled)
(504, 103, '2024-01-22', 10000.00, 'Bank Transfer'),      -- Invoice 103: Partial Payment (Underpaid)
(505, 104, '2024-01-23',  3450.00, 'Credit Card'),         -- Invoice 104: Fully Paid
(506, 105, '2024-02-05', 18000.00, 'Bank Transfer'),      -- Invoice 105: Overpaid by 750 SAR
(507, 106, '2024-02-12',  5000.00, 'Corporate Account'),  -- Invoice 106: Partial Payment (Underpaid)
(508, 107, '2024-02-16',  2000.00, 'Bank Transfer'),      -- Invoice 107: Payment against CANCELLED Invoice (Audit Flag)
(509, 108, '2024-02-20',  2875.00, 'Cash'),                -- Invoice 108: Fully Paid
(510, 109, '2024-02-28',  5000.00, 'Corporate Account'),  -- Invoice 109: Partial Payment 1
(511, 109, '2024-03-02',  4000.00, 'Bank Transfer');       -- Invoice 109: Partial Payment 2 (Underpaid total 9000 SAR)
-- Note: Invoice 110 has NO payments recorded (Unpaid Scenario).
