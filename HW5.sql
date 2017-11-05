CREATE TABLE Customers(
	firstName varchar(100),
	lastName varchar(100),
	street varchar(150),
	postalCode varchar(15),
	email varchar(150),
	PRIMARY KEY(firstName,lastName)
	
);

CREATE TABLE MailingAddress(
	firstName varchar(100),
	lastName varchar(100),
	street varchar(200),
	cityName varchar(50),
	stateName varchar(50),
	postalCode integer,
	countryName varchar(25),
	PRIMARY KEY(firstName,lastName,street,postalCode),
	FOREIGN KEY(firstName,lastName) references customers(firstName,lastName)
);

CREATE TABLE PhoneNumbers(
	phoneNumber int,
	countryCode int,
	cityCode int,
	localNumber int,
	firstName varchar(60),
	lastName varchar(60),
	street varchar(150),
	postalCode varchar(15),
	PRIMARY KEY(phoneNumber,firstName,lastName),
	FOREIGN KEY(firstName,lastName) references Customers(firstName,lastName)
);

CREATE TABLE Provinces(
	provinceName varchar(50),
	countryName varchar(50),
	PRIMARY KEY (provinceName,countryName)	
);

CREATE TABLE Cities(
	cityName varchar(50),
	provinceName varchar(50),
	cityCode int,
	originCode int,
	destCode int,
	PRIMARY KEY(cityCode,originCode,destCode)
);

CREATE TABLE PostalCodes(
	postalCode varchar(15),
	cityCode int,
	PRIMARY KEY(postalCode),
	FOREIGN KEY(cityCode) references Cities(cityCode)
);

CREATE TABLE Airlines(
	airlineName varchar(70),
	airlineCode int,
	originCountry varchar(150),
	PRIMARY KEY(airlineCode)
);
CREATE TABLE Flight(
	originCode int,
	destCode int,
	airlineCode int,
	uniqueFlightNumber int,
	flightNumber int,
	deptDate varchar(150),
	deptHour int,
	deptMinute int,
	arrivalDate varchar(150),
	arrivalHour int,
	arrivalMinute int,
	PRIMARY KEY (uniqueFlightNum),
	FOREIGN KEY(originCode) REFERENCES Cities(cityCode),
	FOREIGN KEY(destCode) REFERENCES Cities(cityCode),
	FOREIGN KEY(airlineCode) REFERENCES Airline(airlineCode)
);

CREATE TABLE Booking(
	uniqueBookingNum int,
	cityCodeOfBooking int,
	uniqueFlightNum int,
	payingCustomerFirstName varchar(60),
	payingCustomerLastName varchar(60),
	payingCustomerStreet varchar(150),
	payingCustomerPostalCode varchar(15),
	PRIMARY KEY (uniqueBookingNum),
	foreign key(payingCustomerFirstName,payingCustomerLastName,
		payingCustomerStreet,payingCustomerPostalCode) references Customers(firstName,lastName,street,postalCode)
);

create table Tickets(
	uniqueBookingNum int,
	firstName varchar(60),
	lastName varchar(60),
	street varchar(150),
	postalCode varchar(15),
	foreign key (firstName,lastName,street,postalCode) references Customers(firstName,lastName,street,postalCode),
	foreign key (uniqueBookingNum) references Booking(uniqueBookingNum)
);