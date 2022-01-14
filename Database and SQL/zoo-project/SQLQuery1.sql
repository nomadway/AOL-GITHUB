CREATE DATABASE db_zoo;

CREATE TABLE tbl_animalia(
	animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,2),
	animalia_type VARCHAR(30)NOT NULL
	);

INSERT INTO tbl_animalia (animalia_type)
	VALUES
	('vertebrate'),
	('invertebrate');

SELECT *
FROM tbl_animalia;
-----------------------------------------------------------------
CREATE TABLE tbl_class(
	class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	class_type VARCHAR(50) NOT NULL);

INSERT INTO tbl_class(class_type)
	VALUES
	('bird'),
	('reptilian'),
	('mammal'),
	('arthropod'),
	('fish'),
	('worm'),
	('cnidaria'),
	('echinoderm');

SELECT * FROM tbl_class;

---------------------------------------
UPDATE tbl_class 
SET class_type = 'birds'
WHERE class_type = 'bird';

SELECT REPLACE(class_type, 'bird', 'birds')
FROM tbl_class;

SELECT class_type
FROM tbl_class
WHERE class_type = 'bird';

SELECT UPPER(class_type)
FROM tbl_class
WHERE class_type = 'bird';

SELECT COUNT(class_type)
FROM tbl_class
WHERE class_type = 'bird';

----------------------------------------------------------
CREATE TABLE tbl_persons(
	persons_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	persons_fname VARCHAR(50) NOT NULL,
	persons_lname VARCHAR(50) NOT NULL,
	persons_contact VARCHAR(50) NOT NULL);

INSERT INTO tbl_persons(persons_fname, persons_lname, persons_contact)
VALUES
('bob', 'smith', '232-345-5768'),
('marry', 'ann', '232-345-5768'),
('tim', 'martin', '232-345-5768'),
('john', 'lee', '232-345-5768'),
('myke', 'tyson', '232-345-5768');

SELECT persons_fname, persons_lname, persons_contact
FROM tbl_persons
WHERE persons_id BETWEEN 1 AND 5;


SELECT persons_fname, persons_lname, persons_contact
FROM tbl_persons
WHERE persons_lname LIKE 'ty%';

--------------------------------------------------------------------------
SELECT persons_fname, persons_lname, persons_contact
FROM tbl_persons
WHERE persons_lname LIKE '_t%n';

UPDATE tbl_persons
SET persons_fname = 'chan' 
WHERE persons_fname = 'bob';

SELECT persons_fname, persons_lname, persons_contact
FROM tbl_persons
WHERE persons_fname LIKE 't%'
ORDER BY persons_lname;

SELECT persons_fname AS 'First Name',
		persons_lname AS 'Last Name',
		persons_contact AS 'Phone:'
FROM tbl_persons
WHERE persons_fname LIKE 't%'
ORDER BY persons_lname;

DELETE FROM tbl_persons
WHERE persons_lname = 'smith';

DROP TABLE tbl_persons;

----------------------------------------------------------------------------------
CREATE TABLE tbl_order(
	order_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	order_type VARCHAR(50)NOT NULL
);
CREATE TABLE tbl_care(
	care_id VARCHAR(50) PRIMARY KEY NOT NULL,
	care_type VARCHAR(50) NOT NULL,
	care_specialist INT NOT NULL
);
CREATE TABLE tbl_nutrition(
	nutrition_id INT PRIMARY KEY NOT NULL IDENTITY (2200,1),
	nutrition_type VARCHAR(50) NOT NULL,
	nutrition_cost MONEY NOT NULL
);
CREATE TABLE tbl_habitat(
	habitat_id INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
	habitat_type VARCHAR(50) NOT NULL,
	habitat_cost MONEY NOT NULL
);
CREATE TABLE tbl_specialist(
	specialist_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	specialist_fname VARCHAR(50) NOT NULL,
	specialist_lname VARCHAR(50) NOT NULL,
	specialist_contact VARCHAR(50) NOT NULL
);
---------------------------------------------------------------------
INSERT INTO tbl_order(order_type)
	VALUES
	('carnivore'),
	('herbivore'),
	('omnivore')
;

SELECT * FROM tbl_order;

INSERT INTO tbl_care(care_id, care_type, care_specialist)
	VALUES
	('care_0', 'replace the straw', 1),
	('care_1', 'repair or replace broken toys', 4),
	('care_2', 'bottle feed vitamins', 1),
	('care_3', 'human contact_pet subject', 2),
	('care_4', 'clean up animal waste', 1),
	('care_5', 'move subject to exercise pen', 3),
	('care_6', 'drain and refill aquarium', 1),
	('care_7', 'extensive dental work', 3)
;

SELECT * FROM tbl_care;
-------------------------------------------------------------------------

INSERT INTO tbl_nutrition(nutrition_type, nutrition_cost)
	VALUES
	('raw fish', 1500),
	('living rodents', 600),
	('mixture of fruit and rice', 800),
	('warm bottle of milk', 600),
	('syringe fed broth', 600),
	('lard and seed mix', 300),
	('aphids', 150),
	('vitamins and marrow', 3500)
;

SELECT * FROM tbl_nutrition;

INSERT INTO tbl_habitat(habitat_type, habitat_cost)
	VALUES
	('tundra', 40000),
	('grassy knoll with trees', 12000),
	('10 ft pond and rocks', 30000),
	('icy aquarium with snowy facade', 50000),
	('short grass, shade and moat ', 50000),
	('netted forrest atrium', 10000),
	('jungle vines and winding branches', 15000),
	('cliff with shaded cave', 15000)
