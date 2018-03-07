DROP DATABASE IF EXISTS hw4;
CREATE DATABASE IF NOT EXISTS hw4;
USE hw4;
CREATE TABLE IF NOT EXISTS CRIME_TYPES(
  Primary_Type VARCHAR(64),
  Primary_Type_ID SMALLINT,
  PRIMARY KEY(Primary_Type_ID)
  );
LOAD DATA LOCAL INFILE 'C:/Users/Admin/Desktop/DS/Programming DB/Lab/hw4/primary_type_id.csv' INTO TABLE  CRIME_TYPES FIELDS TERMINATED BY ',' ESCAPED BY '"' IGNORE 1 LINES;

CREATE TABLE IF NOT EXISTS CRIME_INCIDENTS(
	`Crime_Id` varchar(255) NOT NULL DEFAULT '',
	`Case_Number` varchar(255) DEFAULT NULL,
	`Arrest` varchar(255) NOT NULL,
	`Domestic` varchar(255) NOT NULL,
	`Beat` varchar(255) NOT NULL,
	`Date` datetime DEFAULT NULL,
	`District` varchar(255) NOT NULL,
	`Ward` varchar(255) NOT NULL,
	`Community_Area` varchar(255) NOT NULL,
	`FBI_Code` varchar(255) NOT NULL,
	PRIMARY KEY (`Crime_Id`)
); 
LOAD DATA LOCAL INFILE 'C:/Users/Admin/Desktop/DS/Programming DB/Lab/hw4/chicago_crime_data_1.csv' INTO TABLE  CRIME_INCIDENTS FIELDS TERMINATED BY ',' ESCAPED BY '"' IGNORE 1 LINES;
UPDATE CRIME_INCIDENTS SET Date = STR_TO_DATE(Date, '%c/%e/%Y %H:%i');
ALTER TABLE CRIME_INCIDENTS MODIFY Date datetime;

CREATE TABLE IF NOT EXISTS CRIME_DETAILS(
	`Crime_Id` varchar(255) NOT NULL DEFAULT '',
	`Case_Number` varchar(255) DEFAULT NULL,
	`Block` varchar(255) NOT NULL,
	`IUCR` varchar(255) NOT NULL,
	`Primary_Type_ID` varchar(255) NOT NULL,
	`Updated_On` datetime DEFAULT NULL,
	`Description` varchar(255) NOT NULL,
	`Location_Description` varchar(255) NOT NULL,
	`X_Coordinate` varchar(255) NOT NULL,
	`Y_Coordinate` varchar(255) NOT NULL,
	`Year` varchar(255) NOT NULL,
	`Location` varchar(255) NOT NULL,
	PRIMARY KEY (`Crime_Id`)
);
LOAD DATA LOCAL INFILE 'C:/Users/Admin/Desktop/DS/Programming DB/Lab/hw4/chicago_crime_data_2.csv' INTO TABLE  CRIME_DETAILS FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
UPDATE CRIME_DETAILS SET Updated_On = STR_TO_DATE(Updated_On, '%c/%e/%Y %H:%i');
ALTER TABLE CRIME_DETAILS MODIFY Updated_On datetime;
