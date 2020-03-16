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





-- values
INSERT INTO writingGroups(groupName, headWriter, yearFormed, subject)
VALUES  ('CoolWriting', 'Jake Rayner', 2002, 'Horror'),
        ('HelloWriters', 'Tom Brit', 1994, 'Fantasy'),
        ('SavingWriters', 'Leslie Kewett', 2010, 'Science Fiction'),
        ('GroupPoets', 'Preston Kanue', 1991, 'Poetry'),
        ('MarkusWrites', 'Markus Max', 1897, 'Fiction'),
        ('TeenWriters', 'Jason Gillio', 2018, 'Romance');

INSERT INTO publishers(pubName, pubAddress, pubPhone, pubEmail)
VALUES  
('Father Publishing', '5 Harbour Street North Royalton, OH 44133', '(598) 693-8367', 'fp_contacts@gmail.com'),
('Hampton Hut Media', '9701B Poor House St. Dorchester Center, MA 02124', '(204) 298-9233', 'hhm_contacts@gmail.com'),
('Ballast Press', '7928 Edgewood St. Wayne, NJ 07470', '(710) 244-3286', 'bp_contacts@gmail.com'),
('Ernest Shaw', '690 Purple Finch Dr. Dayton, OH 45420', '(397) 461-2925', 'ES_contacts@gmail.com'),
('Terrell Publishing Co', '28 Blackburn Avenue Belmont, MA 02478', '(430) 617-1689', 'tpc_contacts@gmail.com'),
('Creative International', '175 Marshall St. Indian Trail, NC 28079', '(633) 763-5282', 'ci_contacts@gmail.com');


INSERT INTO books(groupName, bookTitle, pubName, yearPub, numOfPages)
VALUES  ('CoolWriting', 'Night of Terror', 'Father Publishing', 2003, 198),
        ('HelloWriters', 'The Corpse in the Portrait', 'Hampton Hut Media', 1995, 201),
        ('SavingWriters', 'Beyond the Oath', 'Ballast Press', 2014, 231),
        ('GroupPoets', 'Shadows Crying', 'Ernest Shaw', 1997, 108),
        ('MarkusWrites', 'Midnight Rose', 'Terrell Publishing Co', 1900, 330),
        ('TeenWriters', 'Flies of Broken Things', 'Creative International', 2018, 172);
