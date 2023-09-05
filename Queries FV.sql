-- Query A

-- Average ticket price report


SELECT Customer AS "Customer ID", AVG(price) AS "Average Ticket price"

From Ticket

Group by Customer;


-- Query B

-- List of Employees ordered by hire date


Select E_FName AS "First Name" , E_LName AS "Last Name",
Department,
H_Date AS "Hire Date"

From Employee

Order by H_Date ASC ;



-- Query C

-- list with total number of employees in each department


Select Department ,COUNT(Department) AS "Total number of Employees"

From Employee

Group by Department

Order by Department;


-- Query D

-- list of all sporting events with Number of Customers in Attendance



Select Event.Name, Event.E_Type AS "Sport_Type", Event.Home AS "Home Team ID", 

Event.Visitor AS "Visitor Team ID",

COUNT(Ticket.TicketID) AS "Number of Customers in Attendance"

From Event 

JOIN Ticket

ON Event.EventID = Ticket.Event

Group by Ticket.Event

Order by Event.E_Date ASC ;






-- Query E

-- list of all the managers with their Salary


Select concat(E_FName,"   ", E_FName) AS "Manager Name",

Department,

CONCAT(FORMAT(Salary, 2)," ",'SR') AS Salary

From Employee

Where Class = "Manager"

Order by Salary DESC;



-- Query F

-- list of all foods on March 17th 2020


Select Item.Item_name AS "Food Name", Item.Item_Type, 

Concat(FORMAT(Item.Price, 2), " " , "SR")AS Price,

SUM(Invoice.Quantity) AS " Total Quantity Sold ", 

Invoice.Quantity * Item.Price AS "Total Sales  "

From Item

Join Invoice

ON Item.ItemID = Invoice.ItemID

Where Invoice.I_Date = "2020/03/17"

Group by Invoice.ItemID;



-- Query G

-- List with customers who have only attended one sporting event



Select Customer.CustomerNID AS "Customer ID", 

Customer.C_FName AS "First name",

Customer.C_LName AS "Last name", 

Event.E_Type As "Event Type"

From Customer

Join Ticket

ON Customer.CustomerNID = Ticket.Customer

Join Event

ON Ticket.Event = Event.EventID 

Group By Customer.CustomerNID

Having COUNT(Ticket.Customer) = 1;






-- Query H

-- list of the season pass holder With the expiration date


Select SP_Holders.HolderID AS "Holder ID",

Customer.C_FName AS "First Name",

Customer.C_LName AS "Last Name",

DATE_ADD(SP_Holders.S_Date, INTERVAL 1 YEAR) AS "the Expiration Date",

Count(Ticket.TicketID) AS "Number of attended events"

From SP_Holders

Join Customer 

ON SP_Holders.HolderID = Customer.CustomerNID

Join Ticket

ON Customer.CustomerNID = Ticket.Customer


Group By Ticket.Customer;




-- Query I

-- list of the teams that have played at the stadium (Team Seven did not play)


Select Team.TeamID AS "Team ID", Team.T_name AS "Team name", Team.City, Team.Country, Team.Coach 

From Team

join Event

On Event.Home = Team.TeamID

Group By Team.TeamID

Having Count(Event.EventID) > 0;





-- Query j

-- list of employees total sales Exclude less than 500SR (Employee 9000015 < 500)


Select Employee.EmID AS "Employee ID", Employee.E_FName As "First Name", 

Employee.E_LName As "Last Name",

Invoice.Quantity,

SUM(Item.Price*Invoice.Quantity ) AS "grand total of food item sales"

From Employee

Join Invoice 

On Employee.EmID = Invoice.Employees

Join Item

On Invoice.ItemID = Item.ItemID

group by Employee.EmID

Having SUM(Item.Price*Invoice.Quantity ) > 500

Order by SUM(Item.Price*Invoice.Quantity ) DESC;












