# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_wastemanagement
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2023-06-21 07:12:43
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_wastemanagement'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_wastemanagement" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_wastemanagement";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(10) unsigned NOT NULL auto_increment,
  "admin_name" varchar(50) NOT NULL,
  "admin_email" varchar(50) NOT NULL,
  "admin_password" varchar(50) NOT NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_email", "admin_password") VALUES
	('1','admin','admin@gmail.com','admin12');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_agency'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_agency" (
  "agency_id" int(11) unsigned NOT NULL auto_increment,
  "agency_email" varchar(50) default NULL,
  "agency_address" varchar(50) default NULL,
  "agency_name" varchar(50) default NULL,
  "agency_contact" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  "agency_logo" varchar(50) default NULL,
  "agency_proof" varchar(50) default NULL,
  "agency_password" varchar(50) default NULL,
  "agency_doj" varchar(50) default NULL,
  "agency_vstatus" int(10) unsigned default '0',
  PRIMARY KEY  ("agency_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_agency'
#

LOCK TABLES "tbl_agency" WRITE;
/*!40000 ALTER TABLE "tbl_agency" DISABLE KEYS;*/
REPLACE INTO "tbl_agency" ("agency_id", "agency_email", "agency_address", "agency_name", "agency_contact", "place_id", "agency_logo", "agency_proof", "agency_password", "agency_doj", "agency_vstatus") VALUES
	('5','abhinav@gmail.com','Thoppil house ','Abhinav Reji','9745229990','2','ALogo_1130.png','AProof_1906.jpg','abhinav','2023-05-28','1');
REPLACE INTO "tbl_agency" ("agency_id", "agency_email", "agency_address", "agency_name", "agency_contact", "place_id", "agency_logo", "agency_proof", "agency_password", "agency_doj", "agency_vstatus") VALUES
	('7','ardrau@gmail.com','Chettayil H','Ardra Unni','9746158198','5','ALogo_1073.jpg','AProof_1010.jpg','unni','2023-05-28','1');
/*!40000 ALTER TABLE "tbl_agency" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" int(10) unsigned NOT NULL auto_increment,
  "complainttype_id" int(10) unsigned NOT NULL,
  "complaint_description" varchar(50) default NULL,
  "complaint_status" varchar(50) default '0',
  "user_id" int(10) unsigned NOT NULL default '0',
  "complaint_date" varchar(50) default '0',
  "complaint_reply" varchar(250) default '0',
  PRIMARY KEY  ("complaint_id")
);



#
# Dumping data for table 'tbl_complaint'
#

# No data found.



#
# Table structure for table 'tbl_complainttype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complainttype" (
  "complainttype_id" int(10) unsigned NOT NULL auto_increment,
  "complainttype_title" varchar(100) NOT NULL,
  PRIMARY KEY  ("complainttype_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_complainttype'
#

LOCK TABLES "tbl_complainttype" WRITE;
/*!40000 ALTER TABLE "tbl_complainttype" DISABLE KEYS;*/
REPLACE INTO "tbl_complainttype" ("complainttype_id", "complainttype_title") VALUES
	('3','Theft');
REPLACE INTO "tbl_complainttype" ("complainttype_id", "complainttype_title") VALUES
	('4','Misbehave');
REPLACE INTO "tbl_complainttype" ("complainttype_id", "complainttype_title") VALUES
	('5','Delay');
/*!40000 ALTER TABLE "tbl_complainttype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(10) unsigned NOT NULL auto_increment,
  "district_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=29;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('12','Ernakulam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('16','kottayam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('17','trissur');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('18','wayanad');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('19','palakkad');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('20','Kasargod');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('21','Kannur');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('22','Kozhikod');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('23','Malappuram');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('24','Idukki');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('25','Alappuzha');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('26','Pathanamthitta');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('27','Kollam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('28','Thiruvananthapuram');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_employee'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_employee" (
  "employee_id" int(10) unsigned NOT NULL auto_increment,
  "employee_name" varchar(50) NOT NULL,
  "employee_address" varchar(50) NOT NULL,
  "employee_contact" varchar(50) NOT NULL,
  "employee_email" varchar(50) NOT NULL,
  "employee_photo" varchar(50) NOT NULL,
  "employee_proof" varchar(50) NOT NULL,
  "employee_doj" varchar(50) NOT NULL,
  "supervisor_id" int(10) unsigned NOT NULL,
  "employee_password" varchar(50) NOT NULL,
  "place_id" int(10) unsigned NOT NULL,
  "employee_gender" varchar(50) NOT NULL,
  PRIMARY KEY  ("employee_id")
) AUTO_INCREMENT=17;



#
# Dumping data for table 'tbl_employee'
#

LOCK TABLES "tbl_employee" WRITE;
/*!40000 ALTER TABLE "tbl_employee" DISABLE KEYS;*/
REPLACE INTO "tbl_employee" ("employee_id", "employee_name", "employee_address", "employee_contact", "employee_email", "employee_photo", "employee_proof", "employee_doj", "supervisor_id", "employee_password", "place_id", "employee_gender") VALUES
	('7','Gladsy','Mathilil H','9744221255','gladsy@gmail.com','APhoto_1005.jpg','AProof_1359.jpg','2023-05-28','2','gladsy','2','Female');
REPLACE INTO "tbl_employee" ("employee_id", "employee_name", "employee_address", "employee_contact", "employee_email", "employee_photo", "employee_proof", "employee_doj", "supervisor_id", "employee_password", "place_id", "employee_gender") VALUES
	('8','Bincy','Tharayil H','9847748735','bincy@gmail.com','APhoto_1792.jpg','AProof_1510.jpg','2023-05-28','2','bincy','2','Female');
REPLACE INTO "tbl_employee" ("employee_id", "employee_name", "employee_address", "employee_contact", "employee_email", "employee_photo", "employee_proof", "employee_doj", "supervisor_id", "employee_password", "place_id", "employee_gender") VALUES
	('10','Chaandhu','Pathanivilasam H','9061622729','chaandhu@gmail.com','APhoto_1951.jpg','AProof_1313.webp','2023-05-28','7','chaandhu','3','Female');
REPLACE INTO "tbl_employee" ("employee_id", "employee_name", "employee_address", "employee_contact", "employee_email", "employee_photo", "employee_proof", "employee_doj", "supervisor_id", "employee_password", "place_id", "employee_gender") VALUES
	('11','Ashif','Thekkumtharayil H','8921588472','ashif@gmail.com','APhoto_1232.jpg','AProof_1839.jpg','2023-05-28','8','ashif','10','Male');
REPLACE INTO "tbl_employee" ("employee_id", "employee_name", "employee_address", "employee_contact", "employee_email", "employee_photo", "employee_proof", "employee_doj", "supervisor_id", "employee_password", "place_id", "employee_gender") VALUES
	('12','Anakha','Anakhalayam H','9061622725','anakha@gmail.com','APhoto_1305.jpg','AProof_1543.webp','2023-05-28','8','anakha','10','Female');
REPLACE INTO "tbl_employee" ("employee_id", "employee_name", "employee_address", "employee_contact", "employee_email", "employee_photo", "employee_proof", "employee_doj", "supervisor_id", "employee_password", "place_id", "employee_gender") VALUES
	('13','Vivek','Vivekananda H','8973346679','vivek@gmail.com','APhoto_1267.jpg','AProof_1060.webp','2023-05-28','9','vivek','5','Male');
REPLACE INTO "tbl_employee" ("employee_id", "employee_name", "employee_address", "employee_contact", "employee_email", "employee_photo", "employee_proof", "employee_doj", "supervisor_id", "employee_password", "place_id", "employee_gender") VALUES
	('15','Mark','Mark valley H','9867346688','mark@gmail.com','APhoto_1467.jpg','AProof_1852.jpeg','2023-05-28','9','mark','5','Male');
REPLACE INTO "tbl_employee" ("employee_id", "employee_name", "employee_address", "employee_contact", "employee_email", "employee_photo", "employee_proof", "employee_doj", "supervisor_id", "employee_password", "place_id", "employee_gender") VALUES
	('16','Sandra','Pathanipadathu H','8921488472','sandra@gmail.com','APhoto_1724.jpg','AProof_1601.webp','2023-05-28','7','sandra','3','Female');
/*!40000 ALTER TABLE "tbl_employee" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_feedback" (
  "feedback_id" int(10) unsigned NOT NULL auto_increment,
  "feedback_content" varchar(50) NOT NULL,
  "feedback_date" varchar(50) NOT NULL,
  PRIMARY KEY  ("feedback_id")
);



#
# Dumping data for table 'tbl_feedback'
#

# No data found.



#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(10) unsigned NOT NULL auto_increment,
  "place_name" varchar(50) NOT NULL,
  "district_id" int(10) unsigned NOT NULL,
  "type_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=11;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id", "type_id") VALUES
	('1','Muvattupuzha','12','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id", "type_id") VALUES
	('2','tripunithura','12','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id", "type_id") VALUES
	('3','Mulanthuruthy','12','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id", "type_id") VALUES
	('4','Fort Kochi','12','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id", "type_id") VALUES
	('5','Ayarkunnam','16','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id", "type_id") VALUES
	('6','Chalakkudy','17','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id", "type_id") VALUES
	('7','Bathery','18','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id", "type_id") VALUES
	('8','Trivandrum','28','9');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id", "type_id") VALUES
	('9','Alanallur','19','10');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id", "type_id") VALUES
	('10','Vaikom','16','7');
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_rdwaste'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_rdwaste" (
  "rdwaste_id" int(10) unsigned NOT NULL auto_increment,
  "user_id" int(10) unsigned NOT NULL,
  "place_id" int(10) unsigned NOT NULL,
  "rdwaste_status" int(50) NOT NULL default '0',
  "rdwaste_date" varchar(50) NOT NULL,
  "rdwaste_details" varchar(50) default '0',
  "rdwaste_photo" varchar(50) NOT NULL,
  "rdwaste_landmark" varchar(50) NOT NULL,
  "rdwaste_latitude" varchar(50) default NULL,
  "rdwaste_longitude" varchar(100) default NULL,
  "employee_id" int(10) unsigned default '0',
  PRIMARY KEY  ("rdwaste_id")
);



#
# Dumping data for table 'tbl_rdwaste'
#

# No data found.



#
# Table structure for table 'tbl_supervisor'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_supervisor" (
  "supervisor_id" int(50) unsigned NOT NULL auto_increment,
  "supervisor_name" varchar(50) NOT NULL,
  "supervisor_address" varchar(50) NOT NULL,
  "supervisor_contact" varchar(50) NOT NULL,
  "supervisor_photo" varchar(50) NOT NULL,
  "supervisor_proof" varchar(50) NOT NULL,
  "supervisor_gender" varchar(50) NOT NULL,
  "supervisor_email" varchar(50) NOT NULL,
  "supervisor_doj" varchar(50) NOT NULL,
  "supervisor_status" varchar(50) NOT NULL default '0',
  "agency_id" int(10) unsigned NOT NULL,
  "supervisor_password" varchar(50) NOT NULL,
  "place_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("supervisor_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_supervisor'
#

LOCK TABLES "tbl_supervisor" WRITE;
/*!40000 ALTER TABLE "tbl_supervisor" DISABLE KEYS;*/
REPLACE INTO "tbl_supervisor" ("supervisor_id", "supervisor_name", "supervisor_address", "supervisor_contact", "supervisor_photo", "supervisor_proof", "supervisor_gender", "supervisor_email", "supervisor_doj", "supervisor_status", "agency_id", "supervisor_password", "place_id") VALUES
	('2','Andriya Jayan','Blayil house','8921488472','APhoto_1358.jpeg','AProof_1211.jpg','Female','andriya@gmail.com','2023-05-28','0','5','andriya','2');
REPLACE INTO "tbl_supervisor" ("supervisor_id", "supervisor_name", "supervisor_address", "supervisor_contact", "supervisor_photo", "supervisor_proof", "supervisor_gender", "supervisor_email", "supervisor_doj", "supervisor_status", "agency_id", "supervisor_password", "place_id") VALUES
	('7','Ardra Biju','Biju Nivas Mulanthuruthy PO Karicode','9061622728','APhoto_2042.jpeg','AProof_2055.jpg','Female','ardrabijuspencer@gmail.com','2023-05-28','0','5','ardra','3');
REPLACE INTO "tbl_supervisor" ("supervisor_id", "supervisor_name", "supervisor_address", "supervisor_contact", "supervisor_photo", "supervisor_proof", "supervisor_gender", "supervisor_email", "supervisor_doj", "supervisor_status", "agency_id", "supervisor_password", "place_id") VALUES
	('8','Basil ','Eruthi H','9744221233','APhoto_2027.jpg','AProof_1720.jpg','Male','basil@gmail.com','2023-05-28','0','7','basil','10');
REPLACE INTO "tbl_supervisor" ("supervisor_id", "supervisor_name", "supervisor_address", "supervisor_contact", "supervisor_photo", "supervisor_proof", "supervisor_gender", "supervisor_email", "supervisor_doj", "supervisor_status", "agency_id", "supervisor_password", "place_id") VALUES
	('9','Arjun','Edavana H','9744221244','APhoto_1989.jpg','AProof_2043.jpg','Male','arjun@gmail.com','2023-05-28','0','7','arjun','5');
/*!40000 ALTER TABLE "tbl_supervisor" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_type'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_type" (
  "type_id" tinyint(3) unsigned NOT NULL auto_increment,
  "type_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("type_id")
) AUTO_INCREMENT=11;



#
# Dumping data for table 'tbl_type'
#

LOCK TABLES "tbl_type" WRITE;
/*!40000 ALTER TABLE "tbl_type" DISABLE KEYS;*/
REPLACE INTO "tbl_type" ("type_id", "type_name") VALUES
	(7,'Municipality');
REPLACE INTO "tbl_type" ("type_id", "type_name") VALUES
	(9,'Corporation');
REPLACE INTO "tbl_type" ("type_id", "type_name") VALUES
	(10,'Panchayath');
/*!40000 ALTER TABLE "tbl_type" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(10) unsigned NOT NULL auto_increment,
  "user_name" varchar(50) NOT NULL,
  "user_email" varchar(50) NOT NULL,
  "user_address" varchar(100) NOT NULL,
  "user_contact" varchar(50) NOT NULL,
  "place_id" int(10) unsigned NOT NULL,
  "user_houseno" int(10) NOT NULL,
  "user_photo" varchar(50) NOT NULL,
  "user_proof" varchar(50) NOT NULL,
  "user_password" varchar(50) NOT NULL,
  "user_latitude" varchar(50) default NULL,
  "user_longitude" varchar(50) default NULL,
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=18;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_address", "user_contact", "place_id", "user_houseno", "user_photo", "user_proof", "user_password", "user_latitude", "user_longitude") VALUES
	('8','Lathi','lathi@gmail.com','Biju N H','9847748734','3',567,'APhoto_1007.jpeg','AProof_1734.jpg','lathi','9.942304012835057','76.34017467408741');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_address", "user_contact", "place_id", "user_houseno", "user_photo", "user_proof", "user_password", "user_latitude", "user_longitude") VALUES
	('9','Biju','biju@gmail.com','Biju Spencer H','9078456134','3',899,'APhoto_1305.jpg','AProof_2097.jpg','biju','9.966670423009438','76.26136780396338');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_address", "user_contact", "place_id", "user_houseno", "user_photo", "user_proof", "user_password", "user_latitude", "user_longitude") VALUES
	('10','Aisha M A','aisha@gmail.com','Moolamkanni House','7736270652','2',780,'APhoto_2089.jpg','AProof_1995.webp','aisha','10.107449727386008','76.35945081710135');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_address", "user_contact", "place_id", "user_houseno", "user_photo", "user_proof", "user_password", "user_latitude", "user_longitude") VALUES
	('11','Beevi','beevi@gmail.com','Marampilly H','9744221244','2',895,'APhoto_1936.jpg','AProof_1299.jpg','beevi','10.023129089920992','76.31177902199853');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_address", "user_contact", "place_id", "user_houseno", "user_photo", "user_proof", "user_password", "user_latitude", "user_longitude") VALUES
	('12','Akash','akash@gmail.com','Akash H','7306310574','5',873,'APhoto_1118.jpg','AProof_1643.webp','akash','9.578318974514287','76.56051641155501');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_address", "user_contact", "place_id", "user_houseno", "user_photo", "user_proof", "user_password", "user_latitude", "user_longitude") VALUES
	('13','Appu','appu@gmail.com','Appu Nilayam','9078452346','5',934,'APhoto_1363.jpg','AProof_1328.jpg','appu','9.591337744065955','76.67083741544049');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_address", "user_contact", "place_id", "user_houseno", "user_photo", "user_proof", "user_password", "user_latitude", "user_longitude") VALUES
	('14','Ammu','ammu@gmail.com','Ardra Spencer H','7736270562','10',624,'APhoto_2057.jpg','AProof_1552.webp','ammu','9.935218','76.256085');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_address", "user_contact", "place_id", "user_houseno", "user_photo", "user_proof", "user_password", "user_latitude", "user_longitude") VALUES
	('15','Aiswarya','aishu@gmail.com','Aishu Vilasam','8967245780','10',810,'APhoto_1562.jpg','AProof_1076.jpg','aishu','9.932654','76.265864');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_address", "user_contact", "place_id", "user_houseno", "user_photo", "user_proof", "user_password", "user_latitude", "user_longitude") VALUES
	('16','Thaju','thaju@gmail.com','Thazhath H','8765135809','2',853,'APhoto_1158.jpeg','AProof_1021.jpeg','thaju','9.9272','76.2486');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_address", "user_contact", "place_id", "user_houseno", "user_photo", "user_proof", "user_password", "user_latitude", "user_longitude") VALUES
	('17','Anand','anand@gmail.com','Anandalayam','9056893459','3',628,'APhoto_1084.jpg','AProof_1542.webp','anand','9.92899','76.257931');
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_wastecategory'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_wastecategory" (
  "wastecategory_id" int(10) unsigned NOT NULL auto_increment,
  "wastecategory_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("wastecategory_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_wastecategory'
#

LOCK TABLES "tbl_wastecategory" WRITE;
/*!40000 ALTER TABLE "tbl_wastecategory" DISABLE KEYS;*/
REPLACE INTO "tbl_wastecategory" ("wastecategory_id", "wastecategory_name") VALUES
	('2','Recyclable');
REPLACE INTO "tbl_wastecategory" ("wastecategory_id", "wastecategory_name") VALUES
	('3','Non recyclable');
/*!40000 ALTER TABLE "tbl_wastecategory" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_wastematerial'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_wastematerial" (
  "wastematerial_id" int(10) unsigned NOT NULL auto_increment,
  "wastematerial_type" varchar(50) NOT NULL,
  "wastecategory_id" int(10) unsigned NOT NULL,
  "wastematerial_rate" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("wastematerial_id")
) AUTO_INCREMENT=19;



#
# Dumping data for table 'tbl_wastematerial'
#

LOCK TABLES "tbl_wastematerial" WRITE;
/*!40000 ALTER TABLE "tbl_wastematerial" DISABLE KEYS;*/
REPLACE INTO "tbl_wastematerial" ("wastematerial_id", "wastematerial_type", "wastecategory_id", "wastematerial_rate") VALUES
	('3','newspaper','2','16');
REPLACE INTO "tbl_wastematerial" ("wastematerial_id", "wastematerial_type", "wastecategory_id", "wastematerial_rate") VALUES
	('4','book','2','10');
REPLACE INTO "tbl_wastematerial" ("wastematerial_id", "wastematerial_type", "wastecategory_id", "wastematerial_rate") VALUES
	('5','carton','2','6');
REPLACE INTO "tbl_wastematerial" ("wastematerial_id", "wastematerial_type", "wastecategory_id", "wastematerial_rate") VALUES
	('7','iron','2','34');
REPLACE INTO "tbl_wastematerial" ("wastematerial_id", "wastematerial_type", "wastecategory_id", "wastematerial_rate") VALUES
	('8','tin','2','15');
REPLACE INTO "tbl_wastematerial" ("wastematerial_id", "wastematerial_type", "wastecategory_id", "wastematerial_rate") VALUES
	('9','stainless steel','2','30');
REPLACE INTO "tbl_wastematerial" ("wastematerial_id", "wastematerial_type", "wastecategory_id", "wastematerial_rate") VALUES
	('10','aluminium','2','90');
REPLACE INTO "tbl_wastematerial" ("wastematerial_id", "wastematerial_type", "wastecategory_id", "wastematerial_rate") VALUES
	('11','tyre','2','3');
REPLACE INTO "tbl_wastematerial" ("wastematerial_id", "wastematerial_type", "wastecategory_id", "wastematerial_rate") VALUES
	('12','food waste','3','23');
REPLACE INTO "tbl_wastematerial" ("wastematerial_id", "wastematerial_type", "wastecategory_id", "wastematerial_rate") VALUES
	('17','Plastic','3','12');
REPLACE INTO "tbl_wastematerial" ("wastematerial_id", "wastematerial_type", "wastecategory_id", "wastematerial_rate") VALUES
	('18','cloth','2','8');
/*!40000 ALTER TABLE "tbl_wastematerial" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_wasterequest'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_wasterequest" (
  "wastereq_id" int(10) unsigned NOT NULL auto_increment,
  "wastereq_date" varchar(50) NOT NULL,
  "wastereq_pickupdate" varchar(50) NOT NULL,
  "user_id" int(10) unsigned NOT NULL,
  "wastereq_status" int(10) unsigned NOT NULL default '0',
  "employee_id" int(10) unsigned default '0',
  "recived" varchar(50) default NULL,
  "payed" varchar(50) default NULL,
  PRIMARY KEY  ("wastereq_id")
) AUTO_INCREMENT=14;



#
# Dumping data for table 'tbl_wasterequest'
#

LOCK TABLES "tbl_wasterequest" WRITE;
/*!40000 ALTER TABLE "tbl_wasterequest" DISABLE KEYS;*/
REPLACE INTO "tbl_wasterequest" ("wastereq_id", "wastereq_date", "wastereq_pickupdate", "user_id", "wastereq_status", "employee_id", "recived", "payed") VALUES
	('4','2023-05-28','2023-06-05','8','1','10',NULL,NULL);
REPLACE INTO "tbl_wasterequest" ("wastereq_id", "wastereq_date", "wastereq_pickupdate", "user_id", "wastereq_status", "employee_id", "recived", "payed") VALUES
	('5','2023-05-28','2023-06-10','9','1','10',NULL,NULL);
REPLACE INTO "tbl_wasterequest" ("wastereq_id", "wastereq_date", "wastereq_pickupdate", "user_id", "wastereq_status", "employee_id", "recived", "payed") VALUES
	('6','2023-05-28','2023-06-05','10','1','8',NULL,NULL);
REPLACE INTO "tbl_wasterequest" ("wastereq_id", "wastereq_date", "wastereq_pickupdate", "user_id", "wastereq_status", "employee_id", "recived", "payed") VALUES
	('7','2023-05-28','2023-06-10','11','1','8',NULL,NULL);
REPLACE INTO "tbl_wasterequest" ("wastereq_id", "wastereq_date", "wastereq_pickupdate", "user_id", "wastereq_status", "employee_id", "recived", "payed") VALUES
	('8','2023-05-28','2023-06-15','12','1','13',NULL,NULL);
REPLACE INTO "tbl_wasterequest" ("wastereq_id", "wastereq_date", "wastereq_pickupdate", "user_id", "wastereq_status", "employee_id", "recived", "payed") VALUES
	('9','2023-05-28','2023-06-05','13','1','15',NULL,NULL);
REPLACE INTO "tbl_wasterequest" ("wastereq_id", "wastereq_date", "wastereq_pickupdate", "user_id", "wastereq_status", "employee_id", "recived", "payed") VALUES
	('10','2023-05-28','2023-06-10','14','1','16',NULL,NULL);
REPLACE INTO "tbl_wasterequest" ("wastereq_id", "wastereq_date", "wastereq_pickupdate", "user_id", "wastereq_status", "employee_id", "recived", "payed") VALUES
	('11','2023-05-28','2023-06-15','15','1','16',NULL,NULL);
REPLACE INTO "tbl_wasterequest" ("wastereq_id", "wastereq_date", "wastereq_pickupdate", "user_id", "wastereq_status", "employee_id", "recived", "payed") VALUES
	('12','2023-05-28','2023-06-05','16','1','16',NULL,NULL);
REPLACE INTO "tbl_wasterequest" ("wastereq_id", "wastereq_date", "wastereq_pickupdate", "user_id", "wastereq_status", "employee_id", "recived", "payed") VALUES
	('13','2023-05-28','2023-06-05','17','1','16','276','430');
/*!40000 ALTER TABLE "tbl_wasterequest" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_wasterequestbody'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_wasterequestbody" (
  "wrbody_id" int(11) NOT NULL auto_increment,
  "wasterequest_id" int(10) unsigned NOT NULL,
  "wastematerial_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("wrbody_id")
) AUTO_INCREMENT=27;



#
# Dumping data for table 'tbl_wasterequestbody'
#

LOCK TABLES "tbl_wasterequestbody" WRITE;
/*!40000 ALTER TABLE "tbl_wasterequestbody" DISABLE KEYS;*/
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(9,'4','3');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(10,'5','12');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(11,'5','3');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(12,'5','8');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(13,'6','3');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(14,'6','18');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(15,'7','17');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(16,'8','3');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(17,'8','17');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(18,'9','17');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(19,'10','5');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(20,'10','9');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(21,'11','18');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(22,'12','17');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(23,'13','7');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(24,'13','12');
REPLACE INTO "tbl_wasterequestbody" ("wrbody_id", "wasterequest_id", "wastematerial_id") VALUES
	(25,'13','11');
/*!40000 ALTER TABLE "tbl_wasterequestbody" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
