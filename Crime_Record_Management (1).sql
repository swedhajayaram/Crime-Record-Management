create database Crime_Record_Management
use Crime_Record_Management ;

CREATE TABLE police_station (
  station_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  city varchar(200) NOT NULL,
  address VARCHAR(255),
  contact VARCHAR(30)
);

CREATE TABLE officer (
  officer_id INT AUTO_INCREMENT PRIMARY KEY,
  station_id INT,
  name VARCHAR(120),
  rank_ VARCHAR(50),
  badge_no VARCHAR(30) UNIQUE,
  phone VARCHAR(25),
  email VARCHAR(120),
  hire_date DATE,
  FOREIGN KEY (station_id) REFERENCES police_station(station_id) ON DELETE SET NULL
);

CREATE TABLE CrimeType (
    crime_type_id INT PRIMARY KEY AUTO_INCREMENT,
    crime_name VARCHAR(100)
);

CREATE TABLE CaseStatus (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50)
);

CREATE TABLE CrimeRecord (
	crime_id INT PRIMARY KEY AUTO_INCREMENT,
    crime_date DATE,
    crime_type_id INT,
    officer_id INT,
    station_id INT,
    status_id INT,
    description TEXT,
    FOREIGN KEY (crime_type_id) REFERENCES CrimeType(crime_type_id),
    FOREIGN KEY (officer_id) REFERENCES officer(officer_id),
    FOREIGN KEY (station_id) REFERENCES police_station(station_id),
    FOREIGN KEY (status_id) REFERENCES CaseStatus(status_id)
);

CREATE TABLE Victim (
    victim_id INT PRIMARY KEY AUTO_INCREMENT,
    victim_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    crime_id INT,
    FOREIGN KEY (crime_id) REFERENCES CrimeRecord(crime_id)
);

CREATE TABLE Suspect (
    suspect_id INT PRIMARY KEY AUTO_INCREMENT,
    suspect_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    crime_id INT,
    FOREIGN KEY (crime_id) REFERENCES CrimeRecord(crime_id)
);

CREATE TABLE CourtCase (
    court_id INT PRIMARY KEY AUTO_INCREMENT,
    crime_id INT,
    hearing_date DATE,
    verdict VARCHAR(200),
    FOREIGN KEY (crime_id) REFERENCES CrimeRecord(crime_id)
);

CREATE TABLE Evidence (
    evidence_id INT PRIMARY KEY AUTO_INCREMENT,
    crime_id INT,
    evidence_type VARCHAR(100),
    description TEXT,
    FOREIGN KEY (crime_id) REFERENCES CrimeRecord(crime_id)
);
INSERT INTO police_station (name, city, address, contact) VALUES ('Royapuram PS', 'Chennai', 'Royapuram PS address, Chennai', '+919892433781'),
 ('Tambaram PS', 'Chennai', 'Tambaram PS address, Chennai', '+915249748847'),
 ('Tondiarpet PS', 'Chennai', 'Tondiarpet PS address, Chennai', '+916049809101'),
 ('Ayanavaram PS', 'Chennai', 'Ayanavaram PS address, Chennai', '+912602408214'),
 ('Ramanathapuram PS', 'Coimbatore', 'Ramanathapuram PS address, Coimbatore', '+919772789665'),
 ('Gandhipuram PS', 'Coimbatore', 'Gandhipuram PS address, Coimbatore', '+913353358115'),
 ('Sivanandha Colony PS', 'Coimbatore', 'Sivanandha Colony PS address, Coimbatore', '+916242986760'),
 ('Anna Nagar PS', 'Madurai', 'Anna Nagar PS address, Madurai', '+918809168955'),
 ('Thiruparankundram PS', 'Madurai', 'Thiruparankundram PS address, Madurai', '+911492712295'),
 ('East Gate PS', 'Madurai', 'East Gate PS address, Madurai', '+910520969269'),
 ('Thillai Nagar PS', 'Tiruchirappalli', 'Thillai Nagar PS address, Tiruchirappalli', '+910686756546'),
 ('Srirangam PS', 'Tiruchirappalli', 'Srirangam PS address, Tiruchirappalli', '+914031629213'),
 ('Town PS', 'Salem', 'Town PS address, Salem', '+912295501333'),
 ('Omalur PS', 'Salem', 'Omalur PS address, Salem', '+914436709342'),
 ('Surampatti PS', 'Erode', 'Surampatti PS address, Erode', '+913987585687'),
 ('Sathamangalam PS', 'Erode', 'Sathamangalam PS address, Erode', '+912785182888'),
 ('Katpadi PS', 'Vellore', 'Katpadi PS address, Vellore', '+913658395510'),
 ('Officer''s PS', 'Vellore', 'Officer''s PS address, Vellore', '+914464362813'),
 ('Palayamkottai PS', 'Tirunelveli', 'Palayamkottai PS address, Tirunelveli', '+917709380062'),
 ('Tenkasi PS', 'Tirunelveli', 'Tenkasi PS address, Tirunelveli', '+910107999095'),
 ('Kumbakonam PS', 'Thanjavur', 'Kumbakonam PS address, Thanjavur', '+918490245794'),
 ('Pattukottai PS', 'Thanjavur', 'Pattukottai PS address, Thanjavur', '+918850095695'),
 ('Walajabad PS', 'Kanchipuram', 'Walajabad PS address, Kanchipuram', '+916504147461'),
 ('Pallavaram PS', 'Kanchipuram', 'Pallavaram PS address, Kanchipuram', '+917977136549');

