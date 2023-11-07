-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-24 10:49:50.714

-- tables
-- Table: Book
CREATE TABLE Book (
    ISBN int  NOT NULL,
    year int  NOT NULL,
    name text  NOT NULL,
    author text  NOT NULL,
    num_of_pages int  NOT NULL,
    Publisher_name text  NOT NULL,
    Category_category_id int  NOT NULL,
    CONSTRAINT Book_pk PRIMARY KEY (ISBN)
);

-- Table: BookCopy
CREATE TABLE BookCopy (
    book_copy_id int  NOT NULL,
    shelft int  NOT NULL,
    Booking_booking_id int  NOT NULL,
    Book_ISBN int  NOT NULL,
    CONSTRAINT BookCopy_pk PRIMARY KEY (book_copy_id)
);

-- Table: Booking
CREATE TABLE Booking (
    booking_id int  NOT NULL,
    booking_start date  NOT NULL,
    expire_date date  NOT NULL,
    returned int  NOT NULL,
    Reader_reader_id int  NOT NULL,
    CONSTRAINT Booking_pk PRIMARY KEY (booking_id)
);

-- Table: Category
CREATE TABLE Category (
    category_id int  NOT NULL,
    name text  NOT NULL,
    Mother_category_id int,
    CONSTRAINT Category_pk PRIMARY KEY (category_id)
);

-- Table: Publisher
CREATE TABLE Publisher (
    name text  NOT NULL,
    address text  NOT NULL,
    CONSTRAINT Publisher_pk PRIMARY KEY (name)
);

-- Table: Reader
CREATE TABLE Reader (
    reader_id int  NOT NULL,
    name text  NOT NULL,
    surname text  NOT NULL,
    address text  NOT NULL,
    date_of_burth date  NOT NULL,
    num_of_taken_books int  NOT NULL,
    CONSTRAINT Reader_pk PRIMARY KEY (reader_id)
);

-- foreign keys
-- Reference: BookCopy_Book (table: BookCopy)
ALTER TABLE BookCopy ADD CONSTRAINT BookCopy_Book
    FOREIGN KEY (Book_ISBN)
    REFERENCES Book (ISBN)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: BookCopy_Booking (table: BookCopy)
ALTER TABLE BookCopy ADD CONSTRAINT BookCopy_Booking
    FOREIGN KEY (Booking_booking_id)
    REFERENCES Booking (booking_id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Book_Category (table: Book)
ALTER TABLE Book ADD CONSTRAINT Book_Category
    FOREIGN KEY (Category_category_id)
    REFERENCES Category (category_id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Book_Publisher (table: Book)
ALTER TABLE Book ADD CONSTRAINT Book_Publisher
    FOREIGN KEY (Publisher_name)
    REFERENCES Publisher (name)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Booking_Reader (table: Booking)
ALTER TABLE Booking ADD CONSTRAINT Booking_Reader
    FOREIGN KEY (Reader_reader_id)
    REFERENCES Reader (reader_id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Category_Category (table: Category)
ALTER TABLE Category ADD CONSTRAINT Category_Category
    FOREIGN KEY (Mother_category_id)
    REFERENCES Category (category_id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- End of file.

