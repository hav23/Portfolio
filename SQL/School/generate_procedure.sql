use world;

DELIMITER //
CREATE PROCEDURE GetCountryStatistic(
	IN countryName VARCHAR(255)
)
BEGIN
 select country.name, country.continent, country.region, city.name, city.population from country
 inner join city
 on country.code = city.CountryCode
 where country.name = countryName;
END // 

CREATE PROCEDURE GetContinentData(
	IN Continent_name VARCHAR(255)
)
BEGIN
 select country.name, country.continent, country.region, country.population from country
 where country.continent = Continent_name
 order by country.name asc;
END //

CREATE PROCEDURE GetCityData(
	IN City_name VARCHAR(255)
)
BEGIN
 select city.name, city.district, city.population, city.population/country.population*100 as '% of country pop', country.name from city
 inner join country 
 on city.countrycode=country.code
 where city.name = City_name
 order by city.name asc;
END // 
Delimiter ;