INSERT INTO officer (station_id, name, rank_, badge_no, phone, email, hire_date) VALUES (1, 'Officer_1', 'Inspector', 'TN1001', '+916189998509', 'officer1@tnpolice.example', '2018-04-28'),
(2, 'Officer_2', 'Inspector', 'TN1002', '+910189938054', 'officer2@tnpolice.example', '2017-03-26'),
(3, 'Officer_3', 'Sub-Inspector', 'TN1003', '+913655471516', 'officer3@tnpolice.example', '2017-12-03'),
(4, 'Officer_4', 'Sub-Inspector', 'TN1004', '+913044019391', 'officer4@tnpolice.example', '2013-04-06'),
(5, 'Officer_5', 'Sub-Inspector', 'TN1005', '+914280584269', 'officer5@tnpolice.example', '2012-09-15'),
(6, 'Officer_6', 'Constable', 'TN1006', '+911366018120', 'officer6@tnpolice.example', '2011-02-07'),
(7, 'Officer_7', 'Deputy Superintendent', 'TN1007', '+916211274749', 'officer7@tnpolice.example', '2018-01-09'),
(8, 'Officer_8', 'Head Constable', 'TN1008', '+918824014589', 'officer8@tnpolice.example', '2009-03-04'),
(9, 'Officer_9', 'Head Constable', 'TN1009', '+917228271403', 'officer9@tnpolice.example', '2013-04-16'),
(10, 'Officer_10', 'Sub-Inspector', 'TN1010', '+918101702911', 'officer10@tnpolice.example', '2017-08-02'),
(11, 'Officer_11', 'Constable', 'TN1011', '+919579862184', 'officer11@tnpolice.example', '2010-12-10'),
(12, 'Officer_12', 'Constable', 'TN1012', '+919794022792', 'officer12@tnpolice.example', '2017-10-13'),
(13, 'Officer_13', 'Constable', 'TN1013', '+914610572700', 'officer13@tnpolice.example', '2009-12-20'),
(14, 'Officer_14', 'Deputy Superintendent', 'TN1014', '+917351903250', 'officer14@tnpolice.example', '2009-12-24'),
(15, 'Officer_15', 'Head Constable', 'TN1015', '+914659609501', 'officer15@tnpolice.example', '2017-11-12'),
(16, 'Officer_16', 'Constable', 'TN1016', '+915939648718', 'officer16@tnpolice.example', '2014-06-13'),
(17, 'Officer_17', 'Head Constable', 'TN1017', '+915484548106', 'officer17@tnpolice.example', '2018-11-18'),
(18, 'Officer_18', 'Inspector', 'TN1018', '+914766811689', 'officer18@tnpolice.example', '2013-02-25'),
(19, 'Officer_19', 'Inspector', 'TN1019', '+912693327843', 'officer19@tnpolice.example', '2016-06-08'),
(20, 'Officer_20', 'Deputy Superintendent', 'TN1020', '+915181593483', 'officer20@tnpolice.example', '2013-01-15'),
(21, 'Officer_21', 'Head Constable', 'TN1021', '+917083040749', 'officer21@tnpolice.example', '2005-06-12'),
(22, 'Officer_22', 'Constable', 'TN1022', '+914560637237', 'officer22@tnpolice.example', '2019-02-27'),
(23, 'Officer_23', 'Inspector', 'TN1023', '+916984000363', 'officer23@tnpolice.example', '2012-07-26'),
(24, 'Officer_24', 'Sub-Inspector', 'TN1024', '+913809727624', 'officer24@tnpolice.example', '2020-02-23'),
(1, 'Officer_25', 'Sub-Inspector', 'TN1025', '+914222915677', 'officer25@tnpolice.example', '2015-03-19'),
(2, 'Officer_26', 'Constable', 'TN1026', '+916744803506', 'officer26@tnpolice.example', '2014-02-16'),
(3, 'Officer_27', 'Inspector', 'TN1027', '+912545873288', 'officer27@tnpolice.example', '2005-05-14'),
(4, 'Officer_28', 'Sub-Inspector', 'TN1028', '+911893007738', 'officer28@tnpolice.example', '2019-04-15'),
(5, 'Officer_29', 'Inspector', 'TN1029', '+918851635084', 'officer29@tnpolice.example', '2017-05-09'),
(6, 'Officer_30', 'Constable', 'TN1030', '+916018840847', 'officer30@tnpolice.example', '2016-05-01'),
(7, 'Officer_31', 'Constable', 'TN1031', '+918679595160', 'officer31@tnpolice.example', '2011-11-21'),
(8, 'Officer_32', 'Deputy Superintendent', 'TN1032', '+918000291771', 'officer32@tnpolice.example', '2010-10-19'),
(9, 'Officer_33', 'Inspector', 'TN1033', '+912524419810', 'officer33@tnpolice.example', '2013-10-17'),
(10, 'Officer_34', 'Head Constable', 'TN1034', '+919593964068', 'officer34@tnpolice.example', '2015-04-28'),
(11, 'Officer_35', 'Inspector', 'TN1035', '+918222539936', 'officer35@tnpolice.example', '2009-09-23'),
(12, 'Officer_36', 'Constable', 'TN1036', '+912164710188', 'officer36@tnpolice.example', '2010-06-15'),
(13, 'Officer_37', 'Inspector', 'TN1037', '+917813071554', 'officer37@tnpolice.example', '2006-12-12'),
(14, 'Officer_38', 'Constable', 'TN1038', '+915830633041', 'officer38@tnpolice.example', '2018-11-22'),
(15, 'Officer_39', 'Deputy Superintendent', 'TN1039', '+915361276004', 'officer39@tnpolice.example', '2010-06-10'),
(16, 'Officer_40', 'Inspector', 'TN1040', '+918255250502', 'officer40@tnpolice.example', '2013-02-19'),
(17, 'Officer_41', 'Constable', 'TN1041', '+913119888028', 'officer41@tnpolice.example', '2015-01-05'),
(18, 'Officer_42', 'Constable', 'TN1042', '+918510396550', 'officer42@tnpolice.example', '2008-03-13'),
(19, 'Officer_43', 'Inspector', 'TN1043', '+911487164369', 'officer43@tnpolice.example', '2020-07-21'),
(20, 'Officer_44', 'Sub-Inspector', 'TN1044', '+919198182697', 'officer44@tnpolice.example', '2008-02-09'),
(21, 'Officer_45', 'Constable', 'TN1045', '+914694365726', 'officer45@tnpolice.example', '2012-10-08'),
(22, 'Officer_46', 'Sub-Inspector', 'TN1046', '+911628442580', 'officer46@tnpolice.example', '2006-03-26'),
(23, 'Officer_47', 'Deputy Superintendent', 'TN1047', '+911255110781', 'officer47@tnpolice.example', '2018-05-07'),
(24, 'Officer_48', 'Inspector', 'TN1048', '+916225500618', 'officer48@tnpolice.example', '2006-08-13'),
(1, 'Officer_49', 'Head Constable', 'TN1049', '+918339808035', 'officer49@tnpolice.example', '2011-07-13'),
(2, 'Officer_50', 'Constable', 'TN1050', '+915588433066', 'officer50@tnpolice.example', '2018-11-10');

