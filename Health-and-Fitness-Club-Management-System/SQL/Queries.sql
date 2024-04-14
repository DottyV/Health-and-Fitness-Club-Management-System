-- Insert sample data
-- Admin
INSERT INTO user_types (user_type_name)
SELECT 'admin'
WHERE NOT EXISTS (SELECT 1 FROM user_types WHERE user_type_name = 'admin');

INSERT INTO users (type_of_user, username, password_key, first_name, last_name, email, phone_num, sex, dob, home_addr) 
VALUES (
  (SELECT user_type_id FROM user_types WHERE user_type_name = 'admin'), 
  'admin', 'secureAdminPass', 'Admin', 'User', 'admin@example.com', '0000000000', 'Nonbinary', '1990-01-01', '123 Admin Rd, City, Country'
);

INSERT INTO administration (admin_id, username, password_key) 
VALUES (
  (SELECT user_id FROM users WHERE username = 'admin'), 
  'admin', 'secureAdminPass'
);
-- INSERT INTO administration (username, password_key) VALUES ('admin', 'admin');

-- MEMBER 1
-- Creating member 1
INSERT INTO users (type_of_user, username, password_key, first_name, last_name, email, phone_num, sex, dob, home_addr) VALUES 
(1, 'johnsmith', 'johnspassword', 'John', 'Smith', 'johnsmith@example.com', '2281027402', 'male', '1992-05-15', 'Apartment 2208, 202 Mountain Rd, Halifax, Nova Scotia, Canada');
INSERT INTO members(member_id) VALUES ((SELECT user_id from users WHERE username = 'johnsmith'));

-- Insert into billing_details table
INSERT INTO billing_details (member_id, billing_address, card_number, card_expiry, card_cvv) 
VALUES 
((SELECT user_id FROM users WHERE username = 'johnsmith'), 'Apartment 2208, 202 Mountain Rd, Halifax, Nova Scotia, Canada', '4111111111111111', '2024-12-31', '123');
-- -- MEMBER 2
-- -- Creating member 2
-- INSERT INTO users (type_of_user, username, password_key, first_name, last_name, email, phone_num, sex, dob, home_addr) VALUES 
-- (4, 'janedoe', 'janespassword', 'Jane', 'Doe', 'janedoe@example.com', '2281027403', 'female', '1988-11-23', 'Unit 33, 400 Maple St, Vancouver, British Columbia, Canada');
-- INSERT INTO members(member_id) VALUES ((SELECT user_id from users WHERE username = 'janedoe'));


-- Creating metrics
INSERT INTO metrics(member_id, new_date, new_weight, height) VALUES ((SELECT user_id from users WHERE username = 'johnsmith'), '2023-07-23', 126, 170);
INSERT INTO metrics(member_id, new_date, new_weight, height) VALUES ((SELECT user_id from users WHERE username = 'johnsmith'), '2023-08-26', 116, 170);
INSERT INTO metrics(member_id, new_date, new_weight, height) VALUES ((SELECT user_id from users WHERE username = 'johnsmith'), '2023-09-21', 99, 170);
INSERT INTO metrics(member_id, new_date, new_weight, height) VALUES ((SELECT user_id from users WHERE username = 'johnsmith'), '2023-11-24', 95.5, 170);

