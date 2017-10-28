CREATE TABLE Airport
(
    airline_id integer,
    origin	varchar(4),
    origin_airport_id	integer,
    dest_airport_id	integer,
    origin_airport_seq_id	integer,
    dest_airport_seq_id		integer,
    origin_city_name	varchar(40),
    dest_city_name	varchar(20),
    origin_airport_code	varchar(5),
    dest_airport_code	varchar(5),
    PRIMARY KEY(airline_id)
);

CREATE TABLE Airlines
(	
	AIRLINE_ID	integer,
	Airline_name	varchar(20),
	REGION		varchar(5),
	CLASS		varchar(3),
	SEATS		integer,
	PASSENGERS	integer,
	AIRCRAFT_GROUP	integer,
	AIRCRAFT_TYPE	integer,
	AIRCRAFT_CONFIG		integer,
	PRIMARY KEY(airline_id, origin_airport_id)
);

	ALTER TABLE airlines 
   		ADD FOREIGN KEY (airline_id) REFERENCES airport (airline_id);


CREATE TABLE City
(	
	airline_id	integer,
	origin_city_name	varchar(20),
	dest_city_name		varchar(20),
	distance	integer,
	passergers	integer,
	freight		integer,
	PRIMARY KEY(airline_id)
);


	ALTER TABLE city 
   		ADD FOREIGN KEY (airline_id) REFERENCES airport (airline_id);


CREATE TABLE State
(	
	airline_id	integer,
	origin_state_name	varchar(20),
	dest_state_name		varchar(20),
	origin_state_abr	varchar(3),
	dest_state_abr		varchar(3),
	origin_state_fips	integer,
	dest_state_fips		integer,
	PRIMARY KEY(airline_id)
);


	ALTER TABLE state 
   		ADD FOREIGN KEY (airline_id) REFERENCES airport (airline_id);
				

CREATE TABLE routes
(	
	airline_id	integer,
	ORIGIN_AIRPORT_SEQ_ID	integer,	
	ORIGIN_AIRPORT_ID	integer,
	ORIGIN_AIRPORT_SEQ_ID	integer,
	DEST_AIRPORT_SEQ_ID	integer,
	DEST_AIRPORT_ID	integer,
	DISTANCE	integer,	
	RAMP_TO_RAMP	integer,	
	AIR_TIME	integer,
	PRIMARY KEY(airline_id, origin_airport_id)
);


	ALTER TABLE routes 
   		ADD FOREIGN KEY (airline_id) REFERENCES airport (airline_id);



CREATE TABLE Origin_airport(
	airline_id	int	NOT NULL,
	origin_airport_id	int	NOT NULL,
	origin_airport_seq_id	int	NOT NULL,
	origin_city_market_id	int,
	origin_city_name varchar(20),
	origin_state_ABR	varchar(10),
	origin_state_fips int,
	origin_WAC		int,
	primary key(airline_id, origin_airport_id)
);

	ALTER TABLE Origin_airport 
   		ADD FOREIGN KEY (airline_id) REFERENCES airport (airline_id);



CREATE TABLE Dest_airport(
	dest_airport_id		int	NOT NULL,
	dest_airport_seq_id	int	NOT NULL,
	dest_city_market_id	int	NOT NULL,
	dest		varchar(10),
	dest_city_name	varchar(20),
	dest_state_FIPS		int	NOT NULL,
	dest_WAC		int,
	primary key(dest_airport_id)
);

	ALTER TABLE Dest_airport 
   		ADD FOREIGN KEY (dest_airport_id) REFERENCES Origin_airport (origin_airport_id);



CREATE TABLE Unique_carrier(
	airline_id		int		NOT NULL,
	unique_carrier_name	varchar(20)	NOT NULL,
	unique_carrier 		varchar(10),
	unique_carrier entity	int,
	primary key(unique_carrier_name, airline_id)
):

	ALTER TABLE Unique_carrier 
   		ADD FOREIGN KEY (airport_id) REFERENCES Airline_weight (airport_id);













