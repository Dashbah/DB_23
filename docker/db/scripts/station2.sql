-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-24 12:19:56.222

-- tables
-- Table: CareGiver
CREATE TABLE CareGiver (
    careGiver_id int  NOT NULL,
    Qualification text  NOT NULL,
    CONSTRAINT CareGiver_pk PRIMARY KEY (careGiver_id)
);

-- Table: Doctor
CREATE TABLE Doctor (
    doctor_id int  NOT NULL,
    Area text  NOT NULL,
    Rank text  NOT NULL,
    CONSTRAINT Doctor_pk PRIMARY KEY (doctor_id)
);

-- Table: Patient
CREATE TABLE Patient (
    PatientNr int  NOT NULL,
    Name int  NOT NULL,
    Disease text  NOT NULL,
    Room_RoomNr int  NOT NULL,
    StationPersonell_PersNumber int  NOT NULL,
    CONSTRAINT Patient_pk PRIMARY KEY (PatientNr)
);

-- Table: Room
CREATE TABLE Room (
    RoomNr int  NOT NULL,
    Beds int  NOT NULL,
    Station_StateNr int  NOT NULL,
    CONSTRAINT Room_pk PRIMARY KEY (RoomNr)
);

-- Table: Station
CREATE TABLE Station (
    StateNr int  NOT NULL,
    Name text  NOT NULL,
    CONSTRAINT Station_pk PRIMARY KEY (StateNr)
);

-- Table: StationPersonell
CREATE TABLE StationPersonell (
    PersNumber int  NOT NULL,
    Name text  NOT NULL,
    Station_StateNr int  NOT NULL,
    CONSTRAINT StationPersonell_pk PRIMARY KEY (PersNumber)
);

-- foreign keys
-- Reference: Patient_Room (table: Patient)
ALTER TABLE Patient ADD CONSTRAINT Patient_Room
    FOREIGN KEY (Room_RoomNr)
    REFERENCES Room (RoomNr)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Patient_StationPersonell (table: Patient)
ALTER TABLE Patient ADD CONSTRAINT Patient_StationPersonell
    FOREIGN KEY (StationPersonell_PersNumber)
    REFERENCES StationPersonell (PersNumber)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Room_Station (table: Room)
ALTER TABLE Room ADD CONSTRAINT Room_Station
    FOREIGN KEY (Station_StateNr)
    REFERENCES Station (StateNr)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: StationPersonell_Station (table: StationPersonell)
ALTER TABLE StationPersonell ADD CONSTRAINT StationPersonell_Station
    FOREIGN KEY (Station_StateNr)
    REFERENCES Station (StateNr)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

