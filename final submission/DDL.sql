--DDL
--this table holds attributes pertaining to a group of writers
CREATE TABLE writingGroups (
    --refers to the name of the writer's group
    groupName VARCHAR(50) NOT NULL,
    --name of the head writer in the group
    headWriter VARCHAR(50) NOT NULL,
    --the year that the group was formed
    yearFormed INT NOT NULL,
    --the subject the writing group will right about
    subject VARCHAR(15) NOT NULL,
    CONSTRAINT writingGroup_pk PRIMARY KEY (groupName)
);

--this table holds publishers' information
CREATE TABLE publishers (
    --the name of the publisher
    pubName VARCHAR(30) NOT NULL,
    --the address of the publisher
    pubAddress VARCHAR(50) NOT NULL,
    --publisher's phone number
    pubPhone VARCHAR(15),
    --publisher's email address
    pubEmail VARCHAR(25),
    CONSTRAINT pub_pk PRIMARY KEY (pubName)
);

--this table includes information of each individual books
CREATE TABLE books (
    --refers to the name of the writer's group
    groupName VARCHAR(50) NOT NULL,
    --title of the book
    bookTitle VARCHAR(30) NOT NULL,
    --the name of the publisher
    pubName VARCHAR(30) NOT NULL,
    --the year that the book was published
    yearPub INT NOT NULL,
    --the number of pages in the book
    numOfPages INT NOT NULL,
    CONSTRAINT books_pk PRIMARY KEY (groupName,bookTitle),
    CONSTRAINT books_wg_fk01 FOREIGN KEY (groupName) REFERENCES writingGroups (groupName),
    CONSTRAINT books_pub_fk02 FOREIGN KEY (pubName) REFERENCES publishers (pubName),
    CONSTRAINT books_uk01 UNIQUE (bookTitle,pubName)
);

-- DROP TABLE books;
-- DROP TABLE writingGroups;
-- DROP TABLE publishers;
