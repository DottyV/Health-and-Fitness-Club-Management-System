# Project - Health and Fitness Club Management System
CONTRIBUTORS
------------
Daniel Kolawole                 ID: 101243696

## Overview
The Health and Fitness Club Management System is a web-based application designed to manage the day-to-day operations of a fitness club. This includes member registration, scheduling, trainer management, and billing services. The application is built using JavaScript, Node.js, and PostgreSQL for backend services, with a Pug template engine to render the front-end views.

## Features
- Member registration and login system
- Trainer profiles and certifications
- Personal and group training session management
- Health metrics tracking for members
- Billing and payment processing
- Administration panel for managing users and club data

## Installation

### Prerequisites
- Node.js
- PostgreSQL
- npm or yarn package manager

### Setting Up the Database
1. Ensure PostgreSQL is installed and running on your machine.
2. Create a new database named `3005project`.
3. Execute the SQL scripts found in `createdb.sql` to set up the schema and initial data.

### Running the Application
1. Clone the repository to your local machine.
2. Navigate to the project directory in your terminal.
3. Install the dependencies with `npm install`.
4. Start the server with `npm start`.
5. Access the application through `http://localhost:3000` in your browser.


HOW TO RUN
----------
1. Make sure you're in the project directory
2. Open pgAdmin4 and create a database called 3005project
3. Open Project/SQL/CreateAndPopulate.sql and run to create all the tables and populate with initial data you can test with.
4. Install node modules with
    - npm install
5. Run website with
    - node server.js
6. To run the different scenarios queries, open Project/SQL/Queries.sql in pgAdmin4

NOTE: The connection string is based on my personal details. If yours doesn't match, change line 10 in server.js
username: postgres
password: password
host: localhost
server: 5432
database name: 3005project

FUNCTIONALITY
-------------
- Login as a member with username = johnsmith and password = johnspassword
- Change and save personal details
- Add new health metric
- Get exercise routine
- Register as a new member
- Login as admin with username = admin and password = secureAdminPass
- Get all trainers
- Create new trainer
- Log in as a trainer

## Contact
- Project Repository: [GitHub Repo Link]