create table Origin_airport(
origin_airport_id	int	NOT NULL,
origin_airport_seq_id	int	NOT NULL,
origin			varchar(20)	NOT NULL,
origin_city_name	varchar(40)	NOT NULL,
origin_state_ABR	varchar(10),
origin_state_nm		varchar(20),
origin_WAC		int,
origin			car,
primary key(origin_airport_id, origin_city_name)
);

create table Dest_airport(
dest_airport_id		int	NOT NULL,
dest_airport_seq_id	int	NOT NULL,
dest_city_market_id	int	NOT NULL,
dest		varchar(10),
dest_city_name	varchar(20),
dest_sate_ABR	varchar(10),
dest_state_FIPS		int	NOT NULL,
dest_state_nm	varchar(25),
dest_WAC		int,
primary key(dest_airport_id)
);

ALTER TABLE Dest_airport 
   ADD FOREIGN KEY (dest_airport_id) REFERENCES Origin_airport (origin_airport_id);



create table Airline_weight(
airline_id	int	NOT NULL,
distance 	int,
payload		int,
freight		int,
mail		int,
Primary key(airline_id)
);

ALTER TABLE Airline_weight 
   ADD FOREIGN KEY (airport_id) REFERENCES Origin_airport (origin_airport_id);


create table Carrier_info(
carrier_name 		varchar(40)	NOT NULL,
carrier_group		int,
seats			int,
carrier			varchar(20)	NOT NULL,
carrier_group_new	int,
start_date_source	date,
thru_date_source	date,
carrier_entity		int,
primary key(carrier_name, carrier)
);

create table Airline_scheduled(
airline_id		int	NOT NULL,
departures_scheduled	int,
departures_performed	int,
distance		int,
ramp_to_ramp		int,
air_time		int,
year			int,
quarter			int,
month			int,
primary key(airline_id)
);

ALTER TABLE Airline_scheduled 
   ADD FOREIGN KEY (airport_id) REFERENCES Airline_weight (airport_id);

create table Aircraft_info(
airline_id	int		NOT NULL,
region		varchar(20)	NOT NULL,
class 		varchar(10),
passengers	int,
aircraft_group	int,
aircraft_type	int,
aircraft_config	int,
primary key(airline_id, region)
);

ALTER TABLE Aircraft_info 
   ADD FOREIGN KEY (airport_id) REFERENCES Airline_weight (airport_id);

create table Unique_carrier(
unique_carrier_name	varchar(20)	NOT NULL,
unique_carrier 		varchar(10),
airline_id		int		NOT NULL,
unique_carrier entity	int,
primary key(unique_carrier_name, airline_id)
):

ALTER TABLE Unique_carrier 
   ADD FOREIGN KEY (airport_id) REFERENCES Airline_weight (airport_id);







