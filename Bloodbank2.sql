USE BLOOD_BANK; 
CREATE TABLE Donors 
(
    Donor_ID INT PRIMARY KEY,            
    Name VARCHAR(50) NOT NULL,           
    Age INT NOT NULL,                   
    Blood_Type VARCHAR(3) NOT NULL, 
	Blood_Bank_Name	VARCHAR(255),
    Last_Donation_Date DATE              
);

CREATE TABLE Recipients 
(
    Recipient_ID INT PRIMARY KEY,        
    Donor_ID INT,                        
    Name VARCHAR(50) NOT NULL,           
    Age INT NOT NULL,                    
    Blood_Type VARCHAR(3) NOT NULL,      
    Requirement_Date DATE NOT NULL,      
    FOREIGN KEY (Donor_ID) REFERENCES Donors(Donor_ID)  
);


CREATE TABLE Blood_Units 
(
    Unit_ID INT PRIMARY KEY,             
    Donor_id INT,                        
    Blood_Type VARCHAR(3) NOT NULL,      
    Donation_Date DATE NOT NULL,         
    Expiry_date DATE NOT NULL,           
    Status VARCHAR(20) NOT NULL,         
    FOREIGN KEY (Donor_ID) REFERENCES Donors(Donor_ID)  
);

 INSERT INTO Donors (Donor_ID, Name, Age, Blood_Type, Blood_Bank_Name, Last_Donation_Date) VALUES
(1, 'Rahul Sharma', 25, 'A+', 'Sri Venkateswara Institute of Medical sciences Blood Bank', '2015-11-16'),
(2, 'Priya Patel', 30, 'B-', 'Sri Sathya Sai Institute of Higher Medical Sciences Blood Bank', '2017-12-30'),
(3, 'Amit Verma', 22, 'O+', 'District Hospital Blood Bank', '2016-10-28'),
(4, 'Neha Gupta', 28, 'AB+', 'Indian Red Cross Society (IRCS) Blood Bank', '2017-12-31'),
(5, 'Vikram Reddy', 35, 'A-', 'Govt Maternity Hospital Blood Bank', '2016-03-30'),
(6, 'Sita Singh', 27, 'B+', 'M/S. Kims & Research Foundation, Hospital Blood Bank', '2015-08-01'),
(7, 'Ajay Kumar', 33, 'O-', 'GBH American Hospital Blood bank', '2016-02-14'),
(8, 'Riya Nair', 29, 'AB-', 'CANCER INSTITUTE HOSPITAL BLOOD BANK', '2016-03-25'),
(9, 'Karan Iyer', 26, 'A+', 'J N Hospital Blood Bank, Serchhip', '2015-06-05'),
(10, 'Anjali Choudhury', 31, 'B-', 'Sub Divisional Hospital Talcher', '2016-07-18'),
(11, 'Rohit Joshi', 24, 'O+', 'Pacific Medical College and Hospital Blood Bank', '2015-05-15'),
(12, 'Sneha Mehta', 29, 'AB+', 'Vivekanandha Medical Care Hospital Blood Bank', '2016-04-20'),
(13, 'Manish Sharma', 32, 'A-', 'Sree Meenakshi Multi Speciality Hospital Blood Bank (Run by Ayyamperumal and K Dakshinamoorthy Trust)', '2016-05-03'),
(14, 'Pooja Gupta', 27, 'B+', 'Annai Blood Bank', '2015-02-28'),
(15, 'Deepak Reddy', 36, 'O-', 'Indian Red Cross Society (IRCS) Blood Bank', '2016-01-12'),
(16, 'Tina Singh', 26, 'AB-', 'CANCER INSTITUTE HOSPITAL BLOOD BANK', '2017-08-10'),
(17, 'Suresh Kumar', 34, 'A+', 'Sri Sathya Sai Institute of Higher Medical Sciences Blood Bank', '2015-06-30'),
(18, 'Geeta Nair', 30, 'B-', 'Military Hospital Blood Bank', '2015-05-25'),
(19, 'Rajesh Iyer', 28, 'O+', 'Dr. K.M. Memorial Jain Heart & General Hospital Blood Bank', '2016-07-15'),                                                  
(20, 'Nisha Choudhury', 29, 'AB+', 'Annai Blood Bank', '2015-04-05');

