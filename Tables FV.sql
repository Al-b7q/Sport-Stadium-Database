create table Customer (
  CustomerNID int not null unique,
  C_FName varchar(20) not null,
  C_LName varchar(20) not null,
  Class varchar(4) not null,
  primary key (CustomerNID)
);

       Create Table Restaurant (
              RID int not null unique,
              R_Name varchar(20) not null,
	      Location varchar(20) not null,
              R_Type varchar(20) not null,
              Capacity int not null,
              Primary Key (RID)
              );
              
               create table Item (
            ItemID int not null unique,
            Item_name Varchar(20) not null,
            Price Dec(10) not null,
            Item_Type Varchar(20) Not null,
            Primary key (ItemID)
            );
            
              
              Create table Employee (
                EmID int not null unique,
                E_FName varchar(20) not null,
                E_LName varchar(20) not null,
                B_Date Date not null,
                H_Date date not null,
                Department varchar(20) not null,
                Class varchar(20) not null,
                Salary dec(10) not null,
                Primary key (EmID)
                );
                
                
                     create table Team (
          TeamID int not null unique,
          T_name Varchar(30) not null,
          City Varchar(30)  not null,
          Country Varchar(30) not null,
          Coach Varchar(30) not null,
          Primary Key (TeamID) 
          );
          
          Create table Event  (
        EventID int not null unique,
	Name varchar(20) not null,
        E_Date date not null,
        E_Time time not null, 
        Seats int not null,
        E_Type varchar(20) not null,
        Home int not null,
        Visitor int not null,
        Primary key (EventID),
        CONSTRAINT FK_Home FOREIGN KEY (Home) 
  REFERENCES Team(TeamID),
        CONSTRAINT FK_Visitor FOREIGN KEY (Visitor) 
  REFERENCES Team(TeamID)
        );
          

create table Invoice (
  InvoiceID int not null unique,
  customers int not null,
  RID int not null,
  ItemID int not null,
  Employees int not null,
  Quantity int not null,
  I_Date date not null,
  I_Time time not null,
  primary key (InvoiceID),
  CONSTRAINT FK_Customers FOREIGN KEY (customers) 
  REFERENCES Customer(CustomerNID),
  CONSTRAINT FK_RID FOREIGN KEY (RID) 
  REFERENCES Restaurant(RID),
  CONSTRAINT FK_ItemID FOREIGN KEY (ItemID) 
  REFERENCES Item(ItemID),
  CONSTRAINT FK_Employees FOREIGN KEY (Employees) 
  REFERENCES Employee(EmID)
  );
  
  Create table Ticket(
    TicketID int not null unique,
    Customer int not null,
    Event int not null,
    price DEC(10) not null,
    Primary key (TicketID),
     CONSTRAINT FK_Customer FOREIGN KEY (Customer) 
  REFERENCES Customer(CustomerNID),
     CONSTRAINT FK_Event FOREIGN KEY (Event) 
  REFERENCES Event(EventID)
    );
    
    create table SP_Holders(
      HolderID int not null unique,
      S_Date date not null,
      Primary key(HolderID)
      );
      
	
        
   
                
                Create table Task (
                  TaskID int not null unique,
                  Employee int not null,
                  T_Name Varchar(20) not null,
                  T_Type varchar(20) not null,
                  T_Date date not null,
                  T_Time time not null,
                  Primary Key (TaskID),
   CONSTRAINT FK_Employee FOREIGN KEY (Employee) 
  REFERENCES Employee(EmID)
                  );