INSERT INTO CrimeType (crime_name) VALUES
('Theft'),('Murder'),('Kidnapping'),('Cyber Crime'),
('Fraud'),('Drug Smuggling'),('Domestic Violence'),
('Chain Snatching'),('Robbery'),('Human Trafficking');
select * from CrimeRecord;
INSERT INTO CrimeRecord (crime_date, crime_type_id, officer_id, station_id, status_id, description) VALUES
('2024-05-10', 1, 1, 1, 2, 'Bike theft near T Nagar bus stand'),
('2024-06-12', 2, 1, 2, 1, 'Murder reported in Anna Nagar park'),
('2024-07-03', 4, 2, 3, 2, 'Online banking fraud case registered'),
('2024-08-21', 8, 5, 7, 3, 'Chain snatching incident reported'),
('2024-09-15', 6, 8, 10, 2, 'Drug smuggling case intercepted at port'),
('2024-09-07', 5, 8, 24, 3, 'Complaint of missing person filed by a resident of Erode. Individual last seen two days prior.'),
('2023-09-04', 3, 7, 20, 2, 'Physical assault between two neighbors over a property dispute in Tiruchirappalli.'),
('2023-10-26', 3, 2, 10, 1, 'Fatal road accident on the Salem–Bangalore highway involving a truck and a car.'),
('2024-03-07', 6, 1, 11, 4, 'Drunk driving case registered near Coimbatore Gandhipuram flyover.'),
('2024-12-09', 4, 2, 12, 1, 'Fatal road accident on the Salem–Bangalore highway involving a truck and a car.'),
('2024-01-22', 6, 5, 13, 3, 'Drunk driving case registered near Coimbatore Gandhipuram flyover.'),
('2023-08-18', 9, 7, 7, 2, 'Residential burglary at an apartment in Coimbatore’s Gandhipuram area. Gold jewelry and cash missing.'),
('2023-02-26', 8, 9, 20, 1, 'Donation box broken open at a temple in Tirunelveli, approximately ₹10,000 stolen.'),
('2023-06-17', 4, 8, 6, 1, 'Fatal road accident on the Salem–Bangalore highway involving a truck and a car.'),
('2024-09-01', 1, 1, 3, 4, 'Drunk driving case registered near Coimbatore Gandhipuram flyover.'),
('2024-11-04', 8, 3, 10, 4, 'Domestic violence complaint filed against husband for assaulting wife under the influence of alcohol in Erode.'),
('2024-09-01', 10, 6, 7, 2, 'Online bank fraud case reported from Vellore involving ₹75,000 loss due to fake KYC message.'),
('2024-11-26', 2, 5, 5, 1, 'Drunk driving case registered near Coimbatore Gandhipuram flyover.'),
('2024-06-14', 3, 9, 8, 2, 'A motorcycle was reported stolen from the parking lot near T. Nagar Bus Stand, Chennai.'),
('2023-03-10', 2, 2, 9, 3, 'Forgery of land documents discovered during civil case investigation in Thanjavur.'),
('2024-01-25', 9, 6, 10, 2, 'Fatal road accident on the Salem–Bangalore highway involving a truck and a car.'),
('2023-11-23', 7, 8, 9, 3, 'Online bank fraud case reported from Vellore involving ₹75,000 loss due to fake KYC message.'),
('2024-11-26', 2, 5, 5, 1, 'Drunk driving case registered near Coimbatore Gandhipuram flyover.'),
('2024-06-14', 3, 9, 8, 2, 'A motorcycle was reported stolen from the parking lot near T. Nagar Bus Stand, Chennai.'),
('2023-03-10', 2, 2, 9, 3, 'Forgery of land documents discovered during civil case investigation in Thanjavur.'),
('2024-01-25', 9, 6, 10, 2, 'Fatal road accident on the Salem–Bangalore highway involving a truck and a car.'),
('2023-11-23', 7, 8, 9, 3, 'Online bank fraud case reported from Vellore involving ₹75,000 loss due to fake KYC message.'),
('2023-03-10', 4, 7, 11, 1, 'Drunk driving case registered near Coimbatore Gandhipuram flyover.'),
('2023-06-09', 9, 8, 9, 2, 'Drunk driving case registered near Coimbatore Gandhipuram flyover.'),
('2024-05-09', 7, 14, 3, 4, 'A motorcycle was reported stolen from the parking lot near T. Nagar Bus Stand, Chennai.'),
('2023-06-23', 10, 11, 7, 4, 'Forgery of land documents discovered during civil case investigation in Thanjavur.'),
('2023-11-23', 7, 6, 12, 4, 'Fatal road accident on the Salem–Bangalore highway involving a truck and a car.'),
('2024-08-16', 7, 10, 3, 4, 'Donation box broken open at a temple in Tirunelveli, approximately ₹10,000 stolen.'),
('2024-11-19', 4, 16, 20, 3, 'Residential burglary at an apartment in Coimbatore’s Gandhipuram area. Gold jewelry and cash missing.'),
('2023-10-28', 3, 10, 12, 1, 'Forgery of land documents discovered during civil case investigation in Thanjavur.'),
('2023-07-27', 10, 5, 8, 1, 'Online bank fraud case reported from Vellore involving ₹75,000 loss due to fake KYC message.'),
('2024-04-17', 6, 17, 11, 1, 'Forgery of land documents discovered during civil case investigation in Thanjavur.'),
('2024-07-30', 4, 11, 8, 1, 'Online bank fraud case reported from Vellore involving ₹75,000 loss due to fake KYC message.'),
('2024-09-15', 4, 12, 21, 1, 'Two individuals arrested for possession of banned narcotics near Kumbakonam Bus Stand, Thanjavur.'),
('2023-04-26', 1, 20, 19, 1, 'Mobile phone snatching incident reported near Madurai Railway Station.'),
('2023-06-23', 2, 10, 3, 4, 'Complaint of missing person filed by a resident of Erode. Individual last seen two days prior.'),
('2024-03-07', 10, 15, 10, 2, 'Domestic violence complaint filed against husband for assaulting wife under the influence of alcohol in Erode.'),
('2023-03-15', 7, 18, 1, 3, 'Forgery of land documents discovered during civil case investigation in Thanjavur.'),
('2023-04-28', 1, 14, 2, 3, 'Complaint of missing person filed by a resident of Erode. Individual last seen two days prior.'),
('2024-01-07', 7, 17, 3, 1, 'A motorcycle was reported stolen from the parking lot near T. Nagar Bus Stand, Chennai.'),
('2023-07-07', 10, 12, 2, 1, 'Residential burglary at an apartment in Coimbatore’s Gandhipuram area. Gold jewelry and cash missing.'),
('2024-12-29', 7, 16, 10, 3, 'Domestic violence complaint filed against husband for assaulting wife under the influence of alcohol in Erode.');
INSERT INTO Suspect (suspect_name, age, gender, crime_id) VALUES
('Arun Kumar', 32, 'Male', 1),
('Manoj Raj', 28, 'Male', 2),
('Unknown', NULL, 'Male', 3),
('Selvi Devi', 24, 'Female', 4),
('Vinoth Kumar', 36, 'Male', 5),
('Krishnan S', 41, 'Male', 6),
('Malarvizhi T', 29, 'Female', 7),
('Ravi Sankar', 33, 'Male', 8),
('Baskar P', 27, 'Male', 9),
('Deepak Raj', 31, 'Male', 10),
('Unknown', NULL, 'Male', 11),
('Revathi L', 25, 'Female', 12),
('Saravanan M', 39, 'Male', 13),
('Naveen Raj', 30, 'Male', 14),
('Kannan S', 42, 'Male', 15),
('Priya Dharshini', 23, 'Female', 16),
('Bala Krishnan', 35, 'Male', 17),
('Karthik R', 26, 'Male', 18),
('Vimal Raj', 29, 'Male', 19),
('Sundar P', 40, 'Male', 20),
('Kalai Selvi', 31, 'Female', 21),
('Murugan T', 38, 'Male', 22),
('Mohan Raj', 33, 'Male', 23),
('Selvarani D', 28, 'Female', 24),
('Aravind S', 35, 'Male', 25),
('Unknown', NULL, 'Male', 26),
('Dhanalakshmi P', 26, 'Female', 27),
('Ramesh Kumar', 37, 'Male', 28),
('Nithish R', 25, 'Male', 29),
('Pavithra L', 22, 'Female', 30),
('Sathish V', 34, 'Male', 31),
('Kaviya R', 23, 'Female', 32),
('Ragul P', 39, 'Male', 33),
('Ranjith Kumar', 30, 'Male', 34),
('Muthu Raja', 42, 'Male', 35),
('Devi Priya', 27, 'Female', 36),
('Siva Raj', 38, 'Male', 37),
('Arunachalam K', 33, 'Male', 38),
('Monika Devi', 24, 'Female', 39),
('Unknown', NULL, 'Male', 40),
('Jagan M', 29, 'Male', 41),
('Murali Kumar', 31, 'Male', 42),
('Sangeetha P', 26, 'Female', 43),
('Venkatesh R', 44, 'Male', 44),
('Nirmala Devi', 28, 'Female', 45),
('Dinesh Kumar', 36, 'Male', 46),
('Arthi Raj', 25, 'Female', 47);

