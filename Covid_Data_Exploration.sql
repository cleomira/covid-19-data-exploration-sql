-- Total Records
select*from coviddeaths1;
SELECT COUNT(*)
FROM coviddeaths1;

-- Date Range
SELECT
MIN(date) AS start_date,
MAX(date) AS end_date
FROM coviddeaths1;

-- Countries with Highest Total Cases
SELECT
location,
MAX(total_cases) AS highest_cases
FROM coviddeaths1
GROUP BY location
ORDER BY highest_cases DESC
LIMIT 10;

-- Countries with Highest Death Count
SELECT
location,
MAX(total_deaths) AS highest_deaths
FROM coviddeaths1
GROUP BY location
ORDER BY highest_deaths DESC
LIMIT 10;

-- Highest Infection Rate Relative to Population
SELECT
location,
population,
MAX(total_cases) AS cases,
(MAX(total_cases)/population)*100 AS infection_rate
FROM coviddeaths1
GROUP BY location, population
ORDER BY infection_rate DESC;

-- Highest Death Rate
SELECT
location,
MAX(total_deaths) AS deaths,
(MAX(total_deaths)/population)*100 AS death_rate
FROM coviddeaths1
GROUP BY location, population
ORDER BY death_rate DESC;

-- Cases by Continent
SELECT
continent,
MAX(total_cases) AS total_cases
FROM coviddeaths1
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY total_cases DESC;

-- Deaths by Continent
SELECT
continent,
MAX(total_deaths) AS total_deaths
FROM coviddeaths1
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY total_deaths DESC;

-- Global Cases by Date
SELECT
date,
SUM(new_cases) AS daily_cases
FROM coviddeaths1
GROUP BY date
ORDER BY date;

-- Global Deaths by Date
SELECT
date,
SUM(new_deaths) AS daily_deaths
FROM coviddeaths1
GROUP BY date
ORDER BY date;

-- Death Percentage by Country
SELECT
location,
MAX(total_cases) AS cases,
MAX(total_deaths) AS deaths,
(MAX(total_deaths)/MAX(total_cases))*100 AS death_percentage
FROM coviddeaths1
GROUP BY location
ORDER BY death_percentage DESC;

-- Average Reproduction Rate by Country
SELECT
location,
AVG(reproduction_rate) AS avg_reproduction_rate
FROM coviddeaths1
GROUP BY location
ORDER BY avg_reproduction_rate DESC;

-- Countries with Highest ICU Burden
SELECT
location,
MAX(icu_patients) AS peak_icu_patients
FROM coviddeaths1
GROUP BY location
ORDER BY peak_icu_patients DESC;

-- Running Total of Cases
SELECT
location,
date,
new_cases,
SUM(new_cases)
OVER(PARTITION BY location ORDER BY date)
AS running_total_cases
FROM coviddeaths1;

