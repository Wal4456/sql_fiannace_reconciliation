-- Database Schema Definition: Financial Reconciliation System
-- Compatible with PostgreSQL and MySQL

-- Drop existing tables to allow clean re-runs
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS clients;

-- 1. Clients Master Table
CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL,
    client_type VARCHAR(20) NOT NULL CHECK (client_type IN ('Corporate', 'Individual')),
    city VARCHAR(50) NOT NULL
);

-- 2. Invoices Master Table
CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    client_id INT NOT NULL,
    invoice_date DATE NOT NULL,
    subtotal_sar DECIMAL(10, 2) NOT NULL,
    vat_sar DECIMAL(10, 2) NOT NULL,
    total_sar DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('Issued', 'Cancelled')),
    CONSTRAINT fk_invoices_clients FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- 3. Payments Ledger Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    invoice_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount_paid_sar DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(30) NOT NULL CHECK (payment_method IN ('Bank Transfer', 'Credit Card', 'Cash', 'Corporate Account')),
    CONSTRAINT fk_payments_invoices FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);
