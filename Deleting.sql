-- removing all Tables

DROP DATABASE mis1user28;

-- (another Way) removing all Tables (child before parent)

Drop Table Ticket;
Drop Table Event;
Drop Table Invoice;
Drop Table SP_Holders;
Drop Table Task;
Drop Table Item;
Drop Table Restaurant;
Drop Table Customer;
Drop Table Employee;
Drop Table Team;
 


-- Deleting all records from all tables (child before parent)

Delete From Ticket;
Delete From Event;
Delete From Invoice;
Delete From SP_Holders;
Delete From Task;
Delete From Item;
Delete From Restaurant;
Delete From Customer;
Delete From Employee;
Delete From Team;