-- Creating routine
INSERT INTO routines(member_id, routine_description) VALUES ((SELECT user_id from users WHERE username = 'johnsmith'), 'Work Those Glutes!');
INSERT INTO exercises(routine_id, exercise_type, reps) VALUES ((SELECT routines.routine_id FROM routines JOIN users ON routines.member_id = users.user_id WHERE users.username = 'johnsmith' AND routines.routine_description = 'Work Those Glutes!'), 'squats', 10);
INSERT INTO exercises(routine_id, exercise_type, reps) VALUES ((SELECT routines.routine_id FROM routines JOIN users ON routines.member_id = users.user_id WHERE users.username = 'johnsmith' AND routines.routine_description = 'Work Those Glutes!'), 'lunges', 10);
INSERT INTO exercises(routine_id, exercise_type, reps) VALUES ((SELECT routines.routine_id FROM routines JOIN users ON routines.member_id = users.user_id WHERE users.username = 'johnsmith' AND routines.routine_description = 'Work Those Glutes!'), 'fire hydrants', 10);
INSERT INTO exercises(routine_id, exercise_type, reps) VALUES ((SELECT routines.routine_id FROM routines JOIN users ON routines.member_id = users.user_id WHERE users.username = 'johnsmith' AND routines.routine_description = 'Work Those Glutes!'), 'donkey kicks', 10);
INSERT INTO exercises(routine_id, exercise_type, reps) VALUES ((SELECT routines.routine_id FROM routines JOIN users ON routines.member_id = users.user_id WHERE users.username = 'johnsmith' AND routines.routine_description = 'Work Those Glutes!'), 'hip thrusts', 10);

-- TRAINER 1
-- Creating trainer 1
-- INSERT INTO users (type_of_user, username, password_key, first_name, last_name, email, phone_num, sex, dob, home_addr) VALUES 
-- (2, 'emwatson', 'emspassword', 'Emma', 'Watson', 'emwatson@example.com', '3008800309', 'female', '1980-04-15', '42 Dufferin Ave, Halifax, Nova Scotia, Canada');
-- INSERT INTO trainers(trainer_id) VALUES ((SELECT user_id from users WHERE username = 'emwatson'));

INSERT INTO users (type_of_user, username, password_key, first_name, last_name, email, phone_num, sex, dob, home_addr) VALUES 
((SELECT user_type_id from user_types WHERE user_type_name = 'trainer'), 'emwatson', 'emspassword', 'Emma', 'Watson', 'emwatson@example.com', '3008800309', 'female', '1980-04-15', '42 Dufferin Ave, Halifax, Nova Scotia, Canada');
INSERT INTO trainers(trainer_id) VALUES ((SELECT user_id from users WHERE username = 'emwatson'));
-- -- TRAINER 2
-- -- Creating trainer 2
-- INSERT INTO users (type_of_user, username, password_key, first_name, last_name, email, phone_num, sex, dob, home_addr) VALUES 
-- (5, 'jdoyle', 'jdoylepass', 'James', 'Doyle', 'jdoyle@example.com', '3008800310', 'male', '1990-09-20', 'Suite 25, 500 Granville St, Vancouver, British Columbia, Canada');
-- INSERT INTO trainers(trainer_id) VALUES ((SELECT user_id from users WHERE username = 'jdoyle'));


-- Creating certications for trainer
INSERT INTO certification_types (certification_name, trainer_id) VALUES ('yoga', (SELECT user_id from users WHERE username = 'emwatson'));
INSERT INTO certification_types (certification_name, trainer_id) VALUES ('zumba', (SELECT user_id from users WHERE username = 'emwatson'));
INSERT INTO certification_types (certification_name, trainer_id) VALUES ('pilates', (SELECT user_id from users WHERE username = 'emwatson'));

-- -- Creating fitness goals for member 1


-- -- Creating rooms
INSERT INTO rooms (max_people) VALUES (50);
INSERT INTO equipment (room_id, last_serviced, equip_status) VALUES (1, '2023-11-10', 'perfect');
INSERT INTO equipment (room_id, last_serviced, equip_status) VALUES (1, '2023-11-10', 'faulty');
INSERT INTO equipment (room_id, last_serviced, equip_status) VALUES (1, '2023-11-10', 'perfect');

INSERT INTO rooms (max_people) VALUES (100);
INSERT INTO equipment (room_id, last_serviced, equip_status) VALUES (2, '2023-11-10', 'perfect');
INSERT INTO equipment (room_id, last_serviced, equip_status) VALUES (2, '2023-11-10', 'perfect');
INSERT INTO equipment (room_id, last_serviced, equip_status) VALUES (2, '2023-11-10', 'perfect');

                                    --````````````````````````````````````````````--
