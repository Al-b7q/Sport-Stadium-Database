-- Creating view for Employees


Create View Employee_view AS

Select Employee.EmID AS "Employee ID", 
Employee.E_FName AS "First Name",
Employee.E_LName AS "Last Name",

Task.T_Name AS "Task Name",
Task.T_Date AS "Task Date", 
Task.T_Time AS "Task Time" ,
Task.T_Type AS "Task Type"

From Employee

Join Task

ON Employee.EmID = Task.Employee

Where T_Type = "Complete";

Select * from Employee_view;