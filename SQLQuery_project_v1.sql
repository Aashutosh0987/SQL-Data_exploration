SELECT * 
FROM SQL_DA_PROJECT.dbo.CovidDeaths
WHERE continent IS NOT NULL
Order BY 3,4

--select the data that we are going to use
SELECT Location,date,total_cases,new_cases,total_deaths,population
FROM SQL_DA_PROJECT.dbo.CovidDeaths
ORDER BY 1,2

--LOOKING AT TOTAL CASES VS TOTAL DEATHS
-- calculating death rate in general and for any country
SELECT Location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 AS DeathRate
FROM SQL_DA_PROJECT.dbo.CovidDeaths
WHERE location = 'India'
ORDER BY 1,2

-- observing total cases vs population
-- how much % of population contracted covid - 19

SELECT Location,date,population,total_cases,(total_cases/population)*100 AS positivity_rate
FROM SQL_DA_PROJECT.dbo.CovidDeaths
WHERE location = 'India'
ORDER BY 1,2


-- countries with highest positivity rate compared to population

SELECT Location,population,MAX(total_cases) as HighInfection,MAX((total_cases/population))*100 AS positivity_rate
FROM SQL_DA_PROJECT.dbo.CovidDeaths
GROUP BY location,population
ORDER BY positivity_rate DESC


-- Displaying countries with highest death rate

SELECT Location,population,MAX(cast(total_deaths as int)) as deaths_max
FROM SQL_DA_PROJECT.dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY Location,population
ORDER BY deaths_max DESC

-- CONTINENT WISE DATA
SELECT continent,MAX(cast(total_deaths as int)) as deaths_max
FROM SQL_DA_PROJECT.dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY deaths_max DESC

SELECT location,MAX(cast(total_deaths as int)) as deaths_max
FROM SQL_DA_PROJECT.dbo.CovidDeaths
WHERE continent IS NULL
GROUP BY location
ORDER BY deaths_max DESC

-- World Numbers

SELECT Location, date,population,total_cases,total_deaths,(total_deaths/total_cases)*100 AS death_rate
FROM SQL_DA_PROJECT.dbo.CovidDeaths
--WHERE location = 'india'
where continent is not null
ORDER BY 1,2

--total cases in world
SELECT SUM(new_cases) AS total_cases, SUM(CAST(new_deaths as int)) AS total_deaths,
SUM(CAST(new_deaths AS int))/SUM(new_cases)*100 AS DEATHRATE
FROM SQL_DA_PROJECT.dbo.CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2