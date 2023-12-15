BEGIN TRANSACTION;

--Registered users
INSERT INTO users (user_id,username,password_hash,role) VALUES (1,'user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id,username,password_hash,role) VALUES (2,'admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (user_id,username,password_hash,role) VALUES (3,'employee','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_EMPLOYEE');
INSERT INTO users (user_id,username,password_hash,role) VALUES (4,'user2','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id,username,password_hash,role) VALUES (5,'user3','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');

--1st Member's Logged Visits
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-21 05:25:00', '2023-11-21 06:12:00', 47);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-23 06:35:00', '2023-11-23 07:32:00', 57);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-24 07:42:00', '2023-11-24 08:56:00', 74);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-28 04:36:00', '2023-11-28 05:43:00', 67);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-29 05:53:00', '2023-11-29 07:20:00', 87);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-30 07:12:00', '2023-11-30 09:00:00', 108);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-01 07:25:00', '2023-12-01 08:57:00', 92);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-04 07:10:00', '2023-12-04 09:00:00', 110);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-05 06:58:00', '2023-12-05 08:30:00', 92);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-07 07:15:00', '2023-12-07 08:45:00', 90);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-08 07:32:00', '2023-12-08 08:25:00', 53);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-09 03:22:00', '2023-12-09 07:18:00', 236);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-12 07:47:00', '2023-12-12 08:32:00', 45);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-13 06:27:00', '2023-12-13 08:39:00', 132);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-14 05:12:00', '2023-12-14 07:25:00', 133);

-- 2nd Member's Logged Visits
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-11-22 10:15:00', '2023-11-22 11:05:00', 50);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-11-23 13:45:00', '2023-11-23 14:45:00', 60);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-11-24 17:00:00', '2023-11-24 18:15:00', 75);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-11-28 12:30:00', '2023-11-28 13:30:00', 60);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-11-29 12:00:00', '2023-11-29 13:30:00', 90);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-11-30 14:45:00', '2023-11-30 16:30:00', 105);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-12-01 15:15:00', '2023-12-01 16:45:00', 90);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-12-04 15:00:00', '2023-12-04 17:00:00', 120);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-12-05 13:45:00', '2023-12-05 15:15:00', 90);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-12-07 15:30:00', '2023-12-07 17:00:00', 90);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-12-08 16:00:00', '2023-12-08 16:45:00', 45);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-12-09 10:00:00', '2023-12-09 13:45:00', 225);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-12-12 16:30:00', '2023-12-12 17:15:00', 45);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-12-13 15:00:00', '2023-12-13 17:00:00', 120);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (4, '2023-12-14 11:15:00', '2023-12-14 13:15:00', 120);

--3rd Member's Logged Visits

INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-11-22 08:15:00', '2023-11-22 10:30:00', 135);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-11-23 12:30:00', '2023-11-23 15:45:00', 195);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-11-23 17:15:00', '2023-11-23 19:00:00', 105);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-11-24 10:00:00', '2023-11-24 12:15:00', 135);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-11-24 14:45:00', '2023-11-24 16:30:00', 105);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-11-24 18:00:00', '2023-11-24 19:45:00', 105);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-11-25 11:00:00', '2023-11-25 13:00:00', 120);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-11-25 15:30:00', '2023-11-25 17:00:00', 90);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-11-29 09:15:00', '2023-11-29 11:00:00', 105);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-11-29 14:00:00', '2023-11-29 15:30:00', 90);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-11-29 18:15:00', '2023-11-29 19:45:00', 90);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-12-02 10:30:00', '2023-12-02 12:00:00', 90);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-12-02 14:45:00', '2023-12-02 16:30:00', 105);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-12-02 18:30:00', '2023-12-02 20:00:00', 90);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-12-05 10:30:00', '2023-12-05 12:15:00', 105);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-12-05 14:00:00', '2023-12-05 15:30:00', 90);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-12-05 18:45:00', '2023-12-05 20:15:00', 90);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-12-10 09:45:00', '2023-12-10 11:30:00', 105);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-12-10 14:30:00', '2023-12-10 16:00:00', 90);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (5, '2023-12-10 18:45:00', '2023-12-10 20:15:00', 90);

--Employee Logged Visits
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (3, '2023-11-01 08:00:00', '2023-11-01 09:00:00', 60);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (3, '2023-11-11 08:00:00', '2023-11-11 09:00:00', 60);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (3, '2023-11-30 08:15:00', '2023-11-30 08:45:00', 30);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (3, '2023-12-05 10:00:00', '2023-12-05 11:00:00', 60);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (3, '2023-12-03 09:00:00', '2023-12-03 09:30:00', 30);

--Members Logged Workout

