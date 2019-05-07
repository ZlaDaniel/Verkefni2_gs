drop database if exists TheFirm;
create database TheFirm;
use TheFirm;


create table ZipCodes
(
    zipID int primary key auto_increment,
    zipCode int
);

create table Cities
(
    cityID int primary key auto_increment,
    city varchar(55)
);

create table Firms
(
	firmID int primary key auto_increment,
    companyName char(75),
    zipCode int,
    city int,
    telephone1 char(10),
    telephone2 char(10),
    email varchar(125),
    ceo varchar(55),
    companySlogan char(25),
    constraint zipCodeFK foreign key(zipCode) references ZipCodes(zipID),
    constraint cityFK foreign key(city) references Cities(cityID)
);

create table Divisions
(
	divisionID int primary key auto_increment,
    divisionName varchar(75),
    firm int,
    constraint firmFK foreign key(firm) references Firms(firmID)
);

create table Products
(
	productID int primary key auto_increment,
    productName varchar(55),
    timeOfProduction date,
    recommendedSalesPrice int,
    division int,
    constraint productAtDivisionFK foreign key(division) references Divisions(divisionID)
);

create table Jobs
(
    jobID int primary key auto_increment,
    jobTitle varchar(55)
);


create table Staff
(
	staffID int primary key auto_increment,
    staffName varchar(75),
    jobTitle int,
    jobPhone char(10),
    homePhone char(10),
    mobilePhone char(10),
    division int,
    constraint jobTitleFK foreign key(jobTitle) references Jobs(jobID),
    constraint divisionFK foreign key(division) references Divisions(divisionID)
);

create table DivisionManagers
(
    managerID int primary key auto_increment,
    staff int,
    division int,
    constraint managerStaffFK foreign key(staff) references Staff(staffID),
    constraint managerDivisionFK foreign key(division) references Divisions(divisionID)
);


insert into ZipCodes(zipCode)values(1003);

insert into Cities(city)values("Manhattan");

insert into Firms(companyName, zipCode, city, telephone1, telephone2, email, ceo, companySlogan)
    values("The good company", 1, 1, "3332341222", "3558493827", "gcompany@gcompany.com", "Man Goodman", "We are good, give us money");

insert into Divisions(divisionName, firm)
    values("Repair", 1), ("Sales", 1);
insert into Products(productName, timeOfProduction, recommendedSalesPrice, division)
    values("Good stuff", curdate(), 232500, 1), ("Better stuff", curdate(), 2500, 2);

insert into Jobs(jobTitle)values("Salesperson"),("Division manager"), ("Repair technician");

insert into Staff(staffName, jobTitle, jobPhone, homePhone, mobilePhone, division)
    values
        ("Jóhannes pétur", 2, "4547457574", "", "534765672", 1), 
        ("Halldór", 1, "4547457574", "", "534765672", 1), 
        ("Jón Jónsson", 3, "4547457574", "", "534765672", 2), 
        ("Bjartur breki", 3, "54547457574", "", "534765672", 2), 
        ("Hallgerður", 1, "4547457574", "", "534765672", 2);
        
insert into DivisionManagers(staff, division)values(1, 1);