CREATE DATABASE BLOOD_BANK;
/*
CREATE TABLE bloodbanks
(
Sr_No				INT  PRIMARY KEY,
Blood_Bank_Name	VARCHAR(255)	, 
State				VARCHAR(255),
District			VARCHAR(255),
City				VARCHAR(80),
Address			VARCHAR(255),
Pincode			INT,
Contact_No			VARCHAR(255),
Mobile				VARCHAR(255),
Helpline	        VARCHAR(255),
Fax				VARCHAR(255),
Email				VARCHAR(255),
Website			VARCHAR(255),
Nodal_Officer 		VARCHAR(100),
Contact_Nodal_Officer	 VARCHAR(100),
Mobile_Nodal_Officer	 VARCHAR(100),
Email_Nodal_Officer	 VARCHAR(100),
Qualification_Nodal_Officer	 VARCHAR(80),
Category			VARCHAR(80),
Blood_Component_Available	VARCHAR(10), 
Apheresis			VARCHAR(10),
Service_Time		VARCHAR(80),
License_no			VARCHAR(100),
Date_License_Obtained	DATE ,
Date_of_Renewal		DATE ,
Latitude	        DECIMAL(10,7),
Longitude          DECIMAL(10,7)
 );
 */

--Replacing null values
UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ ContactNo] = 0
WHERE [ ContactNo] IS NULL;

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Mobile] = 0
WHERE [ Mobile] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Helpline]=0
WHERE [ Helpline] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Fax]=0
WHERE [ Fax] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Email]=0
WHERE [ Email] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Nodal_Officer ]='no'
WHERE [ Nodal_Officer ] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Contact_Nodal_Officer]='no'
WHERE [ Contact_Nodal_Officer] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Mobile_Nodal_Officer]=0
WHERE [ Mobile_Nodal_Officer] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Email_Nodal_Officer]='no'
WHERE [ Email_Nodal_Officer] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Qualification_Nodal_Officer]='not sure'
WHERE [ Qualification_Nodal_Officer] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Blood_Component_Available]='not sure'
WHERE [ Blood_Component_Available] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Apheresis]='not sure'
WHERE [ Apheresis] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ License_no]='no'
WHERE [ License_no] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Date_License_Obtained]=00
WHERE [ Date_License_Obtained] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Date_of_Renewal]=00
WHERE [ Date_of_Renewal] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Website]='N/A'
WHERE [ Website] IS NULL

UPDATE [BLOOD_BANK].[dbo].['blood-banks$']
SET [ Service_Time]='not sure'
WHERE [ Service_Time] IS NULL


-- Query to find the Blood available at which location
SELECT  [ Blood_Bank_Name], [ City], [ Address]
FROM [BLOOD_BANK].[dbo].['blood-banks$']
WHERE [ Blood_Component_Available]='YES';

-- Is blood available in city chittoor
SELECT [ Blood_Bank_Name], [ Address], [ City]
FROM [BLOOD_BANK].[dbo].['blood-banks$']
WHERE [ Blood_Component_Available]='YES' And [ CITY]='Chittoor';

--Whether nodal officer contact available if blood is not available
SELECT [ Nodal_Officer ],[ Contact_Nodal_Officer],[ Mobile_Nodal_Officer],[ Email_Nodal_Officer]
FROM [BLOOD_BANK].[dbo].['blood-banks$']
WHERE [ Blood_Component_Available]!='YES';

--Check if the blood ,Services and apheresis available 
SELECT [ Blood_Component_Available] ,[ Apheresis],[ Service_Time]
FROM [BLOOD_BANK].[dbo].['blood-banks$']
WHERE [ Blood_Component_Available]='YES' AND [ Apheresis]='YES' OR 
    	[ Blood_Component_Available]='not sure' OR [ Apheresis]='not sure'

--Analyze the service time of blood banks(blood banks that are available 24/7, 
--those that operate during business hours, and those with limited service hours.)
SELECT [ Blood_Bank_Name],[ Service_Time],
       CASE
           WHEN [ Service_Time] LIKE '24%' THEN 'Available 24/7'
           WHEN [ Service_Time] LIKE '%PM' THEN 'Available during business hours'
		   WHEN [ Service_Time]='not sure' THEN 'Not Sure'
		   WHEN [ Service_Time]=' Delicensed -Converted for blood storage center for transient period ' THEN 'Delicensed'
       END AS Service_Availability
FROM [BLOOD_BANK].[dbo].['blood-banks$']
ORDER BY [ Service_Time];


--The  last renewal date for each blood bank.
SELECT [ Blood_Bank_Name],[ License_no], [ Date_License_Obtained],[ Date_of_Renewal]
FROM [BLOOD_BANK].[dbo].['blood-banks$']
ORDER BY [ Date_of_Renewal] DESC;

--Find the nearest blood bank based on latitude and longitude
SELECT TOP 1 [ Blood_Bank_Name], [ Address], 
       SQRT(POWER(69.1 * ([ Latitude]- 14.654936), 2) +
            POWER(69.1 * (77.609915 - [ Longitude]) * COS([ Latitude] / 57.3), 2)) AS Distance
FROM [BLOOD_BANK].[dbo].['blood-banks$']
WHERE [ District] = 'ANANTAPUR'
ORDER BY Distance;

--The number of blood banks per state and district
SELECT  [ State], [ District], COUNT([ Blood_Bank_Name]) AS TOTAL
FROM [BLOOD_BANK].[dbo].['blood-banks$']
GROUP BY [ State], [ District]
ORDER BY TOTAL DESC;
