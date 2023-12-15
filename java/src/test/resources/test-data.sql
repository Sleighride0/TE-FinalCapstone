BEGIN TRANSACTION;

DROP TABLE IF EXISTS users, user_visits, exercise, equipment, exercise_details, exercise_equipment CASCADE;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
	);

CREATE TABLE user_visits (
        user_visit_id SERIAL PRIMARY KEY,
        user_id INTEGER,
        check_in_date TIMESTAMP WITH TIME ZONE NOT NULL,
        check_out_date TIMESTAMP WITH TIME ZONE,
        duration INTEGER,
        FOREIGN KEY (user_id) REFERENCES users(user_id)
    );
CREATE TABLE exercise (
    exercise_id SERIAL PRIMARY KEY,
    exercise_name varchar (50),
    user_id INT,
    date DATE,
    sets INT,
    reps INT,
    duration INT,
    weight DECIMAL(10, 2),
    mode varchar (30),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
CREATE TABLE equipment (
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(100)
);
-- rename to exercise_equipment as it is just a join for linking the exercise that uses equipment. move weight and reps to
--exercise table
CREATE TABLE exercise_equipment (
    exercise_id INT,
    equipment_id INT,
    PRIMARY KEY (exercise_id, equipment_id),
    FOREIGN KEY (exercise_id) REFERENCES exercise(exercise_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user1','user1','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('user2','user2','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('user3','user3','ROLE_USER');

INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-1 05:25:00', '2023-11-21 06:12:00', 47);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-7 06:35:00', '2023-11-23 07:32:00', 57);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-24 07:42:00', '2023-11-24 08:56:00', 74);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-28 04:36:00', '2023-11-28 05:43:00', 67);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-29 05:53:00', '2023-11-29 07:20:00', 87);

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-21', 1, 0, 25, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 1, '2023-11-21', 3, 10, 0, 15, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-23', 1, 0, 20, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Pulley', 1, '2023-11-23', 3, 12, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Lat Pulldown', 1, '2023-11-23', 3, 12, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-23', 1, 0, 15, 0, 'duration');

INSERT INTO equipment (equipment_id, equipment_name) VALUES (1,'Bench Press');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (2, 'Treadmill');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (3, 'Dumbbells');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (4, 'Lat Pulldown');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (5, 'Rowing Machine');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (6, 'Stairmaster');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (7, 'Squats');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (8, 'Russian Twist');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (9, 'Leg Press Machine');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (10, 'Fly');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (11, 'Dips');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (12, 'Abdominal Crunch');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (13, 'Elliptical Machine');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (14, 'Deadlift');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (15, 'Planks');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (16, 'Assault Bike');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (17, 'Push Ups');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (18, 'Pulley');

COMMIT TRANSACTION;
