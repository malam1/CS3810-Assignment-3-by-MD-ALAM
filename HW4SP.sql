create or replace function FlightSummary()
	return varchar(50) as $AirlineName$, 
			int as $totalFlights$, 
			float as $avgDistance$,
			float as $passengersToDistance$,
			float as $freightToDistance$,
			int as $corrCoeffPassengersToDistance$,
			int as $corrCoeffFreightToDistance$
	
	declare AirlineName	varchar(50);
			totalFlights int;
			avgDistance float;
			passengersToDistance float;
			freightToDistance float;
			corrCoefPtoD int;
			corrCoefFtoD int;

BEGIN
	select distinct UNIQUE_CARRIER_NAME from Carrier into AirlineName;
	select count(*) from Flight_Sum where Flight_Sum.UNIQUE_CARRIER_NAME = AirlineName into totalFlights;
	select avg(Distance) from Flight_Sum where Flight_Sum.UNIQUE_CARRIER_NAME = AirlineName into avgDistance;
	select passengers / Distance from Flight_Sum where Flight_Sum.UNIQUE_CARRIER_NAME = AirlineName into passengersToDistance;
	select freight / Distance from Flight_Sum where Flight_Sum.UNIQUE_CARRIER_NAME = AirlineName into freightToDistance; 
	
	if passengersToDistance > 1
	Then corrCoefPToD = 1;
	Else corrCoefPToD = -1;
	End if;

	if freightToDistance > 1
	Then corrCoefFToD = 1;
	Else corrCoefFToD = -1;
	End if;

End







			

© 2017 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
API
Training
Shop
Blog
About