-- -- John decided to create a new workout routine. He decides to create an arm centred workout 
INSERT INTO routines(member_id, routine_description) VALUES ((SELECT user_id from users WHERE username = 'johnsmith'), 'Arm morning workout');
INSERT INTO exercises(routine_id, exercise_type, reps) VALUES ((SELECT routines.routine_id FROM routines JOIN users ON routines.member_id = users.user_id WHERE users.username = 'johnsmith' AND routines.routine_description = 'Arm morning workout'), 'tricep dips', 30);
INSERT INTO exercises(routine_id, exercise_type, reps) VALUES ((SELECT routines.routine_id FROM routines JOIN users ON routines.member_id = users.user_id WHERE users.username = 'johnsmith' AND routines.routine_description = 'Arm morning workout'), 'bicep dips', 30);
INSERT INTO exercises(routine_id, exercise_type, reps) VALUES ((SELECT routines.routine_id FROM routines JOIN users ON routines.member_id = users.user_id WHERE users.username = 'johnsmith' AND routines.routine_description = 'Arm morning workout'), 'swimmers', 30);

SELECT
    members.member_id,
	users.username,
	routines.routine_description,
	exercises.exercise_type,
	exercises.reps
FROM users
JOIN user_types ON users.type_of_user = user_types.user_type_id
LEFT JOIN members ON users.user_id = members.member_id
LEFT JOIN routines ON members.member_id = routines.member_id
LEFT JOIN exercises ON routines.routine_id = exercises.routine_id
WHERE users.username = 'johnsmith' AND routines.routine_description = 'Arm morning workout';

--His email got hacked so He had to make a new one. He decides to update his email on all his accounts
UPDATE users SET email = 'newjohn@example.com' WHERE user_id = (SELECT user_id from users WHERE username = 'johnsmith');
SELECT * FROM users WHERE user_id = (SELECT user_id from users WHERE username = 'johnsmith');

-- -- A new member decides to join the fitness club. They create an account as a member.
INSERT INTO users (type_of_user, username, password_key, first_name, last_name, email, phone_num, sex, dob, home_addr) VALUES ((SELECT user_type_id from user_types WHERE user_type_name = 'member'), 'kellygetsfit', 'kellyspassword', 'Kelly', 'McQueen', 'queenkelly@example.com', '9812562749', 'female', '1983-11-19', '43B Hampton Drive, Toronto, Ontario, Canada');
INSERT INTO members(member_id) VALUES ((SELECT user_id from users WHERE username = 'kellygetsfit'));
-- Insert into billing_details table
INSERT INTO billing_details (member_id, billing_address, card_number, card_expiry, card_cvv) 
VALUES 
((SELECT user_id FROM users WHERE username = 'kellygetsfit'), '43B Hampton Drive, Toronto, Ontario, Canada', '4222222222222222', '2025-11-30', '321');


SELECT * FROM users ORDER BY user_id DESC LIMIT 1;

-- -- She is prompted to enter her health metrics
INSERT INTO metrics(member_id, new_weight, height) VALUES ((SELECT user_id from users WHERE username = 'kellygetsfit'), 186, 150);

SELECT users.username, metrics.*
FROM metrics
JOIN members ON metrics.member_id = members.member_id
JOIN users ON members.member_id = users.user_id
WHERE users.username = 'johnsmith';

-- The fitness club hired a new trainer. Admin creates a new profile for them.
INSERT INTO users (type_of_user, username, password_key, first_name, last_name, email, phone_num, sex, dob, home_addr) VALUES ((SELECT user_type_id from user_types WHERE user_type_name = 'trainer'), 'AlexT', 'alextsecure', 'Alex', 'Taylor', 'alext@example.com', '8793789132', 'male', '1990-06-30', '789 W Training Blvd, Toronto, Ontario, Canada');
INSERT INTO trainers(trainer_id) VALUES ((SELECT user_id from users WHERE username = 'AlexT'));

