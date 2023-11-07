-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-24 12:17:54.09

-- tables
-- Table: City
CREATE TABLE City (
    Name text  NOT NULL,
    Region text  NOT NULL,
    CONSTRAINT City_pk PRIMARY KEY (Name,Region)
);

-- Table: Station
CREATE TABLE Station (
    Name text  NOT NULL,
    City_Name text  NOT NULL,
    City_Region text  NOT NULL,
    CONSTRAINT Station_pk PRIMARY KEY (Name)
);

-- Table: Train
CREATE TABLE Train (
    trainNr int  NOT NULL,
    arrival time  NOT NULL,
    departure time  NOT NULL,
    length int  NOT NULL,
    Station_Name text  NOT NULL,
    start int  NOT NULL,
    "end" int  NOT NULL,
    CONSTRAINT Train_pk PRIMARY KEY (trainNr)
);

-- foreign keys
-- Reference: Station_City (table: Station)
ALTER TABLE Station ADD CONSTRAINT Station_City
    FOREIGN KEY (City_Name, City_Region)
    REFERENCES City (Name, Region)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Train_Station (table: Train)
ALTER TABLE Train ADD CONSTRAINT Train_Station
    FOREIGN KEY (Station_Name)
    REFERENCES Station (Name)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

