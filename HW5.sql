CREATE TABLE Customers(
	firstName varchar(100),
	lastName varchar(100),
	street varchar(150),
	postalCode varchar(15),
	email varchar(150),
	PRIMARY KEY(firstName,lastName, street, postalCode)
	
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
	FOREIGN KEY(firstName,lastName) REFERENCES customers(firstName,lastName)
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
	FOREIGN KEY(firstName,lastName) REFERENCES Customers(firstName,lastName)
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
	PRIMARY KEY(cityCode)
);

CREATE TABLE PostalCodes(
	postalCode varchar(15),
	cityCode int,
	PRIMARY KEY(postalCode),
	FOREIGN KEY(cityCode) REFERENCES Cities(cityCode)
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
	payingCustomerFirstName varchar(50),
	payingCustomerLastName varchar(50),
	payingCustomerStreet varchar(50),
	payingCustomerPostalCode varchar(20),
	PRIMARY KEY (uniqueBookingNum),
	FOREIGN KEY(payingCustomerFirstName,payingCustomerLastName,
		payingCustomerStreet,payingCustomerPostalCode) REFERENCES Customers(firstName, lastName, street, postalCode)
);

CREATE TABLE Tickets(
	uniqueBookingNum int,
	firstName varchar(50),
	lastName varchar(50),
	street varchar(100),
	postalCode varchar(20),
	FOREIGN KEY (firstName,lastName) REFERENCES Customers(firstName,lastName),
	FOREIGN KEY (uniqueBookingNum) REFERENCES Booking(uniqueBookingNum)
);
