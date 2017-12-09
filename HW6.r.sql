library("RPostgreSQL")

drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname="hw6", host="localhost", port=5433, user="postgres", password="MetroState3192")

cat("Airline Reservation System Start from here.\nWant to start? (y/n)\n\n>")

input<- readline()
stopifnot(input=='y' || input=='Y')

cat("\n\n\nDesired output folder required. Must be in form\n/path/to/outputfolder\n\n> ")
PATHOFOUTPUT <- readline()


repeat{
	cat("\nFirst name.\n\n> ")
	input <- readline()
        firstName  <- input

	
	cat("\nLast name.\n\n> ")
        input <- readline()
        lastName  <- input
        
      
        cat("\nStreet address.\n\n> ")
        input <- readline()
	street<- input


        cat("\nPostal code.\nOnly 5 characters are allowed.\n\n> ")
        input <- readline()
        postalCode <- input


	cat("\nEmail.\n\n> ")
        input <- readline()
        email <- input


	customerSummary <- paste("Information for Customer:\n",
		"\nFirst Name:		", firstName, ".\n",
		"Last Name:		", lastName, ".\n",
		"Street Address:	", street".\n",
		"Postal Code:		", postalCode, ".\n",
		"Email:			", email, ".\n\n\n",sep="")

	cat("\n\nPlease Verify:\n\n",customerSummary,"\n\nIs this information correct? (y/n)\n\n> ")

	input <- readline()
	if (input =='y' || input == 'Y'){
		break
	}
} 


terminateProgram <- FALSE

error <- ""
if(grepl("\\d", firstName)){
	error <- paste(error,"\nINVALID FIRST NAME INPUT. First names don't have numbers.",sep="")
	terminateProgram <- TRUE
}
if(grepl("\\d", lastName)){
	error <- paste(error,"\nINVALID LAST NAME INPUT. Last names don't have numbers.",sep="")
        terminateProgram <- TRUE 
}




atCount <- 0		
emailVector <- unlist(strsplit(email,""))
for(c in emailVector){
	if(c == "@"){
		atCount <- atCount + 1
	}
}

if(atCount != 1){
	error <- paste(error,"\nINVALID EMAIL. The character @ must apear once in email.",sep="")
	terminateProgram <- TRUE 
}

postalVector <- unlist(strsplit(postalCode,""))

if(length(postalVector) != 5){
	error <- paste(error,"\nINVALID POSTAL CODE. Postal codes must be 5 digits.",sep="") 
	terminateProgram <- TRUE 
}


if(terminateProgram){
	error <- paste(customerSummary,error,sep="")
	write(error, file=paste(PATHOFOUTPUT,"/HW6.error",sep=""))
	cat("\n\nThere were errors in user input. Errors can be found in HW6.error. The program will terminate.\n\n")
	dbDisconnect(con)
	stop()
}




query <- paste("INSERT INTO Customers(firstName,lastName,street,postalCode,email) VALUES('",
		firstName, "', '",
		lastName, "', '",
		street, "', '",
		postalCode, "', '", 
                email, "');", sep="")
dbGetQuery(con, query)



