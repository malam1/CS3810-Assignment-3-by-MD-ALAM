SELECT CITY_NAME, STATE_NAME, AIRPORT, UNIQUE_CARRIER_NAME, Sum(PASSENGERS)
FROM Cities natural join States natural join Airport, Flight_Sum natural join Carrier
WHERE Flight_Sum.ORIGIN_AIRPORT_ID = Airport.AIRPORT_ID and Airport.CITY_MARKET_ID = Cities.CITY_MARKET_ID and Cities.STATE_ABR = 'CO' 
GROUP BY CITY_NAME, STATE_NAME, AIRPORT, UNIQUE_CARRIER_NAME
ORDER BY UNIQUE_CARRIER_NAME;


SELECT CITY_NAME, STATE_NAME, AIRPORT, UNIQUE_CARRIER_NAME, Sum(FREIGHT)
FROM Cities natural join States natural join Airport, Flight_Sum natural join Carrier
WHERE Flight_Sum.ORIGIN_AIRPORT_ID = Airport.AIRPORT_ID and Airport.CITY_MARKET_ID = Cities.CITY_MARKET_ID and Cities.STATE_ABR = 'CO' 
GROUP BY CITY_NAME, STATE_NAME, AIRPORT, UNIQUE_CARRIER_NAME
ORDER BY UNIQUE_CARRIER_NAME;


SELECT originC.CITY_NAME as originCity, originS.STATE_NAME as originState, destC.CITY_NAME as destCity, UNIQUE_CARRIER_NAME, sum(Passengers)
FROM Cities originC , Cities destC, States originS, Carrier natural join Flight_Sum, Airport originAirport , Airport destAirport
WHERE Flight_Sum.ORIGIN_AIRPORT_ID = originAirport.AIRPORT_ID and originAirport.CITY_MARKET_ID = originC.CITY_MARKET_ID and originC.STATE_ABR <> 'CO' 
	and originC.STATE_ABR = originS.STATE_ABR and Flight_Sum.DEST_AIRPORT_ID = destAirport.AIRPORT_ID and destAirport.CITY_MARKET_ID = destC.CITY_MARKET_ID
	and destC.STATE_ABR = 'CO'
GROUP BY originCity, originState, destCity, UNIQUE_CARRIER_NAME
ORDER BY originCity;


SELECT CITY_NAME AS originCity, STATE_NAME AS originStates, UNIQUE_CARRIER_NAME
FROM Airport, Cities, States, Carrier, Flight_Sum
WHERE Flight_Sum.ORIGIN_AIRPORT_ID = Airport.AIRPORT_ID and Airport.CITY_MARKET_ID = Cities.CITY_MARKET_ID and Cities.STATE_ABR = States.STATE_ABR 
	and Flight_Sum.AIRLINE_ID = Carrier.AIRLINE_ID and Flight_Sum.DISTANCE between 500 and 1200
GROUP BY originCity, originStates, UNIQUE_CARRIER_NAME;
















