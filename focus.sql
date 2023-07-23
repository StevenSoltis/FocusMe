-- CREATE TABLE USERS ( studentNumber NOT NULL PRIMARY KEY, userName NOT NULL,
-- firstName NOT NULL, lastName NOT NULL, password NOT NULL, 
-- email NOT NULL, classNumber NOT NULL);

-- INSERT INTO USERS (studentNumber, userName, firstName, lastName, password, email, classNumber)
-- VALUES ("SS22EE", "ssoltis", "Steven", "Soltis", "jvqde", "steven.soltis@gmail.com", "LSI2025");

-- SELECT * FROM USERS


-- ALTER TABLE USERS
-- ADD COLUMN role TEXT;

-- ALTER TABLE USERS
-- ADD COLUMN professor_id INTEGER;

-- CREATE TABLE Calendar (
--   event_id INTEGER PRIMARY KEY,
--   user_id INTEGER,
--   event_title TEXT,
--   event_description TEXT,
--   event_date TEXT,
--   event_type TEXT,
--   FOREIGN KEY (user_id) REFERENCES USERS(studentNumber)
-- );

-- CREATE TABLE EVENT (
--   event_id INTEGER PRIMARY KEY,
--   user_id INTEGER,
--   event_title TEXT,
--   event_description TEXT,
--   event_date TEXT,
--   event_type TEXT,
--   FOREIGN KEY (user_id) REFERENCES USERS(studentNumber)
-- );

-- ALTER TABLE NewCal RENAME TO CALENDAR;

-- CREATE TABLE ASSIGNMENTS (
--   assignment_id INTEGER PRIMARY KEY,
--   professor_id INTEGER,
--   assignment_title TEXT,
--   unlock_date DATE,
--   due_date DATE,
--   FOREIGN KEY (professor_id) REFERENCES PROFESSORS (professor_id)
-- );

-- ALTER TABLE ASSIGNMENTS
-- ADD COLUMN submission_status TEXT;

-- CREATE TABLE SUBMISSIONS (
--   submission_id INTEGER PRIMARY KEY,
--   assignment_id INTEGER,
--   student_id INTEGER,
--   submission_date DATETIME,
--   submission_file TEXT,
--   FOREIGN KEY (assignment_id) REFERENCES ASSIGNMENTS (assignment_id),
--   FOREIGN KEY (student_id) REFERENCES USERS (student_id)
-- );

-- ALTER TABLE USERS
-- ADD COLUMN professor_id INTEGER;

-- PRAGMA foreign_keys = ON;

-- CREATE TABLE IF NOT EXISTS PROFESSORS (
--   professor_id INTEGER PRIMARY KEY,
--   professor_name TEXT
-- );

-- CREATE TABLE IF NOT EXISTS USERS (
--   user_id INTEGER PRIMARY KEY,
--   student_number TEXT,
--   user_name TEXT,
--   first_name TEXT,
--   last_name TEXT,
--   password TEXT,
--   email TEXT,
--   class_number TEXT,
--   professor_id INTEGER,
--   FOREIGN KEY (professor_id) REFERENCES PROFESSORS (professor_id)
-- );

-- CREATE TABLE IF NOT EXISTS COMMENTS (
--   comment_id INTEGER PRIMARY KEY,
--   professor_id INTEGER,
--   student_id INTEGER,
--   comment_text TEXT,
--   comment_date DATETIME,
--   FOREIGN KEY (professor_id) REFERENCES PROFESSORS (professor_id),
--   FOREIGN KEY (student_id) REFERENCES USERS (user_id)
-- );

-- DROP TABLE IF EXISTS ASSIGNMENTS;

-- DROP TABLE IF EXISTS SUBMISSIONS;

-- DROP TABLE IF EXISTS EVENT;

-- CREATE TABLE USERS (
--   user_id INTEGER PRIMARY KEY AUTOINCREMENT,
--   username TEXT,
--   password TEXT,
--   email TEXT,
--   first_name TEXT,
--   last_name TEXT,
--   role_id INTEGER,
--   professor_id INTEGER,
--   FOREIGN KEY (role_id) REFERENCES ROLES (role_id),
--   FOREIGN KEY (professor_id) REFERENCES PROFESSORS (professor_id)
-- );

-- CREATE TABLE ROLES (
--   role_id INTEGER PRIMARY KEY,
--   role_name TEXT
-- );

-- CREATE TABLE SEMESTER_GOALS (
--   goal_id INTEGER PRIMARY KEY,
--   user_id INTEGER,
--   course_name TEXT,
--   course_goal TEXT,
--   monthly_goal TEXT,
--   action_steps TEXT,
--   deadline TEXT,
--   results TEXT,
--   reflections TEXT,
--   FOREIGN KEY (user_id) REFERENCES USERS (user_id)
-- );

-- SELECT * FROM USERS;

-- INSERT INTO USERS (username, password, email, first_name, last_name, role_id)
-- VALUES ('su',
-- 'Password1',
-- 'admin@example.com',
-- 'Admin',
-- 'User',
-- 1);

-- INSERT INTO ROLES (role_id, role_name)
-- VALUES ('1', 'Admin');

SELECT * FROM ROLES;