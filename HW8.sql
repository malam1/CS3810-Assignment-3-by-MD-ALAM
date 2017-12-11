create table pubs (name varchar,
			    beer_price float4);

addgeometrycolumn(‘beer_db’,'pubs','location’
			   ,2167,'POINT',3);
insert into pubs values (
		'Md Alam',
		4.50,
		GeometryFromText(
			'POINT (1196131 383324)’   ,2167);
select name, beer_price, 
	distance(location, GeometryFromText('POINT(1195722 383854)',2167)) 
			from pubs order by beer_price;
					);
select name, beer_price + 0.001 * distance(location, GeometryFromText('POINT(1195722 383854)',2167)) as net_price
			from pubs order by price;



          name      | beer_price |     distance     
---------------+------------+------------------
 Fireside      |       4.25 | 1484.10275160491
 The Forge     |       4.33 | 1533.06561109862
 Rumours       |       4.46 | 2042.00094093097
 Md Alam       |        4.5 | 669.389105609889
 Slap Happy    |        4.5 | 1882.31910168298
 Old Bailys    |       4.55 | 1147.20900404641
 Black Sheep   |       4.66 | 536.859935972633
 Big Bad Daves |       4.75 | 907.446543878884


name      |     net_price       
---------------+------------------
 Md Alam | 5.16938910560989
 Black Sheep   | 5.19685978338474
 Big Bad Daves | 5.65744654387888
 Old Bailys    | 5.69720919478127
 Fireside      | 5.73410275160491
 The Forge     | 5.86306553480468
 Slap Happy    | 6.38231910168298
 Rumours       | 6.50200097907794




