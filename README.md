# sql_fiannace_reconciliation
PostgreSQL &amp; MySQL portfolio project automating corporate invoice, payment, and 15% VAT reconciliation using JOIN, GROUP BY, and CASE WHEN.
# Travel & Corporate Invoice Reconciliation with SQL (PostgreSQL & MySQL)

## Business Problem
Travel agencies and corporate service providers frequently process high transaction volumes across multiple payment channels (credit cards, bank transfers, cash). Operations often struggle with fragmented record-keeping across spreadsheets, leading to:
* Unidentified partial payments and uncollected balances.
* Overpaid billing accounts resulting from manual tracking errors.
* Miscalculated 15% Value Added Tax (VAT) liability on cancelled or outstanding bookings.
* Revenue leaks caused by processing payments against cancelled corporate invoices.

This project implements a relational database schema alongside production-grade SQL queries to automate daily billing reconciliation, compute exact client account balances, ensure accurate VAT reporting, and flag operational discrepancies.

## Database Schema Overview
The relational structure consists of three core entity tables:

1. `clients`: Stores master profiles for corporate accounts and individual travel clients.
2. `invoices`: Tracks core billing metrics, line-item sub-totals, 15% VAT components, total invoice amounts in SAR, and status indicators.
3. `payments`: Captures individual financial transactions, associated payment methods, and timestamps linked back to specific invoices.

## Skills & Concepts Demonstrated
* **Relational Schema Architecture:** Foreign key constraints, data type integrity, default values, and primary key sequencing.
* **Complex Data Joining:** Utilizing `INNER JOIN` for audit checks and `LEFT JOIN` to capture uncollected or unpaid balances.
* **Aggregation & Analysis:** Applying `GROUP BY` and `HAVING` clauses for financial sum totals and filtered metrics.
* **Null Handling & Conditional Logic:** Leveraging `COALESCE` to prevent null arithmetic and `CASE WHEN` logic for payment classification.
* **Financial & VAT Compliance Auditing:** Structuring automated checks for 15% VAT tax liabilities and fraudulent or error-prone transactions against cancelled invoices.

