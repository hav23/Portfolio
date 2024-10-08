create database Assignment_ERD_map_to_logical_DB;
use Assignment_ERD_map_to_logical_DB;

CREATE TABLE Category
(
  ID INT NOT NULL,
  Category_Name INT NOT NULL,
  Category_Description INT NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Discount
(
  ID INT NOT NULL,
  Max_uses INT NOT NULL,
  Discount_Amount DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Customer
(
  ID INT NOT NULL,
  First_name VARCHAR(50) NOT NULL,
  Last_name VARCHAR(50) NOT NULL,
  Middlename VARCHAR(510) NOT NULL,
  Post_code INT NOT NULL,
  Street_name VARCHAR(100) NOT NULL,
  Civic_Nr INT NOT NULL,
  Civic_Specifier VARCHAR(10) NOT NULL,
  Phone INT NOT NULL,
  Email VARCHAR(100) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE CustomerItem
(
  Compound_ID INT NOT NULL,
  Uses INT NOT NULL,
  DISC_ID INT NOT NULL,
  CUST_ID INT NOT NULL,
  PRIMARY KEY (Compound_ID),
  FOREIGN KEY (DISC_ID) REFERENCES Discount(ID),
  FOREIGN KEY (CUST_ID) REFERENCES Customer(ID),
  UNIQUE (DISC_ID, CUST_ID)
);

CREATE TABLE Item
(
  ID INT NOT NULL,
  Price decimal(9,2) NOT NULL,
  Item_Name VARCHAR(100) NOT NULL,
  Item_Description VARCHAR(510) NOT NULL,
  DISC_ID INT NOT NULL,
  CUST_ID INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (DISC_ID) REFERENCES Discount(ID),
  FOREIGN KEY (CUST_ID) REFERENCES Category(ID)
);