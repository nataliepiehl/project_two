-- Create tables for raw data to be loaded into
CREATE TABLE County (
id INT PRIMARY KEY,
fips TEXT,
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
county TEXT,
total_law_enforcement_employees INT,
total_officers INT,
total_civilians INT,
state_name TEXT
);

CREATE TABLE Voting (
id INT PRIMARY KEY,
state_name TEXT,
state_abbreviation TEXT,
county TEXT,
fips TEXT,
party TEXT,
candidate TEXT,
votes INT,
fraction_votes FLOAT
);

CREATE TABLE County_Dict (
id INT PRIMARY KEY,
column_name TEXT,
long_description TEXT,
short_description TEXT
);



-- Join One
select Voting.state_name,
Voting.county,
Voting.party,
Voting.candidate,
Voting.votes,
County.pop_2014,
County.pct_hs_grad,
County.pct_post_bach_grad
from Voting
left join County
on (Voting.state_name = County.state_name)
and (Voting.county = County.county)
where Voting.state_name = 'Illinois';


-- Join 2
select Police.county,
Police.total_law_enforcement_employees,
Police.total_officers,
Police.total_civilians,
Police.state_name,
Voting.party,
Voting.candidate,
Voting.votes
from Voting
left join Police
on (Voting.state_name = Police.state_name)
and (Voting.county = Police.county)
where Voting.state_name = 'Illinois';


-- Join 3
select County.county,
County.per_capita_income,
County.median_household_income,
County.sq_miles,
County.pop_per_sq_mile,
Police.total_law_enforcement_employees,
Police.total_officers,
Police.total_civilians,
Police.state_name,
Voting.party,
Voting.candidate,
Voting.votes
from Voting
left join Police
on (Voting.state_name = Police.state_name)
and (Voting.county = Police.county)
left join County
on (Voting.state_name = County.state_name)
and (Voting.county = County.county)
where Police.state_name = 'Illinois';