--1st Member's Logged Workout
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-21', 1, 0, 25, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 1, '2023-11-21', 3, 10, 0, 15, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-23', 1, 0, 20, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Pulley', 1, '2023-11-23', 3, 12, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Lat Pulldown', 1, '2023-11-23', 3, 12, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-23', 1, 0, 15, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-24', 1, 0, 34, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Fly', 1, '2023-11-24', 5, 10, 0, 73, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 1, '2023-11-24', 3, 10, 0, 65, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Rowing Machine', 1, '2023-11-24', 3, 0, 25, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Stairmaster', 1, '2023-11-24', 1, 0, 25, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-28', 1, 0, 34, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 1, '2023-11-28', 3, 7, 0, 15, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 1, '2023-11-28', 3, 10, 0, 65, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 1, '2023-11-28', 3, 12, 0, 15, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-29', 1, 0, 45, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 1, '2023-11-29', 3, 7, 0, 15, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Lat Pulldown', 1, '2023-11-29', 3, 10, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 1, '2023-11-29', 3, 10, 0, 65, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dips', 1, '2023-11-29', 3, 4, 0, 0, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-30', 1, 0, 32, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Rowing Machine', 1, '2023-11-30', 2, 0, 16, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Stairmaster', 1, '2023-11-30', 1, 0, 37, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-01', 1, 0, 42, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 1, '2023-12-01', 3, 10, 0, 65, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Lat Pulldown', 1, '2023-12-01', 3, 10, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Rowing Machine', 1, '2023-12-01', 3, 0, 25, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-04', 1, 0, 54, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Fly', 1, '2023-12-04', 5, 10, 0, 73, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dips', 1, '2023-12-04', 3, 4, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Deadlift', 1, '2023-12-04', 4, 8, 0, 135, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 1, '2023-12-04', 3, 8, 0, 65, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-05', 1, 0, 32, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Abdominal Crunch', 1, '2023-12-05', 3, 12, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Russian Twist', 1, '2023-12-05', 4, 0, 7, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-05', 1, 0, 25, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-07', 1, 0, 45, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Leg Press Machine', 1, '2023-12-07', 3, 10, 0, 65, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Squats', 1, '2023-12-07', 3, 10, 0, 95, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Elliptical Machine', 1, '2023-12-07', 1, 0, 24, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-09', 1, 0, 60, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 1, '2023-12-09', 3, 10, 0, 25, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Pull Ups', 1, '2023-12-09', 3, 15, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Rowing Machine', 1, '2023-12-09', 3, 0, 48, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Abdominal Crunch', 1, '2023-12-09', 3, 10, 0, 25, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 1, '2023-12-09', 3, 10, 0, 95, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-12', 1, 0, 28, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Fly', 1, '2023-12-12', 3, 10, 0, 73, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 1, '2023-12-12', 3, 10, 0, 20, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-13', 1, 0, 60, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Planks', 1, '2023-12-13', 3, 0, 6, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Russian Twist', 1, '2023-12-13', 3, 0, 5, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Lat Pulldown', 1, '2023-12-13', 3, 10, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Stairmaster', 1, '2023-12-13', 1, 0, 20, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-14', 1, 0, 54, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dips', 1, '2023-12-14', 3, 5, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 1, '2023-12-14', 3, 10, 0, 20, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Pull Ups', 1, '2023-12-14', 3, 12, 0, 0, 'reps');

--2nd Member's Logged Workout
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Lat Pulldown', 4, '2023-11-22', 3, 12, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 4, '2023-11-22', 1, 0, 25, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 4, '2023-11-23', 1, 0, 40, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Abdominal Crunch', 4, '2023-11-23', 3, 15, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 4, '2023-11-23', 3, 8, 0, 75, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Pull Ups', 4, '2023-11-23', 3, 12, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dips', 4, '2023-11-23', 3, 6, 0, 0, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 4, '2023-11-25', 1, 0, 35, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Fly', 4, '2023-11-25', 5, 10, 0, 73, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 4, '2023-11-25', 3, 10, 0, 65, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Stairmaster', 4, '2023-11-25', 1, 0, 30, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Planks', 4, '2023-11-25', 3, 8, 0, 0, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 4, '2023-12-02', 1, 0, 45, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Abdominal Crunch', 4, '2023-12-02', 3, 15, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 4, '2023-12-02', 3, 10, 0, 100, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Pull Ups', 4, '2023-12-02', 3, 15, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Rowing Machine', 4, '2023-12-02', 1, 0, 50, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 4, '2023-12-02', 3, 7, 0, 15, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 4, '2023-12-03', 1, 0, 45, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 4, '2023-12-03', 3, 10, 0, 25, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Lat Pulldown', 4, '2023-12-03', 3, 10, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 4, '2023-12-03', 3, 10, 0, 65, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dips', 4, '2023-12-03', 3, 4, 0, 0, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Rowing Machine', 4, '2023-12-05', 1, 0, 45, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Squats', 4, '2023-12-05', 4, 10, 0, 90, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Deadlift', 4, '2023-12-05', 4, 8, 0, 140, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Russian Twist', 4, '2023-12-05', 4, 10, 10, 0, 'seconds');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Assault Bike', 4, '2023-12-05', 1, 0, 20, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 4, '2023-12-10', 1, 0, 50, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Fly', 4, '2023-12-10', 5, 12, 0, 80, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Deadlift', 4, '2023-12-10', 4, 8, 0, 150, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Planks', 4, '2023-12-10', 3, 7, 7, 0, 'seconds');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Assault Bike', 4, '2023-12-10', 1, 0, 15, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 4, '2023-12-14', 1, 0, 60, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 4, '2023-12-14', 3, 10, 0, 25, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Pull Ups', 4, '2023-12-14', 3, 15, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Rowing Machine', 4, '2023-12-14', 1, 0, 50, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Abdominal Crunch', 4, '2023-12-14', 3, 12, 25, 0, 'lbs');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 4, '2023-12-14', 3, 10, 0, 100, 'reps');

