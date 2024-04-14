-- Drop tables if they exist to allow re-creation
-- DROP TABLE IF EXISTS equipment, rooms, personal_training, certification_types, goals, exercises, routines, metrics, achievements, members, trainers, users, administration, user_types CASCADE;

-- Create user_types table
CREATE TABLE user_types (
    user_type_id SERIAL PRIMARY KEY,
    user_type_name VARCHAR(50) NOT NULL UNIQUE
);

-- Insert initial data into user_types
INSERT INTO user_types (user_type_name) VALUES
	('member'),
    ('trainer');

-- Create users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    type_of_user INTEGER NOT NULL REFERENCES user_types(user_type_id),
    username VARCHAR(255) NOT NULL UNIQUE,
    password_key VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_num VARCHAR(15) NOT NULL,
    sex VARCHAR(32) NOT NULL,
    dob DATE NOT NULL,
    home_addr VARCHAR(255) NOT NULL
);

-- Create trainers table
CREATE TABLE trainers (
	trainer_id SERIAL PRIMARY KEY
);

-- Create members table
CREATE TABLE members (
    member_id INTEGER PRIMARY KEY REFERENCES users(user_id) ON DELETE CASCADE
);

-- Create group_training table
CREATE TABLE group_training (
    session_id SERIAL PRIMARY KEY,
    trainer_id INTEGER NOT NULL REFERENCES trainers(trainer_id) ON DELETE CASCADE,
    train_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    room_id INTEGER NOT NULL
);

-- Create administration table
CREATE TABLE administration (
    admin_id INTEGER PRIMARY KEY REFERENCES users(user_id) ON DELETE CASCADE,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_key VARCHAR(255) NOT NULL
);

-- Create achievements table
CREATE TABLE achievements (
    achievement_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES members(member_id) ON DELETE CASCADE,
    date_received DATE DEFAULT CURRENT_DATE,
    achievement_description VARCHAR(255) NOT NULL
);

-- Create metrics table
CREATE TABLE metrics (
    metric_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES members(member_id) ON DELETE CASCADE,
    new_date DATE DEFAULT CURRENT_DATE,
    new_weight DECIMAL(5,2) NOT NULL,
    height DECIMAL(5,2) NOT NULL,
    bmi DECIMAL(5, 2) GENERATED ALWAYS AS (new_weight / POW(height / 100, 2)) STORED
);

-- Create routines table
CREATE TABLE routines (
    routine_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES members(member_id) ON DELETE CASCADE,
    routine_description VARCHAR(255) NOT NULL
);

-- Create exercises table
CREATE TABLE exercises (
    exercise_id SERIAL PRIMARY KEY,
    routine_id INTEGER NOT NULL REFERENCES routines(routine_id) ON DELETE CASCADE,
    exercise_type VARCHAR(255) NOT NULL,
    reps INTEGER NOT NULL
);

-- Create goals table
CREATE TABLE goals (
    goal_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES members(member_id) ON DELETE CASCADE,
    date_start DATE DEFAULT CURRENT_DATE,
    date_end DATE,
    goal_description VARCHAR(255) NOT NULL,
    goal_status VARCHAR(36)
);

-- Create certification_types table
CREATE TABLE certification_types (
    certification_id SERIAL PRIMARY KEY,
    certification_name VARCHAR(50) NOT NULL,
    trainer_id INTEGER NOT NULL REFERENCES trainers(trainer_id) ON DELETE CASCADE
);

-- Create personal_training table
CREATE TABLE personal_training (
    session_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES members(member_id) ON DELETE CASCADE,
    trainer_id INTEGER NOT NULL REFERENCES trainers(trainer_id) ON DELETE CASCADE,
    train_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    room_id INTEGER
);

-- Create rooms table
CREATE TABLE rooms (
    room_id SERIAL PRIMARY KEY,
    max_people INTEGER NOT NULL
);

-- Create equipment table
CREATE TABLE equipment (
    equipment_id SERIAL PRIMARY KEY,
    room_id INTEGER NOT NULL REFERENCES rooms(room_id) ON DELETE CASCADE,
    last_serviced DATE,
    equip_status VARCHAR(255) NOT NULL
);

-- Create billing_details table
CREATE TABLE billing_details (
    billing_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES members(member_id) ON DELETE CASCADE,
    billing_address VARCHAR(255) NOT NULL,
    card_number VARCHAR(19) NOT NULL,
    card_expiry DATE NOT NULL,
    card_cvv VARCHAR(5) NOT NULL
);

CREATE TABLE schedules (
    schedule_id SERIAL PRIMARY KEY,
    trainer_id INTEGER NOT NULL REFERENCES users(user_id),
    available_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    UNIQUE(trainer_id, available_date, start_time)
);

