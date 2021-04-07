CREATE DATABASE if not exists design_test_db;

USE design_test_db;

DROP TABLE IF EXISTS quote_topic;
DROP TABLE IF EXISTS quotes;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS authors;


CREATE TABLE quotes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    author_first_name VARCHAR(50) DEFAULT 'NONE',
    author_last_name  VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE authors (
     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
     first_name VARCHAR(50),
     last_name  VARCHAR(100) NOT NULL,
     PRIMARY KEY (id)
);

ALTER TABLE quotes DROP COLUMN author_first_name;
ALTER TABLE quotes DROP COLUMN author_last_name;
ALTER TABLE quotes ADD COLUMN author_id INT UNSIGNED NOT NULL;
ALTER TABLE quotes ADD FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE NO ACTION ON UPDATE CASCADE;

# select * from quotes;
# select * from authors;
# show tables;

INSERT INTO authors(first_name, last_name) VALUES
('Stephen', 'King'),
('Toni', 'Morrison'),
('Robert', 'Frost');


# Seeds
INSERT INTO quotes (content, author_id)
VALUES ((select id from authors where first_name = 'Stephen' and last_name = 'King'),
        'If you dont have time to read, you dont have the time (or the tools) to write. Simple as that.' 1);
INSERT INTO quotes (content, author_id)
VALUES ((select id from authors where first_name = 'Toni' and last_name = 'Morrison'),
        'If theres a book that you want to read, but it hasnt been written yet, then you must write it.' 2);
INSERT INTO quotes (content, author_id)
values ((select id from authors where first_name = 'Robert' and last_name = 'Frost'),
        'No tears in the writer, no tears in the reader. No surprise in the writer, no surprise in the reader.' 3);


select * from quotes;
# where quotes.author_id = 2;

CREATE TABLE topics (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (id)
);



INSERT INTO topics(name) VALUES
('Biking Life'),
('Weigth Lifting'),
('Office Life'),
('Kitchen Stuff');


CREATE TABLE quote_topic (
     quote_id INTEGER UNSIGNED NOT NULL,
     topic_id INTEGER UNSIGNED NOT NULL,
     FOREIGN KEY (quote_id) REFERENCES quotes(id),
     FOREIGN KEY (topic_id) REFERENCES topics(id)
);


INSERT INTO quotes_topic(quate_id, topic_id)
VALUES (1, 2), (1, 3), (3, 1), (3, 2), (3, 3);



SELECT q.content AS 'Quote',
       CONCAT(a.first_name, ' ', a.last_name) AS 'Full Name',
       t.name AS 'Topic'
FROM quotes q
         INNER JOIN quote_topic qt ON q.id = qt.quote_id
         INNER JOIN topics t ON qt.topic_id = t.id
         INNER JOIN authors a ON q.author_id = a.id
WHERE qt.topic_id IN
      (
          SELECT t.id
          FROM topics t
          WHERE t.name = 'Humor'
      );
