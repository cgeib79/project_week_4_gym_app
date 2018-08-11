DROP TABLE if exists members;

CREATE TABLE members(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  membership_tier VARCHAR(255)
);
