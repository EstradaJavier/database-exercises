CREATE DATABASE join_test_db;

CREATE TABLE roles (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT,
   name VARCHAR(100) NOT NULL,
   PRIMARY KEY (id)
);

CREATE TABLE users (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT,
   name VARCHAR(100) NOT NULL,
   email VARCHAR(100) NOT NULL,
   role_id INT UNSIGNED DEFAULT NULL,
   PRIMARY KEY (id),
   FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

INSERT INTO users (name, email, role_id)
VALUES ('bob', 'bob@example.com', 1),
       ('joe', 'joe@example.com', 2),
       ('sally', 'sally@example.com', 3),
       ('mike', 'mike@example.com', null);

# seed extra user records
INSERT INTO users (name, email, role_id)
VALUES ('javi', 'jjavi@example.com', 2),
       ('emily', 'emily@example.com', 2),
       ('carlos', 'arlos@example.com', 2),
       ('jen', 'jen@example.com', null);

# counting the number of users (u.role_id) for each role
SELECT r.name,
COUNT(u.role_id) as Users
FROM users as u
RIGHT JOIN roles AS r ON u.role_id = r.id


SELECT users.name as Users, roles.name as Role
FROM users
JOIN roles ON users.role_id = roles.id;
