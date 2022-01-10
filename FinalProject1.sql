Select *
FROM PortolioProjectCovid.dbo.coviddata
WHERE continent is not null 
Order by 3,4


Select location, date, total_cases, new_cases, total_deaths, population
FROM PortolioProjectCovid.dbo.coviddata
Order by 1,2

--Looking at Total Cases vs Total Deaths
--Shows likelihood of dying if you contract covid in your country

Select location, date, total_cases, total_deaths, (total_deaths/ total_cases)*100 as DeathPercentage
FROM PortolioProjectCovid.dbo.coviddata
WHERE location like '%state%'
Order by 1,2

--Looking at Total Cases vs Population
--Shows what percentage of population got Covid

Select location, date,population, total_cases, (total_cases/ population)*100 as PercentPopulationInfected
FROM PortolioProjectCovid.dbo.coviddata
WHERE location like '%state%'
Order by 1,2

--Looking at countries with highest infection rate compared to population

Select location, population, Max(total_cases) as Infections, MAX(total_cases/ population)*100 as PercentPopulationInfected
FROM PortolioProjectCovid.dbo.coviddata
group by location, population
Order by PercentPopulationInfected DESC

--Showing countries with the highest death count per population

Select location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortolioProjectCovid.dbo.coviddata
WHERE continent is not null
group by location
Order by TotalDeathCount DESC

--Showing Continents with the Highest Death Count

Select location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortolioProjectCovid.dbo.coviddata
WHERE continent is null
group by location
Order by TotalDeathCount DESC

--Global Numbers

Select date, SUM(new_cases) as GlobalCases, Sum(cast( new_deaths as int)) as GlobalDeaths, Sum(cast( new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
FROM PortolioProjectCovid.dbo.coviddata
WHERE continent is not null
Group by date
Order by 1,2

--Total Global Cases and Deaths

Select SUM(new_cases) as GlobalCases, Sum(cast( new_deaths as int)) as GlobalDeaths, Sum(cast( new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
FROM PortolioProjectCovid.dbo.coviddata
WHERE continent is not null
--Group by date
Order by 1,2


--Use CTE

with PopvsVac (continent, location, date, population, new_vaccinations, RollingVaccineCount) as
(
Select cov.continent, cov.location, cov.date, cov.population, vac.new_vaccinations, SUM(convert(bigint,vac.new_vaccinations)) OVER (Partition by cov.location order by cov.location, cov.date) as RollingVaccineCount

FROM PortolioProjectCovid.dbo.coviddata cov
join PortolioProjectCovid.dbo.vaccinations vac
on cov.location = vac.location  
and cov.date = vac.date
WHERE cov.continent is not null
)
Select*, (RollingVaccineCount/ population)*100 as PercentVaccinated 
FROM PopvsVac

--Temp Table

Drop Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar (255),
Location nvarchar (255),
Date datetime,
population numeric,
new_vaccinations numeric,
RollingVaccineCount numeric
)

 
INSERT INTO #PercentPopulationVaccinated
Select cov.continent, cov.location, cov.date, cov.population, vac.new_vaccinations, SUM(convert(bigint,vac.new_vaccinations)) OVER (Partition by cov.location order by cov.location, cov.date) as RollingVaccineCount

FROM PortolioProjectCovid.dbo.coviddata cov
join PortolioProjectCovid.dbo.vaccinations vac
on cov.location = vac.location  
and cov.date = vac.date
WHERE cov.continent is not null

Select*, (RollingVaccineCount/ population)*100 as PercentVaccinated 
FROM #PercentPopulationVaccinated

--Creating view to storge data for future visualizations

Create View CountriesInfectionRate as
Select location, population, Max(total_cases) as Infections, MAX(total_cases/ population)*100 as PercentPopulationInfected
FROM PortolioProjectCovid.dbo.coviddata
group by location, population


