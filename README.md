# WAREHOUSE-MANAGEMENT-SYSTEM
📦 Warehouse Management System – Electronics Distribution Company
This database system is designed to support the warehouse operations of an electronics distribution company. It manages the processes of importing and exporting goods, as well as tracking suppliers, customers, inventory, employees, and job roles.
Data Structures
1. Products
- Fields: Product ID, Product Name, Unit, Supplier ID, Stock Quantity
- Relation: One supplier can provide multiple products

2. Employees
- Fields: Employee ID, Full Name, Address, Phone Number, Gender, Working Hours, Bonus, Job ID
- Relation: Each employee is assigned to a single job in the warehouse

3. Jobs
- Fields: Job ID, Job Title, Hourly Wage

4. Suppliers
- Fields: Supplier ID, Supplier Name, Address, Phone Number
- Relation: A supplier can be associated with multiple import receipts

5. Import Receipts
- Fields: Receipt ID, Import Date, Supplier ID, Employee ID (Responsible)
- Details: Product ID, Quantity, Total Amount
Note: Only employees with the job "Warehouse Import" are allowed to create import receipts

6. Customers
- Fields: Customer ID, Customer Name, Address, Phone Number
- Relation: A customer can be associated with multiple export receipts

7. Export Receipts
- Fields: Receipt ID, Delivery Date, Customer Name, Employee ID (Responsible)
- Details: Product ID, Quantity, Total Amount
Notes:
- Only employees with the job "Warehouse Export" are allowed to create export receipts
- System checks inventory levels before processing any export
