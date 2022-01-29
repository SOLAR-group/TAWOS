CREATE DATABASE `TAWOS` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `Repository` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Description` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `URL` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `P_Key` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Project` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Project_Key` varchar(128) DEFAULT NULL,
  `Name` varchar(512) DEFAULT NULL,
  `URL` varchar(512) DEFAULT NULL,
  `Description` varchar(2048) DEFAULT NULL,
  `Start_Date` datetime DEFAULT NULL,
  `Last_Update_Date` datetime DEFAULT NULL,
  `Repository_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `P_Key` (`ID`),
  KEY `F_Key` (`Repository_ID`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`Repository_ID`) REFERENCES `Repository` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `User` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Project_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `P_Key` (`ID`),
  KEY `F_Key` (`Project_ID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `Project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Version` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Jira_ID` int DEFAULT NULL,
  `Name` varchar(512) DEFAULT NULL,
  `Description` varchar(2048) DEFAULT NULL,
  `Archived` tinyint DEFAULT NULL,
  `Released` tinyint DEFAULT NULL,
  `Release_Date` datetime DEFAULT NULL,
  `Project_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `P_Key` (`ID`),
  KEY `F_Key` (`Project_ID`),
  CONSTRAINT `version_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `Project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Component` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Jira_ID` int DEFAULT NULL,
  `Name` varchar(512) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  `Project_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `P_Key` (`ID`),
  KEY `F_Key` (`Project_ID`),
  CONSTRAINT `component_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `Project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Sprint` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `JiraID` int DEFAULT NULL,
  `Name` varchar(512) DEFAULT NULL,
  `State` varchar(512) DEFAULT NULL,
  `Start_Date` datetime DEFAULT NULL,
  `End_Date` datetime DEFAULT NULL,
  `Activated_Date` datetime DEFAULT NULL,
  `Complete_Date` datetime DEFAULT NULL,
  `Project_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `P_Key` (`ID`),
  KEY `F_Key` (`Project_ID`),
  CONSTRAINT `sprint_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `Project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Issue` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Jira_ID` int DEFAULT NULL,
  `Issue_Key` varchar(512) DEFAULT NULL,
  `URL` varchar(512) DEFAULT NULL,
  `Title` varchar(512) DEFAULT NULL,
  `Description` mediumtext,
  `Description_Text` mediumtext,
  `Description_Code` mediumtext,
  `Type` varchar(128) DEFAULT NULL,
  `Priority` varchar(128) DEFAULT NULL,
  `Status` varchar(128) DEFAULT NULL,
  `Resolution` varchar(128) DEFAULT NULL,
  `Creation_Date` datetime DEFAULT NULL,
  `Estimation_Date` datetime DEFAULT NULL,
  `Resolution_Date` datetime DEFAULT NULL,
  `Last_Updated` datetime DEFAULT NULL,
  `Story_Point` double DEFAULT NULL,
  `Timespent` double DEFAULT NULL,
  `In_Progress_Minutes` double DEFAULT NULL,
  `Total_Effort_Minutes` double DEFAULT NULL,
  `Resolution_Time_Minutes` double DEFAULT NULL,
  `Title_Changed_After_Estimation` tinyint DEFAULT NULL,
  `Description_Changed_After_Estimation` tinyint DEFAULT NULL,
  `Story_Point_Changed_After_Estimation` tinyint DEFAULT NULL,
  `Pull_Request_URL` varchar(512) DEFAULT NULL,
  `Creator_ID` int DEFAULT NULL,
  `Reporter_ID` int DEFAULT NULL,
  `Assignee_ID` int DEFAULT NULL,
  `Project_ID` int DEFAULT NULL,
  `Sprint_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Project_ID` (`Project_ID`),
  KEY `Assignee_ID` (`Assignee_ID`),
  KEY `Reporter_ID` (`Reporter_ID`),
  KEY `Sprint_ID` (`Sprint_ID`),
  KEY `P_Key` (`ID`),
  KEY `F_Key` (`Creator_ID`,`Reporter_ID`,`Assignee_ID`,`Project_ID`,`Sprint_ID`),
  CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `Project` (`ID`),
  CONSTRAINT `issue_ibfk_2` FOREIGN KEY (`Assignee_ID`) REFERENCES `User` (`ID`),
  CONSTRAINT `issue_ibfk_3` FOREIGN KEY (`Reporter_ID`) REFERENCES `User` (`ID`),
  CONSTRAINT `issue_ibfk_4` FOREIGN KEY (`Sprint_ID`) REFERENCES `Sprint` (`ID`),
  CONSTRAINT `issue_ibfk_5` FOREIGN KEY (`Creator_ID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Comment` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Comment` mediumtext,
  `Comment_Text` mediumtext,
  `Comment_Code` mediumtext,
  `Creation_Date` datetime DEFAULT NULL,
  `Author_ID` int DEFAULT NULL,
  `Issue_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Issue_ID` (`Issue_ID`),
  KEY `P_Key` (`ID`),
  KEY `F_Key` (`Author_ID`,`Issue_ID`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`Issue_ID`) REFERENCES `Issue` (`ID`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`Author_ID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Change_Log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Field` varchar(512) DEFAULT NULL,
  `From_Value` mediumtext,
  `To_Value` mediumtext,
  `From_String` mediumtext,
  `To_String` mediumtext,
  `Change_Type` varchar(512) DEFAULT NULL,
  `Creation_Date` datetime DEFAULT NULL,
  `Author_ID` int DEFAULT NULL,
  `Issue_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Issue_ID` (`Issue_ID`),
  KEY `P_Key` (`ID`),
  KEY `F_Key` (`Author_ID`,`Issue_ID`),
  CONSTRAINT `change_log_ibfk_1` FOREIGN KEY (`Issue_ID`) REFERENCES `Issue` (`ID`),
  CONSTRAINT `change_log_ibfk_2` FOREIGN KEY (`Author_ID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Affected_Version` (
  `Issue_ID` int DEFAULT NULL,
  `Affected_Version_ID` int DEFAULT NULL,
  KEY `Affected_Version_ID` (`Affected_Version_ID`),
  KEY `F_Key` (`Issue_ID`,`Affected_Version_ID`),
  CONSTRAINT `affected_version_ibfk_1` FOREIGN KEY (`Issue_ID`) REFERENCES `Issue` (`ID`),
  CONSTRAINT `affected_version_ibfk_2` FOREIGN KEY (`Affected_Version_ID`) REFERENCES `Version` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Fix_Version` (
  `Issue_ID` int DEFAULT NULL,
  `Fix_Version_ID` int DEFAULT NULL,
  KEY `F_Key` (`Issue_ID`,`Fix_Version_ID`),
  KEY `fix_version_ibfk_2` (`Fix_Version_ID`),
  CONSTRAINT `fix_version_ibfk_1` FOREIGN KEY (`Issue_ID`) REFERENCES `Issue` (`ID`),
  CONSTRAINT `fix_version_ibfk_2` FOREIGN KEY (`Fix_Version_ID`) REFERENCES `Version` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Issue_Component` (
  `Issue_ID` int DEFAULT NULL,
  `Component_ID` int DEFAULT NULL,
  KEY `Component_ID` (`Component_ID`),
  KEY `F_Key` (`Issue_ID`,`Component_ID`),
  CONSTRAINT `issue_component_ibfk_1` FOREIGN KEY (`Component_ID`) REFERENCES `Component` (`ID`),
  CONSTRAINT `issue_component_ibfk_2` FOREIGN KEY (`Issue_ID`) REFERENCES `Issue` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Issue_Link` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Issue_ID` int DEFAULT NULL,
  `Name` varchar(512) DEFAULT NULL,
  `Description` varchar(2048) DEFAULT NULL,
  `Direction` varchar(45) DEFAULT NULL,
  `Target_Issue_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Target_Issue_ID` (`Target_Issue_ID`),
  KEY `P_Key` (`ID`),
  KEY `issue_link_ibfk_3` (`Issue_ID`),
  CONSTRAINT `issue_link_ibfk_2` FOREIGN KEY (`Target_Issue_ID`) REFERENCES `Issue` (`ID`),
  CONSTRAINT `issue_link_ibfk_3` FOREIGN KEY (`Issue_ID`) REFERENCES `Issue` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