INSERT INTO Victim (victim_name, age, gender, crime_id) VALUES
('Ramesh Kumar', 35, 'Male', 1),
('Lakshmi Priya', 29, 'Female', 2),
('Anand Babu', 41, 'Male', 3),
('Kavitha Devi', 22, 'Female', 4),
('Suresh Raj', 30, 'Male', 5),
('Meena Rani', 26, 'Female', 6),
('Ganesh Karthik', 37, 'Male', 7),
('Revathi S', 24, 'Female', 8),
('Arun Prakash', 33, 'Male', 9),
('Deepa J', 28, 'Female', 10),
('Kumaravel P', 46, 'Male', 11),
('Nithya S', 27, 'Female', 12),
('Saravanan M', 39, 'Male', 13),
('Sangeetha R', 31, 'Female', 14),
('Rajeshwaran V', 42, 'Male', 15),
('Priyanka D', 25, 'Female', 16),
('Senthil Kumar', 34, 'Male', 17),
('Aishwarya L', 20, 'Female', 18),
('Manikandan P', 29, 'Male', 19),
('Vidhya Lakshmi', 23, 'Female', 20),
('Bala Murugan', 38, 'Male', 21),
('Shanthi Devi', 45, 'Female', 22),
('Vignesh S', 27, 'Male', 23),
('Janani R', 21, 'Female', 24),
('Ravi Chandran', 36, 'Male', 25),
('Sowmya A', 30, 'Female', 26),
('Prabhu M', 40, 'Male', 27),
('Karthika G', 19, 'Female', 28),
('Murali Krishnan', 32, 'Male', 29),
('Divya Shree', 28, 'Female', 30),
('Selvaraj P', 44, 'Male', 31),
('Harini V', 24, 'Female', 32),
('Balaji S', 39, 'Male', 33),
('Shobana Devi', 26, 'Female', 34),
('Sathish Kumar', 31, 'Male', 35),
('Anitha R', 22, 'Female', 36),
('Vijay Kumar', 48, 'Male', 37),
('Gayathri S', 27, 'Female', 38),
('Dinesh K', 33, 'Male', 39),
('Manju Devi', 29, 'Female', 40),
('Raghavan T', 35, 'Male', 41),
('Kavya R', 23, 'Female', 42),
('Arul Das', 38, 'Male', 43),
('Pooja Raj', 21, 'Female', 44),
('Mohan Raj', 42, 'Male', 45),
('Sindhu Lakshmi', 28, 'Female', 46),
('Thiyagarajan S', 37, 'Male', 47);
INSERT INTO CaseStatus (status_name) VALUES
('Open'),('Under Investigation'),('Closed'),('Pending Trial');

