CREATE TABLE writingGroups (
    groupName VARCHAR(50) NOT NULL,
    headWriter VARCHAR(50) NOT NULL,
    yearFormed INT NOT NULL,
    subject VARCHAR(15) NOT NULL,
    CONSTRAINT writingGroup_pk PRIMARY KEY (groupName)
);

CREATE TABLE publishers (
    pubName VARCHAR(30) NOT NULL,
    pubAddress VARCHAR(30) NOT NULL,
    pubPhone INT,
    pubEmail VARCHAR(25),
    CONSTRAINT pub_pk PRIMARY KEY (pubName)
);

CREATE TABLE books (
    groupName VARCHAR(50) NOT NULL,
    bookTitle VARCHAR(30) NOT NULL,
    pubName VARCHAR(30) NOT NULL,
    yearPub INT NOT NULL,
    numOfPages INT NOT NULL,
    CONSTRAINT books_pk PRIMARY KEY (groupName,bookTitle),
    CONSTRAINT books_wg_fk01 FOREIGN KEY (groupName) REFERENCES writingGroups (groupName),
    CONSTRAINT books_pub_fk02 FOREIGN KEY (pubName) REFERENCES publishers (pubName),
    CONSTRAINT books_uk01 UNIQUE (bookTitle,pubName)
);
