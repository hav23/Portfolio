create database demostoredb;
use demostoredb;
CREATE TABLE `Category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Descr` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);
CREATE TABLE `Vendor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  `Phone` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
);
CREATE TABLE `Product` (
  `Descr` varchar(200) DEFAULT NULL,
  `Price` decimal(9,2) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VendorID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `VendorID` (`VendorID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `FK_VendorID` FOREIGN KEY (`VendorID`) REFERENCES `Vendor` (`ID`),
  CONSTRAINT `FK_CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `Category` (`ID`)
);
CREATE TABLE `Region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Email` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
);
CREATE TABLE `Store` (
  `StoreZip` int(11) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Address` varchar(200) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `RegionID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RegionID` (`RegionID`),
  CONSTRAINT `FK_RegionID` FOREIGN KEY (`RegionID`) REFERENCES `Region` (`ID`)
);
CREATE TABLE `Customer` (
  `Email` varchar(100) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Phone` int(11) NOT NULL,
  `Firstname` varchar(25) NOT NULL,
  `Lastname` varchar(150) NOT NULL,
  `Zip` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`)
);
CREATE TABLE `SalesTransaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `StoreID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `StoreID` (`StoreID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `FK_StoreID` FOREIGN KEY (`StoreID`) REFERENCES `Store` (`ID`),
  CONSTRAINT `FK_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`ID`)
);
CREATE TABLE `SalesTransactionProduct` (
  `NoOfItems` int(11) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) NOT NULL,
  `SalesID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ProductID` (`ProductID`,`SalesID`),
  KEY `SalesID` (`SalesID`),
  CONSTRAINT `FK_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ID`),
  CONSTRAINT `FK_SalesID` FOREIGN KEY (`SalesID`) REFERENCES `SalesTransaction` (`ID`)
);

-- Read all tables
select ID, Name, Descr from Category;
select ID, Firstname as Fornavn, Lastname as Efternavn, phone, email, zip from Customer;
select ID, name, phone from Vendor;
select ID, name, price, descr, VendorID, CategoryID from Product;
select ID, name, phone, address, email from Region;
select ID, storezip, RegionID, phone, email, address from Store;
select ID, CustomerID, StoreID, Date as date_unusable from SalesTransaction;
select ID, SalesID, ProductID, NoOfItems from SalesTransactionProduct;

delete from salestransactionproduct;
delete from salestransaction;
delete from product;
delete from store;
delete from Category;
delete from customer;
delete from region;
delete from vendor;