repeat{
	chance <- 3
	repeat{
		query <- "SELECT cityName as Origin_Cities from Cities;"

		originCities <- dbGetQuery(con, query)
		temp <- "\nOrigin Cities:"
		for (c in originCities[[1]]){
			temp <- paste(temp,"\n",c,sep="")
		}
		cat("\n\nWhat is the origin city of your flight?\nHere are your options:\n\n",temp,"\n\nPlease type the name of a city from this list.\n\n> ")

		originCityName <- readline()
		originCityName <- dbGetQuery(con,paste("select cityName from Cities where lower(cityName)='",tolower(originCityName),"';",sep=""))[[1]][1]
		if(tolower(originCityName) == "toronto"){
			break
		}else if(tolower(originCityName) == "new york"){
			break
		}else if(tolower(originCityName) == "montreal"){
			break
		}else if(tolower(originCityName) == "london"){
			break
		}else if(tolower(originCityName) == "edinburgh"){
			break
		}else if(tolower(originCityName) == "chicago"){
			break
		}else if(tolower(originCityName) == "nice"){
			break
		}else if(tolower(originCityName) == "paris"){
			break
		}else if(chance < 1){
			cat("\n\nSorry cant give you more chances. The program will terminate.\n")
			dbDisconnect(con)
			stop()
		}
		chance = chance - 1
		cat("\n\nYou have ", chance, " more attempt(s) to correctly enter the origin city before the program terminates.\n\n")
	}
	

	chance <- 3

	repeat{

		query <- paste("SELECT cityName AS Destination_City from Cities, Flight where originCode=(select cityCode from Cities where lower(cityName)='",
			tolower(originCityName), "') and destCode = Cities.cityCode;",sep="")
	
		destinationCities <- dbGetQuery(con,query)
		temp <- "\nDestination Cities:"
		for (c in destinationCities[[1]]){
                        temp <- paste(temp,"\n",c,sep="")
                }
		cat("\n\nWhat is the destination city of your flight?\nHere are your options:\n\n",temp,"\n\nPlease type the name of a city from this list.\n\n> ")
		destinationCityName <- readline()
		destinationCityName <- dbGetQuery(con,paste("select cityName from Cities where lower(cityName)='",tolower(destinationCityName),"';",sep=""))[[1]][1]
		breakOut <- FALSE
		for (c in destinationCities[[1]]){

			if(tolower(c) == tolower(destinationCityName)){
				breakOut <- TRUE
				break
			}
		}
		if(breakOut){
			break
		}
		chance <- chance - 1
		if (chance < 1){
			cat("\n\nSorry cant give you more chances to enter the destination city correctly. The program will terminate.\n")
			dbDisconnect(con)
			stop()
		}
		cat("\n\nYou have ", chance, " more attempt(s) to correctly enter the destination city before the program terminates.\n\n")
	}

	cat("\n\nPlease Verify.\n\nOrigin City:		",originCityName,".\nDestination City:	",destinationCityName,
		".\n\nIs this information correct? (y/n)\n\n> ")
	input <- readline()
        if (input =='y' || input == 'Y'){
                break
        }
}	


if(tolower(originCityName) == "london" && tolower(destinationCityName) == 'toronto'){
	cat("\n\nSince you are flying from London to Toronto, you may choose between\nUnited or British Air. Please type your selection.\n\n> ")
	airline <- readline()
	if(tolower(airline) != "united" && tolower(airline) != "british air"){
		cat("\n\nYou have failed to answer correctly. You will fly on United Airlines.\n")
		airline <- "United" 
	}
	query <- paste("SELECT uniqueFlightNum FROM Flight where originCode=(SELECT cityCode FROM Cities WHERE lower(cityName)='",
                        tolower(originCityName), "') and destCode=(SELECT cityCode FROM Cities WHERE lower(cityName) ='",
                        tolower(destinationCityName), "') and airlineCode=(SELECT airlineCode FROM Airlines WHERE lower(airlineName)='",
			tolower(airlines),"');",sep="")
	flight <- dbGetQuery(con,query)
	uniqueFlightNum <- flight[[1]][1]
 
}else{
	query <- paste("SELECT uniqueFlightNum FROM Flight where originCode=(SELECT cityCode FROM Cities WHERE lower(cityName)='",
			tolower(originCityName), "') and destCode=(SELECT cityCode FROM Cities WHERE lower(cityName) ='",
			tolower(destinationCityName), "');",sep="")
	flight <- dbGetQuery(con,query)
        uniqueFlightNum <- flight[[1]][1]

}


query <- paste("SELECT originCode FROM Flight WHERE uniqueFlightNum='",uniqueFlightNum,"';")
bookingCity <- dbGetQuery(con,query)
bookingCityCode <- bookingCity[[1]][1]

query <- "SELECT uniqueBookingNum FROM booking;"
allBookingNums <- dbGetQuery(con,query)

