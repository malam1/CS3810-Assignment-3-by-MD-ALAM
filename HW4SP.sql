CREATE OR REPLACE FUNCTION display_airline_name (airline_name	varchar)
RETURNS varchar AS $$
declare
	airline_name varchar;
BEGIN
   SELECT * from airlines;
   RETURN airline_name;
END;
$total$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION totalflights ()
RETURNS integer AS $total$
declare
	total integer;
BEGIN
   SELECT count(*) into total FROM airlines;
   RETURN total;
END;
$total$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION get_average_distance(city.distance INTEGER)
 RETURNS INTEGER AS $$
DECLARE 
 city.distance integer;
BEGIN

 SELECT INTO distance
             AVG(SUM(city.distance)/SUM(city.air_time)) 
 FROM city 
 
 RETURN average_distance;
END; $$
LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION Ratio_OF_passengers_and_distance(
 airlines.passengers integer, 
 city.distance integer) 
RETURNS integer AS $$
BEGIN
 RETURN airlines.passengers/city.distance ;
END; $$
 
LANGUAGE plpgsql;