INSERT INTO CourtCase (crime_id, hearing_date, verdict) VALUES
(1, '2024-02-10', 'Guilty - Sentenced to 3 years'),
(2, '2024-02-15', 'Pending Trial'),
(3, '2024-03-05', 'Under Investigation'),
(4, '2024-03-20', 'Not Guilty'),
(5, '2024-03-28', 'Guilty - Fined ₹5,000'),
(6, '2024-04-05', 'Case Dismissed'),
(7, '2024-04-12', 'Pending Judgment'),
(8, '2024-04-22', 'Guilty - Sentenced to 2 years'),
(9, '2024-05-01', 'Under Trial'),
(10, '2024-05-15', 'Verdict Awaited'),
(11, '2024-05-25', 'Case Pending'),
(12, '2024-06-02', 'Not Guilty'),
(13, '2024-06-10', 'Guilty - Sentenced to 5 years'),
(14, '2024-06-18', 'Under Investigation'),
(15, '2024-06-25', 'Pending Trial'),
(16, '2024-07-02', 'Case Dismissed'),
(17, '2024-07-09', 'Guilty - Fined ₹8,000'),
(18, '2024-07-16', 'Verdict Awaited'),
(19, '2024-07-25', 'Not Guilty'),
(20, '2024-08-01', 'Pending Trial'),
(21, '2024-08-10', 'Under Trial'),
(22, '2024-08-18', 'Case Pending'),
(23, '2024-08-25', 'Guilty - Sentenced to 4 years'),
(24, '2024-09-01', 'Not Guilty'),
(25, '2024-09-08', 'Under Investigation'),
(26, '2024-09-15', 'Guilty - Fined ₹10,000'),
(27, '2024-09-22', 'Pending Judgment'),
(28, '2024-10-01', 'Guilty - Sentenced to 1 year'),
(29, '2024-10-08', 'Under Trial'),
(30, '2024-10-15', 'Verdict Awaited'),
(31, '2024-10-22', 'Case Dismissed'),
(32, '2024-11-01', 'Pending Trial'),
(33, '2024-11-08', 'Guilty - Sentenced to 6 months'),
(34, '2024-11-15', 'Not Guilty'),
(35, '2024-11-22', 'Under Investigation'),
(36, '2024-12-01', 'Pending Judgment'),
(37, '2024-12-10', 'Guilty - Sentenced to 5 years'),
(38, '2024-12-18', 'Case Pending'),
(39, '2024-12-25', 'Verdict Awaited'),
(40, '2025-01-02', 'Under Trial'),
(41, '2025-01-10', 'Guilty - Fined ₹7,000'),
(42, '2025-01-18', 'Not Guilty'),
(43, '2025-01-25', 'Pending Trial'),
(44, '2025-02-01', 'Under Investigation'),
(45, '2025-02-08', 'Case Dismissed'),
(46, '2025-02-15', 'Guilty - Sentenced to 2 years'),
(47, '2025-02-22', 'Pending Judgment');