uniqueBookingNum <- 0
dontRepeat <- TRUE
repeat{
	uniqueBookingNum <- sample(1234:8888,1)
	if(length(allBookingNums) < 1){
		break
	}
	for(c in allBookingNums[[1]]){
		if(c == uniqueBookingNum){
			dontRepeat <- FALSE
		}
	}
	if(dontRepeat){
		break
	}
}

query <- paste("INSERT INTO Booking(payingCustomerFirstName,payingCustomerLastName,payingCustomerStreet,payingCustomerPostalCode,",
		"uniqueBookingNum,cityCodeOfBooking,uniqueFlightNum) VALUES('",
                firstName, "', '",
                lastName, "', '",
                street, "', '",
                postalCode, "', '",
		uniqueBookingNum, "', '",
		bookingCityCode, "', '",
		uniqueFlightNum, "');", sep="")
dbGetQuery(con, query)

query <- paste("INSERT INTO Tickets(firstName,lastName,street,postalCode,uniqueBookingNum) VALUES('",
                firstName, "', '",
                lastName, "', '",
                street, "', '",
                postalCode, "', '",
                uniqueBookingNum, "');", sep="")
dbGetQuery(con, query)

query <- paste("select provinceName from Cities where cityName='",originCityName,"';",sep="")
originProvince <- dbGetQuery(con,query)[[1]][1]
query <- paste("select provinceName from Cities where cityName='",destinationCityName,"';",sep="")
destinationProvince <- dbGetQuery(con,query)[[1]][1]
query <- paste("select countryName from Provinces where provinceName='",originProvince,"';",sep="")
originCountry <- dbGetQuery(con,query)[[1]][1]
query <- paste("select countryName from Provinces where provinceName='",destinationProvince,"';",sep="")
destinationCountry <- dbGetQuery(con,query)[[1]][1]



flightSummary <- paste(customerSummary,
			"\n\n\nBooking Information:",
			"\n\tBooking Number:			", uniqueBookingNum,
			"\n\tFlight Number:			", uniqueFlightNum,
			"\n\tAirline:			", dbGetQuery(con,paste("select airlineName from airlines where airlineCode = (select flight.airlineCode from flight where flight.uniqueFlightNum='",uniqueFlightNum,"');",sep=""))[[1]][1], 
			"\n\nDeparture Information:",
			"\n\tOrigin City:			", originCityName,
			"\n\tOrigin Province:		", originProvince,
			"\n\tOrigin Country:			", originCountry,
			"\n\tDeparture Date:			", dbGetQuery(con,paste("select deptDate from flight where uniqueFLightNum='",uniqueFlightNum,"';",sep=""))[[1]][1],
                        "\n\tDeparture Hour:			",dbGetQuery(con,paste("select deptHour from flight where uniqueFLightNum='",uniqueFlightNum,"';",sep=""))[[1]][1],
			"\n\tDeparture Minute:		",dbGetQuery(con,paste("select deptMinute from flight where uniqueFLightNum='",uniqueFlightNum,"';",sep=""))[[1]][1],
			"\n\nArrival Information:",
			"\n\tDestination City:		", destinationCityName,
			"\n\tDestination Province:		", destinationProvince,
                        "\n\tDestination Country:            ", destinationCountry,
			"\n\tArrival Date:			", dbGetQuery(con,paste("select arrivalDate from flight where uniqueFLightNum='",uniqueFlightNum,"';",sep=""))[[1]][1],
                        "\n\tArrival Hour:			",dbGetQuery(con,paste("select arrivalHour from flight where uniqueFLightNum='",uniqueFlightNum,"';",sep=""))[[1]][1],
                        "\n\tArrival Minute:			",dbGetQuery(con,paste("select arrivalMinute from flight where uniqueFLightNum='",uniqueFlightNum,"';",sep=""))[[1]][1],sep="")



write(flightSummary, file=paste(PATHOFOUTPUT,"/HW6.flight",sep=""))

cat("\n\nYour flight has been recorded in the file HW6.flight.\n\n\nThank you for using the Airline Reservation System.\nYou have a wonderful journey.\n\n") 


dbDisconnect(con)