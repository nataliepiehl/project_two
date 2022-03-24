-- Create tables for raw data to be loaded into
CREATE TABLE County (
id INT PRIMARY KEY,
fips INT,
county TEXT,
state_abbreviation TEXT,
pop_2014 INT,
pct_pop_delt10to14 FLOAT,
pop_2010 INT,
pct_hs_grad FLOAT,
pct_post_bach_grad FLOAT,
per_capita_income INT,
median_household_income INT,
sq_miles INT,
pop_per_sq_mile INT,
state_name TEXT
);

CREATE TABLE Police (
id INT PRIMARY KEY,
total_law_enforcement_employees INT,
total_officers INT,
total_civilians INT,
state_name TEXT
);


-- -- Joins tables
-- SELECT customer_name.id, customer_name.first_name, customer_name.last_name, customer_location.address, customer_location.us_state
-- FROM customer_name
-- JOIN customer_location
-- ON customer_name.id = customer_location.id;