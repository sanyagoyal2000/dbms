CREATE DATABASE  IF NOT EXISTS propertymanagementdatabase; 

USE propertymanagementdatabase;

 SET NAMES utf8 ;


DROP TABLE IF EXISTS `residential_details`;

 SET character_set_client = utf8mb4 ;
CREATE TABLE `residential_details` (
  `Resident_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Resident_First_Name` varchar(45) NOT NULL,
  `Resident_Last_Name` varchar(45) NOT NULL,
  `Resident_Email_Address` varchar(45) DEFAULT NULL,
  `Home_Phone` bigint(20) NOT NULL,
  `Mobile_Phone` bigint(20) NOT NULL,
  PRIMARY KEY (`Resident_Id`)
)ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
LOCK TABLES `residential_details` WRITE;

INSERT INTO `residential_details` VALUES (6,'Ashmita','Nigam','ashmitan@gmail.com',9,90),(7,'Ria','Rajput','rrajput@hotmail.com',9920055780,9867227460),(8,'Jessica','Simpson','jsimpson@hotmail.com',8572631098,8572891100),(9,'Wang','Wei','wangwei@yahoo.com',8761234980,866690056),(10,'Jennifer','Goddard','jenniferg@gmail.com',7074119097,7074119097);

UNLOCK TABLES;

DROP TABLE IF EXISTS `role`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT,
  `Role name` varchar(45) NOT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


LOCK TABLES `role` WRITE;

INSERT INTO `role` VALUES (1,'Management Staff'),(2,'Maintenance Staff');
UNLOCK TABLES;


DROP TABLE IF EXISTS `staffdetails`;

 SET character_set_client = utf8mb4 ;
CREATE TABLE `staffdetails` (
  `Staff id` int(11) NOT NULL AUTO_INCREMENT,
  `Staff_First_Name` varchar(45) NOT NULL,
  `Staff_Last_Name` varchar(45) NOT NULL,
  `Role_RoleId` int(11) NOT NULL,
  PRIMARY KEY (`Staff id`),
  KEY `fk_Staff Table_Role_idx` (`Role_RoleId`),
  CONSTRAINT `RoleId` FOREIGN KEY (`Role_RoleId`) REFERENCES `role` (`roleid`)
)ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

LOCK TABLES `staffdetails` WRITE;

INSERT INTO `staffdetails` VALUES (7,'Yana','Simpson',2);

UNLOCK TABLES;