INSERT INTO Recipients (Recipient_ID, Donor_ID, Name, Age, Blood_Type, Requirement_Date) VALUES
(1, 1, 'Vikas Sharma', 40, 'A+', '2015-08-20'),
(2, 2, 'Anita Patel', 35, 'B-', '2016-12-22'),
(3, 3, 'Kiran Verma', 29, 'O+', '2017-10-25'),
(4, 4, 'Suman Gupta', 45, 'AB+', '2016-03-18'),
(5, 5, 'Ravi Reddy', 50, 'A-', '2015-11-21'),
(6, 6, 'Meena Singh', 33, 'B+', '2017-01-26'),
(7, 7, 'Raj Kumar', 38, 'O-', '2016-05-19'),
(8, 8, 'Lata Nair', 42, 'AB-', '2015-07-23'),
(9, 9, 'Nitin Iyer', 36, 'A+', '2017-09-27'),
(10, 10, 'Priti Choudhury', 31, 'B-', '2016-04-28'),
(11, 11, 'Vijay Joshi', 39, 'O+', '2015-08-29'),
(12, 12, 'Rina Mehta', 34, 'AB+', '2017-06-01'),
(13, 13, 'Sanjay Sharma', 37, 'A-', '2016-02-02'),
(14, 14, 'Kavita Gupta', 41, 'B+', '2015-12-03'),
(15, 15, 'Aakash Reddy', 44, 'O-', '2017-01-04'),
(16, 16, 'Rani Singh', 32, 'AB-', '2016-11-05'),
(17, 17, 'Ajit Kumar', 35, 'A+', '2015-03-06'),
(18, 18, 'Sita Nair', 30, 'B-', '2016-07-07'),
(19, 19, 'Rakesh Iyer', 29, 'O+', '2017-09-08'),
(20, 20, 'Neha Choudhury', 28, 'AB+', '2015-10-09');

INSERT INTO Blood_Units (Unit_ID, Donor_id, Blood_Type, Donation_Date, Expiry_date, Status) VALUES
(1, 1, 'A+', '2015-11-16', '2016-01-30', 'Available'),
(2, 2, 'B-', '2017-12-30', '2018-02-28', 'Available'),
(3, 3, 'O+', '2016-10-28', '2017-01-28', 'Allocated'),
(4, 4, 'AB+', '2017-12-31', '2018-03-31', 'Available'),
(5, 15, 'A-', '2016-03-30', '2016-05-30', 'Available'),
(6, 6, 'B+', '2015-08-01', '2015-10-01', 'Available'),
(7, 7, 'O-', '2016-02-14', '2016-04-14', 'Expired'),
(8, 8, 'AB-', '2016-03-25', '2016-05-25', 'Available'),
(9, 9, 'A+', '2015-06-05', '2015-08-05', 'Available'),
(10, 10, 'B-', '2016-07-18', '2016-09-18', 'Allocated'),
(11, 11, 'O+', '2015-05-15', '2015-07-15', 'Available'),
(12, 12, 'AB+', '2016-04-20', '2016-06-20', 'Expired'),
(13, 13, 'A-', '2016-05-03', '2016-07-03', 'Available'),
(14, 14, 'B+', '2015-02-28', '2015-04-30', 'Available'),
(15, 15, 'O-', '2016-01-12', '2016-03-12', 'Expired'),
(16, 16, 'AB-', '2017-08-10', '2017-10-10', 'Available'),
(17, 17, 'A+', '2015-06-30', '2015-08-30', 'Allocated'),
(18, 18, 'B-', '2015-05-25', '2015-07-25', 'Available'),
(19, 19, 'O+', '2016-07-15', '2016-09-15', 'Available'),
(20, 20, 'AB+', '2015-04-05', '2015-06-05', 'Allocated');

--Blood A+ or A- available in blood banks
SELECT  
    [BLOOD_BANK].[dbo].[Donors].[Blood_Bank_Name], [BLOOD_BANK].[dbo].[Blood_Units].[Status]
FROM
     [BLOOD_BANK].[dbo].[Donors]
