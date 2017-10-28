SELECT c.origin_city_name, s.origin_state_name, a.origin, a.origin_airport_code, al.Airline_name, SUM(al.passengers)
FROM Airport a INNER JOIN City c ON (a.airline_id = c.airline_id)
INNER JOIN State s ON (a.airline_id = s.airline_id)
INNER JOIN Airlines al ON (a.airline_id = al.airline_id)
WHERE a.city.origin_city-name like '%CO'
GROUP BY airlines.passengers
HAVING SUM(passengers);
 

SELECT c.origin_city_name, s.origin_state_name, a.origin, a.origin_airport_code, al.Airline_name, SUM(c.freight)
FROM Airport a INNER JOIN City c ON (a.airline_id = c.airline_id)
INNER JOIN State s ON (a.airline_id = s.airline_id)
INNER JOIN Airlines al ON (a.airline_id = al.airline_id)
WHERE a.city.origin_city-name like '%CO'
GROUP BY city.freight
HAVING SUM(freight);


SELECT c.origin_city_name, s.origin_state_name, c.dest_city_name, al.Airline_name, SUM(al.passengers)
FROM City c INNER JOIN State s ON (c.airline_id = s.airline_id)
INNER JOIN Airlines al ON (c.airline_id = al.airline_id)
WHERE State.origin_state_name != 'colorado' and State.dest_state_name = 'colorado';
GROUP BY airlines.passengers
HAVING SUM(passengers);


SELECT c.origin_city_name, s.origin_state_name, al.Airline_name
FROM airlines al INNER JOIN City c ON (al.airline_id = c.airline_id)
INNER JOIN State s ON (al.airline_id = s.airline_id)
WHERE city.distance BETWEEN 500 and 1200
and city dest_city_name= 'Denver, CO';