INSERT INTO certification_types (certification_name, trainer_id) VALUES ('cardio', (SELECT user_id from users WHERE username = 'AlexT'));
INSERT INTO certification_types (certification_name, trainer_id) VALUES ('yoga', (SELECT user_id from users WHERE username = 'AlexT'));
INSERT INTO certification_types (certification_name, trainer_id) VALUES ('zumba', (SELECT user_id from users WHERE username = 'AlexT'));

SELECT users.*, certification_types.certification_name
FROM users
JOIN trainers ON users.user_id = trainers.trainer_id
LEFT JOIN certification_types ON trainers.trainer_id = certification_types.trainer_id
WHERE users.username = 'emwatson';

-- John wants a personal/one-one yoga session. First he searches for trainers who are certified in yoga
SELECT
    trainers.trainer_id,
	users.first_name,
	users.last_name
FROM
    users
JOIN
    trainers ON users.user_id = trainers.trainer_id
LEFT JOIN
    certification_types ON certification_types.trainer_id= trainers.trainer_id
WHERE
	certification_types.certification_name = 'yoga';

-- Since he found a trainer, the system provides him with a list of rooms available. That is, rooms that don't have faulty equipment
SELECT
    rooms.room_id,
    rooms.max_people
FROM
    rooms
LEFT JOIN
    equipment ON rooms.room_id = equipment.room_id AND equipment.equip_status = 'faulty'
WHERE
    equipment.room_id IS NULL;

-- Then a training session can be created:
INSERT INTO personal_training (member_id, trainer_id, train_date, start_time, end_time, room_id)
VALUES (
    (SELECT user_id FROM users WHERE username = 'johnsmith'),
    (SELECT user_id FROM users WHERE first_name = 'Emma' AND last_name = 'Watson'),
    '2023-12-06',
    '10:00:00',
    '11:00:00',
    2
);

-- The trainer Emma receives a notification abut the new session. Unfortunately, she has a bad back and can't do yoga for a while. So she deletes the session.
DELETE FROM personal_training WHERE session_id = 1;

-- Admin decides to set up the first group training session for Alex. First they search for a room that is available at that time on that date
SELECT
    r.room_id,
    r.max_people
FROM
    rooms r
LEFT JOIN group_training gt ON r.room_id = gt.room_id
    AND '2023-12-06'::DATE = gt.train_date
    AND '16:00'::TIME < gt.end_time
    AND '17:00'::TIME > gt.start_time
LEFT JOIN personal_training pt ON r.room_id = pt.room_id
    AND '2023-12-06'::DATE = pt.train_date
    AND '16:00'::TIME < pt.end_time
    AND '17:00'::TIME > pt.start_time
WHERE
    gt.room_id IS NULL
    AND pt.room_id IS NULL;

-- --Then a new group session is created
INSERT INTO group_training (trainer_id, train_date, start_time, end_time, room_id)
VALUES ((SELECT user_id FROM users WHERE first_name = 'Alex' AND last_name = 'Taylor'), '2023-12-07', '16:00', '17:00', 1);

-- -- The trainer Alex receives a notification about the new session. Unfortunately, he is not 
-- -- available at that time. So he changes it.
UPDATE group_training SET start_time = '17:00:00', end_time = '18:00:00' WHERE trainer_id = (SELECT user_id from users WHERE username = 'AlexT');



--Inserting a New Schedule
INSERT INTO schedules (trainer_id, available_date, start_time, end_time)
VALUES (3, '2024-04-15', '09:00', '12:00');

-- Fetching Schedules for a Specific Trainer
SELECT * FROM schedules WHERE trainer_id = :1 ORDER BY available_date, start_time;

-- Updating an Existing Schedule
UPDATE schedules
SET start_time = '10:00', end_time = '13:00'
WHERE schedule_id = 1;

-- Deleting a Schedule
DELETE FROM schedules WHERE schedule_id = 1;