JOIN [BLOOD_BANK].[dbo].[Blood_Units] ON [BLOOD_BANK].[dbo].[Donors].[Donor_ID]= [BLOOD_BANK].[dbo].[Blood_Units].[Donor_id]
WHERE  [BLOOD_BANK].[dbo].[Donors].[Blood_Type]='A+' OR [BLOOD_BANK].[dbo].[Donors].[Blood_Type]='A-';

--Who get blood from which blood bank
SELECT
    [BLOOD_BANK].[dbo].[Recipients].[Name],[BLOOD_BANK].[dbo].[Donors].[Blood_Bank_Name],[BLOOD_BANK].[dbo].[Blood_Units].[Donation_Date],[BLOOD_BANK].[dbo].[Recipients].[Requirement_Date]
FROM
    [BLOOD_BANK].[dbo].[Recipients]
JOIN [BLOOD_BANK].[dbo].[Donors] ON [BLOOD_BANK].[dbo].[Recipients].[Donor_ID]  =[BLOOD_BANK].[dbo].[Donors].[Donor_ID]
JOIN [BLOOD_BANK].[dbo].[Blood_Units] ON [BLOOD_BANK].[dbo].[Recipients].[Donor_ID]=  [BLOOD_BANK].[dbo].[Blood_Units].[Donor_id]
WHERE [BLOOD_BANK].[dbo].[Blood_Units].[Donation_Date]< [BLOOD_BANK].[dbo].[Recipients].[Requirement_Date] 
      AND [BLOOD_BANK].[dbo].[Blood_Units].[Status]!='Expired' 
      AND  [BLOOD_BANK].[dbo].[Blood_Units].[Status]!='Allocated'; 

--Is all expired blood present in the blood bank
SELECT 
    [BLOOD_BANK].[dbo].[Donors].[Blood_Bank_Name], [BLOOD_BANK].[dbo].[Blood_Units].[Status]
FROM 
    [BLOOD_BANK].[dbo].[Donors]
JOIN [BLOOD_BANK].[dbo].[Blood_Units] ON [BLOOD_BANK].[dbo].[Donors].[Donor_ID]= [BLOOD_BANK].[dbo].[Blood_Units].[Donor_id]
WHERE [BLOOD_BANK].[dbo].[Blood_Units].[Status]='Expired' ;

--Blood type donated by donors
SELECT 
    [Blood_Type], COUNT(*) AS Count 
FROM 
    [BLOOD_BANK].[dbo].[Donors]
GROUP BY 
    [Blood_Type] 
ORDER BY 
    Count DESC;
 --Blood type by recipents
 SELECT 
    [Blood_Type], COUNT(*) AS Count 
FROM 
    [BLOOD_BANK].[dbo].[Recipients] 
GROUP BY 
    [Blood_Type] 
ORDER BY 
    Count DESC;

 --Average donation given by each year
SELECT
    YEAR([BLOOD_BANK].[dbo].[Donors].[Last_Donation_Date]) AS DonationYear, 
    COUNT(*) AS DonationCount
FROM
    [BLOOD_BANK].[dbo].[Donors]
GROUP BY 
    YEAR([BLOOD_BANK].[dbo].[Donors].[Last_Donation_Date]);

 --Blood requirement in each year
SELECT
    YEAR([BLOOD_BANK].[dbo].[Recipients].[Requirement_Date]) AS RequirmentYear,
	COUNT(*) AS RequirmentCount
FROM
	[BLOOD_BANK].[dbo].[Recipients]
GROUP BY 
    YEAR([BLOOD_BANK].[dbo].[Recipients].[Requirement_Date]);

--Average age of donor and recipient
SELECT 
    AVG([BLOOD_BANK].[dbo].[Donors].[Age]) AS DonorAverageAge, 
    AVG([BLOOD_BANK].[dbo].[Recipients].[Age]) AS RecipientAverageAge 
FROM [BLOOD_BANK].[dbo].[Donors]
JOIN [BLOOD_BANK].[dbo].[Recipients] ON [BLOOD_BANK].[dbo].[Donors].[Donor_ID]=[BLOOD_BANK].[dbo].[Recipients].[Donor_ID];
