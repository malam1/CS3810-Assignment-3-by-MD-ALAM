COPY Unique_carrier(unique_carrier_name, unique_carrier, airline_id, unique_carrier_entity) 
FROM 'C:/Users/md jahangir alam/Desktop/Unique_carrier.csv' DELIMITER ',' CSV HEADER;


COPY Aircraft_information(airline_id, region, class, seats, passengers, aircraft_group, aircraft_type, aircraft_config) 
FROM 'C:/Users/md jahangir alam/Desktop/Aircraft_information.csv' DELIMITER ',' CSV HEADER;


COPY Carrier_information(carrier_name, carrier_group, carrier, carrier_group_new, start_date_source, thru_date_source) 
FROM 'C:/Users/md jahangir alam/Desktop/Carrier_information.csv' DELIMITER ',' CSV HEADER;


COPY Origin_airport_information(origin_airport_id, origin_airport_seq_id, origin_city_market, origin_airport_id, origin_city_name, 
origin_state_abr, origin_state_FIPS, origin_state_nm, origin_WAC, origin) 
FROM 'C:/Users/md jahangir alam/Desktop/Origin_airport_information.csv' DELIMITER ',' CSV HEADER;


COPY Dest_airport_information(dest_airport_id, dest_airport_seq_id, dest_city_market_id, dest, dest_city_name, dest_state_abr, dest_state_FIPS, dest_state_nm, dest_WAC) 
FROM 'C:/Users/md jahangir alam/Desktop/Dest_airport_information.csv' DELIMITER ',' CSV HEADER;


COPY Airline_weight_information(airline_id, distance, payload, freight, mail) 
FROM 'C:/Users/md jahangir alam/Desktop/Airline_weight_information.csv' DELIMITER ',' CSV HEADER;


COPY Airline_scheduled_information(airline_id, departures_scheduled, departures_performed, distance, ramp_to_ramp, air_time, year, quarter, month) 
FROM 'C:/Users/md jahangir alam/Desktop/Airline_scheduled_information.csv' DELIMITER ',' CSV HEADER;