DROP TABLE if exists member_classes;
DROP TABLE if exists members;
DROP TABLE if exists fitness_classes;

CREATE TABLE members(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  membership_tier VARCHAR(255)
);

CREATE TABLE fitness_classes(
  id SERIAL PRIMARY KEY,
  fitness_class_name VARCHAR(255),
  fitness_class_time TIME,
  peak_category VARCHAR(255),
  fitness_class_max_size INT
);

CREATE TABLE member_classes(
  member_id INTERNAL REFERENCES members(id) ON DELETE CASCADE;
  fitness_class_id INTERNAL REFERENCES fitness_classes(id) ON DELETE CASCADE,
  fitness_class_max_size INTERNAL REFERENCES fitness_classes(id) ON DELETE CASCADE,
  list_members_per_class SET
);
