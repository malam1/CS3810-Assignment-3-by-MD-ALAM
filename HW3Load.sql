COPY airport(airline_id, origin_airport_id, dest_airport_id, origin_airport_seq_id, dest_airport_seq_id, origin_city_name, dest_city_name)
FROM 'C:/Users/md jahangir alam/Desktop/airport.csv' DELIMITER ',' CSV HEADER;




COPY city(airline_id, ORIGIN_CITY_NAME, DEST_CITY_NAME, distance, passergers, freight)
FROM 'C:/Users/md jahangir alam/Desktop/city_table.csv' DELIMITER ',' CSV HEADER;


COPY Aircraft_information(airline_id, region, class, seats, passengers, aircraft_group, aircraft_type, aircraft_config) 
FROM 'C:/Users/md jahangir alam/Desktop/Aircraft_information.csv' DELIMITER ',' CSV HEADER;


COPY Carrier_information(carrier_name, carrier_group, carrier, carrier_group_new, start_date_source, thru_date_source) 
FROM 'C:/Users/md jahangir alam/Desktop/Carrier_information.csv' DELIMITER ',' CSV HEADER;


COPY Origin_airport_information(origin_airport_id, origin_airport_seq_id, origin_city_market, origin_airport_id, origin_city_name, 
origin_state_abr, origin_state_FIPS, origin_state_nm, origin_WAC, origin) 
FROM 'C:/Users/md jahangir alam/Desktop/Origin_airport_information.csv' DELIMITER ',' CSV HEADER;


COPY Dest_airport_information(dest_airport_id, dest_airport_seq_id, dest_city_market_id, dest, dest_city_name, dest_state_abr, dest_state_FIPS, dest_state_nm, dest_WAC) 
FROM 'C:/Users/md jahangir alam/Desktop/Dest_airport_information.csv' DELIMITER ',' CSV HEADER;

COPY Unique_carrier(unique_carrier_name, unique_carrier, airline_id, unique_carrier_entity) 
FROM 'C:/Users/md jahangir alam/Desktop/Unique_carrier.csv' DELIMITER ',' CSV HEADER;