INSERT INTO Evidence (crime_id, evidence_type, description) VALUES
(1, 'CCTV Footage', 'Footage showing the suspect near T Nagar bus stand'),
(2, 'Weapon', 'Knife recovered from crime scene in Anna Nagar park'),
(3, 'Digital Evidence', 'Bank transaction logs of online fraud'),
(4, 'Photograph', 'Images from witness mobile showing attacker'),
(5, 'Document', 'Fake shipment papers found at port'),
(6, 'Fingerprint', 'Fingerprint match on stolen car door handle'),
(7, 'CCTV Footage', 'Recording from Coimbatore main junction'),
(8, 'Mobile Phone', 'Confiscated phone used for ransom calls'),
(9, 'Blood Sample', 'DNA matched to suspect'),
(10, 'Cash', '₹25,000 recovered from robbery site'),
(11, 'Weapon', 'Pistol seized from suspect’s home'),
(12, 'Document', 'Forged signature proof collected'),
(13, 'Vehicle', 'Bike used in chain snatching'),
(14, 'Photograph', 'Crime scene images stored by forensics'),
(15, 'Fingerprint', 'Lifted from window glass'),
(16, 'Digital Evidence', 'Email threats sent from cyber café'),
(17, 'CCTV Footage', 'Camera footage from Salem bus stand'),
(18, 'Weapon', 'Iron rod recovered from scene'),
(19, 'Document', 'Fake land deed papers found'),
(20, 'Audio Recording', 'Call recording of suspect’s confession'),
(21, 'Photograph', 'Scene pictures verified by police unit'),
(22, 'CCTV Footage', 'Entry gate recording'),
(23, 'Cash', '₹50,000 found hidden in suspect’s locker'),
(24, 'Weapon', 'Revolver used in attempted murder'),
(25, 'Digital Evidence', 'Laptop logs showing hacking activity'),
(26, 'Document', 'Forged cheque recovered'),
(27, 'Fingerprint', 'Found on victim’s purse'),
(28, 'Weapon', 'Baseball bat with blood stains'),
(29, 'CCTV Footage', 'Captured near jewellery store'),
(30, 'Mobile Phone', 'Used for scam messages'),
(31, 'Photograph', 'Victim’s car damaged photo'),
(32, 'Document', 'Fraudulent ID card seized'),
(33, 'Weapon', 'Broken glass bottle found at site'),
(34, 'Fingerprint', 'Matched on wallet surface'),
(35, 'CCTV Footage', 'Video from ATM camera'),
(36, 'Audio Recording', 'Witness recorded confession'),
(37, 'Vehicle', 'Scooter abandoned by suspect'),
(38, 'Mobile Phone', 'WhatsApp chat evidence'),
(39, 'Document', 'Counterfeit currency bills'),
(40, 'Weapon', 'Knife recovered from kitchen drawer'),
(41, 'CCTV Footage', 'Store entrance footage'),
(42, 'Fingerprint', 'Recovered from steering wheel'),
(43, 'Photograph', 'Photo of stolen jewellery'),
(44, 'Digital Evidence', 'IP address logs traced to suspect'),
(45, 'Document', 'Fake contract seized'),
(46, 'Audio Recording', 'Voice proof of extortion call'),
(47, 'Weapon', 'Gun recovered from hideout');
-- query questions--
select * from CrimeRecord where year(crime_date)= 2024;
select * from police_station where city='chennai';
select cr.crime_id,cr.crime_date,cr.description,ct.crime_name,ps.city,ps.name from police_station as ps
inner join CrimeRecord as cr on ps.station_id=cr.station_id
inner join CrimeType as ct on cr.crime_type_id=ct.crime_type_id order by crime_id;
select victim_id,victim_name,age,gender,ct.crime_name,cr.description from CrimeType as ct
inner join CrimeRecord as cr  on ct.crime_type_id=cr.crime_type_id
inner join Victim as v on cr.crime_id=v.crime_id order by victim_id;
select s.suspect_id,s.suspect_name,s.age,s.gender,ct.crime_name,cr.description,ps.city from police_station as ps 
inner join CrimeRecord as cr on ps.station_id=cr.station_id
inner join CrimeType as ct on cr.crime_type_id=ct.crime_type_id
inner join Suspect as s on cr.crime_id=s.crime_id
order by suspect_id;
select cr.crime_id,cr.crime_date,cr.description,o.name,o.rank_,status_name from CrimeRecord as cr
inner join officer as o on cr.officer_id=o.officer_id
inner join CaseStatus as cs on cr.status_id=cs.status_id
order by crime_id;
select cc.court_id,cr.crime_id,cc.hearing_date,cr.description,cc.verdict from CrimeRecord as cr 
inner join CourtCase as cc on cr.crime_id=cc.crime_id
order by court_id;
select e.evidence_id,e.evidence_type,e.description as evidence_description,cr.crime_id,cr.crime_date,cr.description from CrimeRecord as cr
inner join evidence as e on cr.crime_id=e.crime_id
order by evidence_id;
SELECT cr.crime_id,cr.description,v.victim_name,s.suspect_name,ps.city as city_name
FROM CrimeRecord cr
inner join Victim v ON cr.crime_id = v.crime_id
inner JOIN Suspect s ON cr.crime_id = s.crime_id
inner JOIN police_station ps ON cr.station_id = ps.station_id
WHERE v.crime_id = s.crime_id;
SELECT 
    ps.city as city_name,
    COUNT(cr.crime_id) AS total_crimes
FROM CrimeRecord cr
JOIN  police_station ps ON cr.station_id=ps.station_id
GROUP BY  ps.city
ORDER BY total_crimes DESC;
SELECT 
    cr.crime_id,
    cr.description,
    COUNT(v.victim_id) AS total_victims,
    cc.verdict
FROM CrimeRecord cr
inner JOIN CourtCase cc ON cr.crime_id = cc.crime_id
inner JOIN Victim v ON cr.crime_id = v.crime_id
WHERE cc.verdict LIKE '%Guilty%'
GROUP BY cr.crime_id, cr.description, cc.verdict;

CALL GetCrimesByCity('Chennai');

CALL GetCrimeDetails(6);


