DROP TABLE IF EXISTS appointment_schedules;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `appointment_schedules` (
  `AppointmentId` int(11) NOT NULL AUTO_INCREMENT,
  `Scheduled_Date` datetime NOT NULL,
  `StaffId` int(11) NOT NULL,
  `Resident_Id` int(11) NOT NULL,
  `MeetingNotes` varchar(45) DEFAULT NULL,
  `IS_MR_Logged` char(3) DEFAULT NULL,
  `MR_notes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AppointmentId`),
  KEY `Staff Id_idx` (`StaffId`),
  KEY `Resident Id_idx` (`Resident_Id`),
  CONSTRAINT `Resident Id` FOREIGN KEY (`Resident_Id`) REFERENCES `residential_details` (`resident_id`),
  CONSTRAINT `Staff Id` FOREIGN KEY (`StaffId`) REFERENCES `staffdetails` (`staff id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


LOCK TABLES `appointment_schedules` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `buildingdetails`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `buildingdetails` (
  `Building number` int(11) NOT NULL,
  `Parking Facility` varchar(45) DEFAULT NULL,
  `Gym facility` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Building number`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



LOCK TABLES `buildingdetails` WRITE;

INSERT INTO `buildingdetails` VALUES (1,'Parking available','Gym available'),(2,'Parking available','Gym not available'),(3,'Parking available','Gym not available'),(4,'Parking available','Gym not available'),(5,'Parking available','Gym not available'),(6,'Parking available','Gym available'),(7,'Street parking','Gym not available'),(8,'Street Parking','Gym not available'),(9,'Parking available','Gym not available'),(10,'Parking available','Gym available');

UNLOCK TABLES;



DROP TABLE IF EXISTS `inspection_check`;

 SET character_set_client = utf8mb4 ;
CREATE TABLE `inspection_check` (
  `InspectionId` int(11) NOT NULL AUTO_INCREMENT,
  `Date_logged` datetime NOT NULL,
  `Inspected_By` int(11) NOT NULL,
  `NoOfUnits` int(11) DEFAULT NULL,
  `Unit_Id_number` int(11) NOT NULL,
  `No_of_devices_damaged` int(11) DEFAULT NULL,
  PRIMARY KEY (`InspectionId`),
  UNIQUE KEY `Unit Id number_UNIQUE` (`Unit_Id_number`),
  KEY `Staff Id_idx` (`Inspected_By`),
  CONSTRAINT `Inspected_By` FOREIGN KEY (`Inspected_By`) REFERENCES `staffdetails` (`staff id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `inspection_check` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `leasedetails`;

 SET character_set_client = utf8mb4 ;
CREATE TABLE `leasedetails` (
  `LeaseId` int(11) NOT NULL AUTO_INCREMENT,
  `Resident_Building_Number` int(11) NOT NULL,
  `Resident_Unit_Number` int(11) NOT NULL,
  `Upcoming_Resident` int(11) NOT NULL,
  `Lease_Date` datetime NOT NULL,
  `LeaseStartDate` datetime NOT NULL,
  `LeaseEndDate` datetime NOT NULL,
  `LeaseTerm` int(11) NOT NULL,
  `MonthlyRent` int(11) NOT NULL,
  `SecurityDepositAmount` int(11) NOT NULL,
  `Pet_Deposit` int(11) DEFAULT NULL,
  `Lease_Status` varchar(10) NOT NULL,
  PRIMARY KEY (`LeaseId`),
  KEY `Resident Id_idx` (`Upcoming_Resident`),
  KEY `Building number_idx` (`Resident_Building_Number`),
  KEY `Unit number_idx` (`Resident_Unit_Number`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



LOCK TABLES `leasedetails` WRITE;

INSERT INTO `leasedetails` VALUES (7,1,1,1,'2018-09-01 00:00:00','2018-09-01 00:00:00','2019-08-31 00:00:00',12,2250,2250,0,'Active'),(8,1,1,2,'2018-09-01 00:00:00','2018-09-01 00:00:00','2019-08-31 00:00:00',12,2250,2250,0,'Active'),(9,1,2,3,'2018-09-01 00:00:00','2018-09-01 00:00:00','2019-08-31 00:00:00',12,2250,2250,0,'Active'),(10,1,2,4,'2018-09-01 00:00:00','2018-09-01 00:00:00','2019-08-31 00:00:00',12,2250,2250,0,'Active'),(11,1,3,2,'2018-09-01 00:00:00','2018-09-01 00:00:00','2019-08-31 00:00:00',12,2500,2500,100,'Active'),(12,2,3,5,'2018-12-11 00:00:00','2019-01-01 00:00:00','2020-12-31 00:00:00',12,2700,2700,150,'Active'),(13,2,3,6,'2018-12-11 00:00:00','2017-01-01 00:00:00','2018-06-30 00:00:00',6,2700,2700,150,'Expired');

UNLOCK TABLES;



DROP TABLE IF EXISTS `leasepayment`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `leasepayment` (
  `LeasePaymentId` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentType` varchar(45) NOT NULL,
  `PaymentDate` datetime NOT NULL,
  `PaymentAmount` int(11) NOT NULL,
  `LeaseId` int(11) NOT NULL,
  `Late_Fees` int(11) DEFAULT NULL,
  `Paid_By` int(11) DEFAULT NULL,
  PRIMARY KEY (`LeasePaymentId`),
  KEY `LeaseId_idx` (`LeaseId`),
  KEY `Paid By_idx` (`Paid_By`),
  CONSTRAINT `Lease Id` FOREIGN KEY (`LeaseId`) REFERENCES `leasedetails` (`leaseid`),
  CONSTRAINT `Paid By` FOREIGN KEY (`Paid_By`) REFERENCES `residential_details` (`resident_id`)
)ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

LOCK TABLES `leasepayment` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `maintenance_requests`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `maintenance_requests` (
  `RequestId` int(11) NOT NULL AUTO_INCREMENT,
  `Logged By` int(11) NOT NULL,
  `Reported_to_staff id` int(11) NOT NULL,
  `MR_notes` varchar(45) DEFAULT NULL,
  `Priority` varchar(45) NOT NULL,
  `Date_Logged` datetime DEFAULT NULL,
  `Status` varchar(45) NOT NULL,
  `Due_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`RequestId`),
  KEY `Reported to Staff id_idx` (`Reported_to_staff id`),
  KEY `Logged By Resident Id_idx` (`Logged By`),
  CONSTRAINT `Logged By Resident Id` FOREIGN KEY (`Logged By`) REFERENCES `residential_details` (`resident_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `maintenance_requests` WRITE;

UNLOCK TABLES;







DROP TABLE IF EXISTS `securitydepositreturns`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `securitydepositreturns` (
  `PaymentId` int(11) NOT NULL AUTO_INCREMENT,
  `Return_Date` datetime NOT NULL,
  `SecurityDepositAmount` int(11) NOT NULL,
  `Amount_returned_after_lease` int(11) DEFAULT NULL,
  `Leaving_Res_BldgNo` int(11) NOT NULL,
  `Unit_No` int(11) NOT NULL,
  `Leaving_Resident` int(11) NOT NULL,
  PRIMARY KEY (`PaymentId`),
  KEY `Building number_idx` (`Leaving_Res_BldgNo`),
  KEY `Unit number_idx` (`Unit_No`),
  KEY `Leaving Resident_idx` (`Leaving_Resident`),
  CONSTRAINT `Leaving Resident` FOREIGN KEY (`Leaving_Resident`) REFERENCES `leasedetails` (`upcoming_resident`),
  CONSTRAINT `Resident Bldg No` FOREIGN KEY (`Leaving_Res_BldgNo`) REFERENCES `leasedetails` (`resident_building_number`),
  CONSTRAINT `Resident Unit No` FOREIGN KEY (`Unit_No`) REFERENCES `leasedetails` (`resident_unit_number`)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `securitydepositreturns` WRITE;
INSERT INTO `securitydepositreturns` VALUES (3,'2018-08-31 00:00:00',2500,2450,2,3,6),(4,'2018-01-02 10:00:00',2000,1500,1,1,1);

UNLOCK TABLES;





DROP TABLE IF EXISTS `unitdetails`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `unitdetails` (
  `Unit_number` int(11) NOT NULL,
  `Building_No` int(11) NOT NULL,
  `Unit_Type` varchar(45) NOT NULL,
  `In_Unit_Laundry` char(3) DEFAULT NULL,
  `Pets_Allowed` char(3) DEFAULT NULL,
  `No_of_bedrooms` varchar(45) NOT NULL,
  `No_of_bathrooms` varchar(45) NOT NULL,
  `Current_Resident` int(11) DEFAULT NULL,
  PRIMARY KEY (`Unit_number`),
  KEY `Resident Id_idx` (`Current_Resident`),
  KEY `Building number_idx` (`Building_No`),
  CONSTRAINT `Building No` FOREIGN KEY (`Building_No`) REFERENCES `buildingdetails` (`building number`),
  CONSTRAINT `Current Resident` FOREIGN KEY (`Current_Resident`) REFERENCES `residential_details` (`resident_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `unitdetails` WRITE;

UNLOCK TABLES;
DELIMITER ;;
DELIMITER ;
DELIMITER ;;
DELIMITER ;


DROP TABLE IF EXISTS `viewleasedetails`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;

SET character_set_client = @saved_cs_client;


DROP TABLE IF EXISTS `viewresdetails`;

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;

SET character_set_client = @saved_cs_client;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_AddDatatoSecurityDeposit`
(IN Return_Date datetime,
 IN SecurityDepositAmount INT,
 IN Amount_returned_after_lease INT,
 IN Leaving_Res_BldgNo INT,
 IN Unit_No INT,
 IN Leaving_Resident INT)
BEGIN
INSERT INTO SecurityDepositReturns(
 Return_Date,
 SecurityDepositAmount,
 Amount_returned_after_lease,
 Leaving_Res_BldgNo,
 Unit_No,
 Leaving_Resident
 )
 VALUES
 ( Return_Date,
 SecurityDepositAmount,
 Amount_returned_after_lease,
 Leaving_Res_BldgNo,
 Unit_No,
 Leaving_Resident)
END 
DELIMITER ;