--3rd Member's Logged Workout
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Lat Pulldown', 5, '2023-11-22', 3, 12, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 5, '2023-11-22', 1, 0, 25, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 5, '2023-11-23', 1, 0, 40, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Abdominal Crunch', 5, '2023-11-23', 3, 15, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 5, '2023-11-23', 3, 8, 0, 75, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Pull Ups', 5, '2023-11-23', 3, 12, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dips', 5, '2023-11-23', 3, 6, 0, 0, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 5, '2023-11-24', 3, 10, 0, 20, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Rowing Machine', 5, '2023-11-24', 3, 0, 25, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Stairmaster', 5, '2023-11-24', 1, 0, 25, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Fly', 5, '2023-11-24', 5, 10, 0, 73, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 5, '2023-11-24', 3, 10, 0, 65, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 5, '2023-11-25', 1, 0, 35, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Fly', 5, '2023-11-25', 5, 10, 0, 73, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 5, '2023-11-25', 3, 10, 0, 65, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Stairmaster', 5, '2023-11-25', 1, 0, 30, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Planks', 5, '2023-11-25', 3, 8, 0, 0, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 5, '2023-11-29', 3, 7, 0, 15, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Lat Pulldown', 5, '2023-11-29', 3, 10, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 5, '2023-11-29', 3, 10, 0, 65, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dips', 5, '2023-11-29', 3, 4, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 5, '2023-11-29', 1, 0, 45, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Rowing Machine', 5, '2023-12-02', 1, 0, 45, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Squats', 5, '2023-12-02', 4, 10, 0, 90, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Deadlift', 5, '2023-12-02', 4, 8, 0, 140, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Assault Bike', 5, '2023-12-02', 1, 0, 20, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 5, '2023-12-02', 3, 7, 0, 15, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 5, '2023-12-05', 1, 0, 32, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Abdominal Crunch', 5, '2023-12-05', 3, 12, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Russian Twist', 5, '2023-12-05', 4, 0, 7, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 5, '2023-12-05', 1, 0, 25, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Squats', 5, '2023-12-05', 4, 10, 0, 95, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Fly', 5, '2023-12-10', 5, 12, 0, 80, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Deadlift', 5, '2023-12-10', 4, 8, 0, 150, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Planks', 5, '2023-12-10', 3, 7, 7, 0, 'seconds');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Assault Bike', 5, '2023-12-10', 1, 0, 15, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 5, '2023-12-10', 1, 0, 50, 0, 'duration');

--Employee Logged Workout
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 3, '2023-11-27', 1, 0, 45, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 3, '2023-11-29', 2, 10, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 3, '2023-12-05', 5, 10, 0, 100, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 3, '2023-12-06', 1, 0, 45, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 3, '2023-12-09', 2, 10, 0, 50, 'reps');

--Listed Equipment
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

--Listed Events
INSERT INTO schedule (event_name, event_description, event_date, event_start_time, event_duration) VALUES ('Fitness Fusion Challenge', 'Experience a unique blend of workouts that combine elements of cardio, strength training, and flexibility exercises.', '2023-12-20', '10:00:00',90);
INSERT INTO schedule (event_name, event_description, event_date, event_start_time, event_duration)
VALUES ('Dumbbell Debugging Basics', 'In Dumbbell Debugging, you''ll lift weights while debugging your code – because sometimes, the best way to find a bug is by getting a little ''lifting'' done!', '2023-12-16', '17:00:00', 45);
INSERT INTO schedule (event_name, event_description, event_date, event_start_time, event_duration)
VALUES ('Ctrl+Alt+Defeat Cardio Circuit', 'Sweating out bugs and boosting endorphins – join us and reboot your body.', '2023-12-19', '14:00:00', 60);

insert into profiles (user_id, profile_picture_url, email) VALUES (1, 'test', 'flexmaster2000@gmail.com');

COMMIT TRANSACTION;