;

SELECT * FROM tbl_habitat;
----------------------------------------------------------------

INSERT INTO tbl_specialist(specialist_fname, specialist_lname, specialist_contact)
	VALUES
	('margaret', 'nguyen', '384-576-28899'),
	('mary', 'fischer', '384-784-4856'),
	('arnold', 'holden', '385-475-3944'),
	('kem', 'byesan', '384-485-4855'),
	('delmonte', 'fyedo', '768-288-3749')
;

SELECT * FROM tbl_specialist;

---------------------------------------------------------------------------------------
CREATE TABLE tbl_species(
	species_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	species_name VARCHAR(50) NOT NULL,
	species_animalia INT NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tbl_animalia(animalia_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_class INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_order INT NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_habitat INT NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tbl_habitat(habitat_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_nutrition INT NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tbl_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_care VARCHAR(50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tbl_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_species(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
	VALUES
	('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
	('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
	('penguin', 1, 100, 1, 5003, 2200, 'care_6' ),
	('ghost bat', 1, 102, 1, 5007, 2204, 'care_2'),
	('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
	('panda', 1, 102, 3, 5006, 2202, 'care_4'),
	('bobcat', 1, 102, 1, 5001, 2204, 'care_5'),
	('grey wolf', 1, 102, 1, 5000, 2201, 'care_4')
;

SELECT * FROM tbl_species;


---------------------------------------------------------------------------------------------------

SELECT *
FROM tbl_species
WHERE species_name = 'chicken';

SELECT 
	a1.species_name, a2.animalia_type, a3.class_type, a4.order_type, a5.habitat_type, a6.nutrition_type, a7.care_type
FROM tbl_species a1
	INNER JOIN tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
	INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN tbl_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tbl_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'brown bear'
;

SELECT
	a1.species_name, a2.habitat_type, a2.habitat_cost, a3.nutrition_type, a3.nutrition_cost
FROM tbl_species a1
	INNER JOIN tbl_habitat a2 ON a2.habitat_id = a1.species_habitat
	INNER JOIN tbl_nutrition a3 ON a3.nutrition_id = a1.species_nutrition
	WHERE species_name = 'ghost bat'
;

---------------------------------------------------------------------------------------------
SELECT * FROM tbl_nutrition;

SELECT * FROM tbl_species;

SELECT *
FROM tbl_nutrition
	INNER JOIN tbl_species ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id;


------------------------------------------
/*
Zoo Assignment #-1
SELECT * FROM tbl_habitat;
Zoo Assignment #-2
SELECT * FROM tbl_species
WHERE species_id = 3;
Zoo Assignment #-3
SELECT * FROM tbl_nutrition
WHERE nutrition_cost <= 600;
Zoo Assignment #-4
SELECT nutrition_id, species_name 
FROM tbl_nutrition
	INNER JOIN tbl_species ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id
	WHERE nutrition_id BETWEEN 2202 AND 2206;
Zoo Assignment #-5
SELECT nutrition_type AS 'Nutrition Type', species_name AS 'Species Name' 
FROM tbl_nutrition
	INNER JOIN tbl_species ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id
Zoo Assignment #-6
SELECT  specialist_fname, specialist_lname, specialist_contact
FROM tbl_specialist
	INNER JOIN tbl_species ON tbl_species.species_id = tbl_specialist.specialist_id
WHERE species_name = 'penguin';
*/

--ASSIGMENT-7--

CREATE DATABASE db_movies;

CREATE TABLE tbl_actors(
	actors_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	actor_name VARCHAR(50) NOT NULL,
	movie_name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_directors(
	director_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	director_name VARCHAR(50) NOT NULL,
	movie_name INT NOT NULL CONSTRAINT fk_movie_id FOREIGN KEY REFERENCES tbl_actors(actors_id) ON UPDATE CASCADE ON DELETE CASCADE
	
);

INSERT INTO tbl_actors(actor_name, movie_name)
	VALUES
	('Arnold Shwarz', 'Terminator'),
	('Keanu Reeves', 'John Wick'),
	('Arnold Boss', 'Predator'),
	('Bruce Lee', 'First Kick'),
	('Jacky Chan', 'Little Tokyo');



INSERT INTO tbl_directors(director_name, movie_name)
	VALUES
	('Tony Brusk', 'Predator'),
	('Anthony Hopking', 'John Wick'),
	('Mark Dacascus', 'Freeman'),
	('Steven Spielberg', 'Robocop'),
	('Mike Ross', 'Holy Crap');

SELECT * FROM tbl_actors;
SELECT * FROM tbl_directors;

--MODULE-8----School Assignment------------------------------------

CREATE DATABASE db_school;

CREATE TABLE tbl_school(
	class_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	class_name VARCHAR(50) NOT NULL
);

/*thin the Students table, add the following foreign keys:
a. Class_ID
b. Instructor_ID*/ 
CREATE TABLE tbl_students(
	student_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	student_name VARCHAR(50) NOT NULL
	class_id INT FOREIGN KEY REFERENCES tbl_school(class_id)
	instructor_id INT FOREIGN KEY REFERENCES tbl_instructors(instructor_id)
);

CREATE TABLE tbl_instructors(
	instructor_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	instructor_name VARCHAR (50) NOT NULL
);

SELECT * FROM tbl_school;
SELECT * FROM tbl_students;
SELECT * FROM tbl_instructors;




CREATE TABLE tbl_actors(
	actors_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	actor_name VARCHAR(50) NOT NULL,
	movie_name VARCHAR(50) NOT NULL
);








































































































	










