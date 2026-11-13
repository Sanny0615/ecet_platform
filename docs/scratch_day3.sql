
-- ==========================================
-- DAY 3: PostgreSQL Practice
-- Project: ECET Platform
-- Database: ecet_dev
-- ==========================================


-- 1. CREATE TABLES

CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    total_marks INTEGER NOT NULL
);

CREATE TABLE topics (
    id SERIAL PRIMARY KEY,
    subject_id INTEGER NOT NULL REFERENCES subjects(id),
    name TEXT NOT NULL
);

CREATE TABLE exam_weightage (
    id SERIAL PRIMARY KEY,
    topic_id INTEGER NOT NULL REFERENCES topics(id),
    exam_year INTEGER NOT NULL,
    marks INTEGER NOT NULL
);


-- 2. INSERT SUBJECTS

INSERT INTO subjects (name, total_marks) VALUES
('Java', 10),
('Python', 10),
('C Programming', 10);


-- 3. INSERT TOPICS

INSERT INTO topics (subject_id, name) VALUES
(1, 'OOPs'),
(1, 'JVM'),
(1, 'Strings'),
(1, 'Exceptions'),
(1, 'Collections');


-- 4. INSERT EXAM WEIGHTAGE

INSERT INTO exam_weightage (topic_id, exam_year, marks) VALUES
(1, 2022, 3), (1, 2023, 2), (1, 2024, 3),
(2, 2022, 1), (2, 2023, 1), (2, 2024, 2),
(3, 2022, 1), (3, 2023, 2), (3, 2024, 1),
(4, 2022, 2), (4, 2023, 1), (4, 2024, 1),
(5, 2022, 1), (5, 2023, 2), (5, 2024, 1);


-- 5. FOUR SQL QUERIES

-- Query 1: All topics of Java

SELECT s.name, t.name
FROM subjects s
JOIN topics t ON s.id = t.subject_id
WHERE s.name = 'Java';


-- Query 2: Average marks per topic

SELECT t.name, AVG(e.marks) AS average_marks
FROM topics t
JOIN exam_weightage e ON t.id = e.topic_id
GROUP BY t.id, t.name;


-- Query 3: Top 3 topics by average marks

SELECT t.name, ROUND(AVG(e.marks), 2) AS average_marks
FROM topics t
JOIN exam_weightage e ON t.id = e.topic_id
GROUP BY t.id, t.name
ORDER BY average_marks DESC
LIMIT 3;


-- Query 4: Each subject and its topic count

SELECT s.name, COUNT(t.id) AS total_topics
FROM subjects s
LEFT JOIN topics t ON s.id = t.subject_id
GROUP BY s.id, s.name;


-- 6. ADDITIONAL QUERIES

-- Marks greater than or equal to 2

SELECT *
FROM exam_weightage
WHERE marks >= 2;


-- Order weightage by exam year

SELECT *
FROM exam_weightage
ORDER BY exam_year;


-- LEFT JOIN vs INNER JOIN

SELECT s.name, t.name
FROM subjects s
LEFT JOIN topics t ON s.id = t.subject_id;

SELECT s.name, t.name
FROM subjects s
INNER JOIN topics t ON s.id = t.subject_id;


-- Add a topic without weightage for LEFT JOIN testing

INSERT INTO topics (subject_id, name)
VALUES (1, 'Multithreading');
