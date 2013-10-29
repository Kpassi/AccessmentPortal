-- MySQL dump 10.13  Distrib 5.5.20, for Win64 (x86)
--
-- Host: localhost    Database: collegemgmt
-- ------------------------------------------------------
-- Server version	5.5.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignmentfolder`
--

DROP TABLE IF EXISTS `assignmentfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignmentfolder` (
  `userid` varchar(45) NOT NULL,
  `assignmentid` varchar(45) NOT NULL,
  `file` longblob NOT NULL,
  `marks` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`userid`,`assignmentid`) USING BTREE,
  KEY `fk21_idx` (`assignmentid`),
  CONSTRAINT `fk20` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk21` FOREIGN KEY (`assignmentid`) REFERENCES `assignmentnotice` (`assignmentid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentfolder`
--

LOCK TABLES `assignmentfolder` WRITE;
/*!40000 ALTER TABLE `assignmentfolder` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignmentfolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentnotice`
--

DROP TABLE IF EXISTS `assignmentnotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignmentnotice` (
  `assignmentid` varchar(45) NOT NULL,
  `assignmentname` varchar(45) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `file` longblob NOT NULL,
  `maximarks` int(11) NOT NULL,
  `dateofallotment` date NOT NULL,
  `dateofsubmission` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `userid` varchar(45) NOT NULL,
  PRIMARY KEY (`assignmentid`),
  KEY `fk18_idx` (`subjectid`),
  KEY `fk19_idx` (`classid`),
  CONSTRAINT `fk18` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk19` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentnotice`
--

LOCK TABLES `assignmentnotice` WRITE;
/*!40000 ALTER TABLE `assignmentnotice` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignmentnotice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `lectid` varchar(45) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `lectsdelivered` int(11) DEFAULT NULL,
  PRIMARY KEY (`lectid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `branchid` varchar(45) NOT NULL,
  `branchname` varchar(45) NOT NULL,
  PRIMARY KEY (`branchid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES ('cse-1','cse'),('mech-1','mech');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `classid` varchar(45) NOT NULL,
  `classname` varchar(45) NOT NULL,
  `branchid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`classid`),
  KEY `fk7_idx` (`branchid`),
  CONSTRAINT `fk7` FOREIGN KEY (`branchid`) REFERENCES `branches` (`branchid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES ('class1','3rd','cse-1',1),('class2','5th','cse-1',1),('class3','7th-a','cse-1',1),('class4','7th-b','cse-1',1),('class5','3rd','mech-1',1);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursematerial`
--

DROP TABLE IF EXISTS `coursematerial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursematerial` (
  `materialid` varchar(45) NOT NULL,
  `materialname` varchar(45) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `dateupload` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `userid` varchar(45) NOT NULL,
  PRIMARY KEY (`materialid`),
  KEY `fk13_idx` (`subjectid`),
  KEY `fk14_idx` (`classid`),
  CONSTRAINT `fk13` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk14` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursematerial`
--

LOCK TABLES `coursematerial` WRITE;
/*!40000 ALTER TABLE `coursematerial` DISABLE KEYS */;
INSERT INTO `coursematerial` VALUES ('34','bn','cs-105','class2','Tue Oct 29 12:32:06 IST 2013','imag005.jpg',1,'aman'),('36','bn','cs-101','class1','Tue Oct 29 12:48:49 IST 2013','Arcadian Technocrats Presentation updated.ppt',1,'aman'),('aa','dd','cs-101','class1','Tue Oct 29 12:11:35 IST 2013','data model.PNG',1,'aman'),('m123','manik','cs-101','class1','Tue Oct 29 12:04:30 IST 2013','collegemgmt.sql',1,'aman'),('manik','manik','cs-101','class1','Tue Oct 29 11:48:18 IST 2013','pom.xml',1,'aman');
/*!40000 ALTER TABLE `coursematerial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradedomains`
--

DROP TABLE IF EXISTS `gradedomains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradedomains` (
  `domainid` varchar(45) NOT NULL,
  `domainame` varchar(45) NOT NULL,
  `maximarks` varchar(45) NOT NULL,
  PRIMARY KEY (`domainid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradedomains`
--

LOCK TABLES `gradedomains` WRITE;
/*!40000 ALTER TABLE `gradedomains` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradedomains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouppermissions`
--

DROP TABLE IF EXISTS `grouppermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouppermissions` (
  `groupid` varchar(45) NOT NULL,
  `permissionid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`groupid`,`permissionid`),
  KEY `fk4_idx` (`permissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouppermissions`
--

LOCK TABLES `grouppermissions` WRITE;
/*!40000 ALTER TABLE `grouppermissions` DISABLE KEYS */;
INSERT INTO `grouppermissions` VALUES ('1001','1',1),('1001','2',1),('1001','3',1),('1002','101',1),('1002','102',1),('1002','103',1),('1002','104',1),('1002','105',1),('1002','106',1),('1002','12',1),('1002','13',1),('1002','16',1),('1002','21',1),('1002','23',1),('1002','24',1),('1002','28',1),('1002','4',1),('1002','5',1),('1002','7',1),('1002','8',1),('1003','10',1),('1003','101',1),('1003','102',1),('1003','106',1),('1003','11',1),('1003','12',1),('1003','13',1),('1003','15',1),('1003','16',1),('1003','18',1),('1003','19',1),('1003','20',1),('1003','21',1),('1003','24',1),('1003','25',1),('1003','26',1),('1003','31',1),('1003','6',1),('1003','7',1),('1003','8',1),('1003','9',1),('1004','12',1),('1004','14',1),('1004','17',1),('1004','22',1),('1004','27',1),('1004','29',1),('1004','30',1),('1004','7',1);
/*!40000 ALTER TABLE `grouppermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `groupid` varchar(45) NOT NULL,
  `groupname` varchar(45) NOT NULL,
  `groupdesc` varchar(150) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES ('1001','admin','adds hod and teachers in user table',1),('1002','hod','adds student in user table and user groups automatically gets updated',1),('1003','lecturer','performs certain upload functions',1),('1004','student','end user of the product',1),('2001','cse','department of cse',1),('2002','mech','department of mech',1);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectures`
--

DROP TABLE IF EXISTS `lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lectures` (
  `lectureid` varchar(45) NOT NULL,
  `lecturename` varchar(45) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `file` longblob NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `userid` varchar(45) NOT NULL,
  PRIMARY KEY (`lectureid`),
  KEY `fk15_idx` (`subjectid`),
  KEY `fk16_idx` (`classid`),
  CONSTRAINT `fk15` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk16` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectures`
--

LOCK TABLES `lectures` WRITE;
/*!40000 ALTER TABLE `lectures` DISABLE KEYS */;
/*!40000 ALTER TABLE `lectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailing`
--

DROP TABLE IF EXISTS `mailing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailing` (
  `messageid` varchar(45) NOT NULL,
  `receiver` varchar(45) NOT NULL,
  `message` varchar(500) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `sender` varchar(45) NOT NULL,
  PRIMARY KEY (`messageid`),
  KEY `fk27_idx` (`receiver`),
  KEY `fk28_idx` (`sender`),
  CONSTRAINT `fk27` FOREIGN KEY (`receiver`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk28` FOREIGN KEY (`sender`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailing`
--

LOCK TABLES `mailing` WRITE;
/*!40000 ALTER TABLE `mailing` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `permissionid` varchar(45) NOT NULL,
  `permissionname` varchar(45) NOT NULL,
  `permissiondesc` varchar(150) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `pic` blob,
  `servletname` varchar(45) NOT NULL,
  PRIMARY KEY (`permissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES ('1','add user','create new user',1,'','AddUser'),('101','course content','course content',1,'����\0JFIF\0\0`\0`\0\0��\0C\0		\n\n\r\n\n	\r��\0C��\0\0P\0P\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0����(\0��PN>���l������v��O�z�<;nn�ۆ;aN�B�Y�v*�\Z��;�(,��MF*�RI6ݒ0?k���������x��k}2	�����A-�w!\"+Kh�dφ8$*�<��\Z;���˿�V߃?�v���k��\rĂ84�ۭ��,z�Vx$c�Ȓ�����?l��#��\0�P_�x�W��H���$��+���f�̲�%M��U�e\'`��*n��\0b���悚��hS���Ec��A:L\r�<v���=T|�>��W���j��M���&��&����ն]�Ƴo��1�9|#:Qѷ{�Mm��?[�m�\0��<���^����Ge�\\%��\0�	��+d�����,:ŀ��Y�I#��c��1�W�b�jԝ�ԗ��\0q��g�1PN�po��z=�����ĝŤ-��m,��Y1�/���5���q�^T�(�IY�IN�&��QE5�Vd��I�G��\'����CUյ+K��e�����`���5/$���*F�31\0\0I8����)�����\nA�����yg���׍\'��F������cl,-�p��Y$)U�\0��\0����d������]O�?	|9y�k���~�ƺ�N��a���_�ĩ��(�����?�p�ɮG�Z��/��u?�9�O��;��F�ш��y�����X\Z?�Y��+�?�����/�lL�\0���y?���|��۹�?�M�\0ؤ�ga�Ķ{�m�Э&A��o\\�/�Q�\0,ھ�����	POҭ�v+Jv�t\0ZmH�k������.˱��gB�Wգ�N��\0�u6�H%�ojw��\\ֽ�Emk4�Amon�,�M\"�(�,�̀�\0$�@\0x�<<\'us�*`cJ��7�>$Z|?�nu]ZY���O�(̳�#��(a�s$�H�h���(����@��Z|��\0�w26����z�j��!#�IG2�D�$���+�2��5~�?����{?�:��>\Z�K?��ّ��B�P겣r�M27Co#��$�\Z}{����w�����?o���)�	�H��#���lj���WQ��\0]��ᬮXh{z��[/-����:�b�8\'�_���pO�@�]����=jD�\r��?X˃��Ý\Z�@��E?�q��3�ew�~��\0���\0�F�g�5x/�g�-#S��6��I:��k\n<~�Y��7�ʒ\\<�$v�s���a�\'����7��,������T�g��� �ot���-��R����ه�,=~�ib�\n�)�U��z��ݿ]�y�\\&Ƃ|��%�~}�\0��Z���\0ei~:���7��-��[��p�|����u=N�Q[��.�c�\n�O��`����`���v�(�U��ry���x\'K�Q�K\rG���}�mPH/+g�F\0n��K6`\0\0��u�\Z�-��_�q$�(������%�N\r�_ݞ�av#�p@��up��T�-�@L\0���={pbW��NS���8�G[��=h3��r�\0�I�Y��k	���_^��iq��&���\0�\0���|��̂vEq��Y�?�!/��5ys���.<G�[6�4\'���n��\0�y��f���:�~�/���;xO��\Z������$�Q���r{V�9P_U��o{t���O��0���_HG��ߢ��2�/�DӾ\n�\r�k�.�d��NӭS̺��`��ğ�$�2��r�dV���6�\0�z��<[,�\0|\\\"�V�)��tI���[�`��l6G�L(e�9������|wk�s���������m\Z�\n��k\"mJd?v��6!\r�[�A���}\0��5����A���\0�W����%o\rbj,]M\"�����[v^m�~��m����+�Z��ok$_��C�=g���n��Q�p�\r����O��gi|t���~����_�ڽ�/�j��5��������+,g=��=3_@���\0����\0l�\0��.���{\\����7�=\"A���B0�.`b9Vtto���2���x�����C���O����>6�}d�q\Zq%擟23����C\Z�^|�ڒu�%FV�k7k�g饷�u$��*�nw�W�t�n��<��߱GƯ��W���������}�T�=3��:�|��P�Ǝ��z��/���0�8��Q���n\rx���ڸ��&%n~����_U|�����\0�)��&�h�׷�@g�:�� 9`�d����>4��o�QxM�o�[I�m�m�obVx�$�le]{7��y�j��p�P�Żw����9��,-:�&��m��9o�61��@��_��U��t�xn��P�w�$x��i� T�^\\m�h�|]�(���Mg���6���qq��ş��uX0�ǌ�K��<Gk�\0���[�q�\0W���?\0&�M�����mmy�\"6�<D����lH\r�B� d�iHS&��bx�;���oK5��]��x�wc^-S�i����>�_������p��3�_]�#^�z��_�jגs5��@������\"�\"���h��g|E��X�τ��d���ߋ5H[��\0~����G�D$��1��^��\0>\"\'�?	��i�<Ku�mf��b�Q��b�JrI$`�G\'���6����zg��4�G�K[;XA�j0�I�$�NI$�k��IP^�o���wI��WӲױ���IP���4}����\0z�oN�\\�E��R:�R2Fih��i��%��g_��si��ٗ�����\r3Up�SÁ�i��G�+ּ;^�a�E~ȐI��kǿ�����Z��v��d�k���#s,��D+���l�h# \Z�(�u�eRӇit�{���ty���S����\'�=}W��j����\0������d���rk�6�r�.~h���|ȧrs��/�o�mF�B�燼1ko�x�ű%��d��[g�q+��0����Tb������G�¿\r�j)��Ğ[��o�.f��-��~������$��7#t��\0���kg�5\\j:����w�,��5+xa���M�-�b1���uU2�ǐ�1Ǫx�����5t�����5w���������viu�]��i���g�~�?lg����Au&����o��VX�sj���v\\���Q<�Q�8A]�W�V��MԨ�ޭ��\Z0�N��Z$QEfj��','CourseContent'),('102','lectures','lectures',1,'����\0JFIF\0\0d\0d\0\0��\0C\0		\n\n\r\n\n	\r��\0C��\0\0P\0P\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0���U�6weD@Y��\0s\\4ߵ�;yZ9>\"x9ᕵ�@T��2�l�\0���F�����i�����U�-�n5�����<�c��`�����ܞ7�̖�/�����I#������C�૞�+é��V���e�T��������K��w��������=�7*Qn�6N�\0z��m���\0\rO����7���\0����\0��\Z������-?��~�ۗ���i���^�M8~�?GM?������U_\'�4�3��\0[�S����\0�?�?o?h_ڷ�6�\0	��>\"xM�C=�F,u�f�c]D�m���/�9\'#�C�g��<;�\0	��>\"h+hm�h�u������I3�c J�r�\0�����\0>�\0�7���K�\0\r���������\0����E<d1^�%n^}����Ge>8�8��C�\r�����o//����\0���a�\0E�y�\0����\0��\Z�����c��O�9_������z��?����\0�����\0��|(���\0%W����\r���\0[xS����\0�?�?|����d�|E�!,p\0��2�%v�n�m�i�]��Aukr�Xf�đʄd2���9W�?n;\r�_�����ݓ�\0�5�S�\0��ék.����m�x���Z�NiL�iy��ޜ��J������\0�c�=zt�\n**��jW����_��3:ue��s�4�N-h����\0�����8����\0B��Ǩt=���\0��_�)尸�i\'�|6�\0��~D�Pz�f���h*��c�G�\0I��g�;0��8;]b?H����\0`Q�����߲��Z���959J���N��O	����y�&rQ�m�����\0`Q������/E\Z�Y��P?<ҿ���\\�,��~��}�#�X����.�p؟�\n?�?���:�\\�%B3ʰ$�U��m$Z�<ʙ�\"q�i�h�#����\0���/�<	�p<$W�\0!A_�B�r>S_�_�I�A���>#��TU��PP���\0���?�>�9��Us57{R����_��g��E�����9��3ҿ\Z��\n0���~��\0�I�e⋅O���\0\Z�kMS|hC���:��c�s�\0����+��lMʶ���DڎV�E�Tnr|��tw���sKD�a�\'���\0�J�H\rj�s��u����oj\n�v%��;����+�Z؈�q���l˲ʴp�+A{�$�^����5U��2# z����E��gq\"���\"��u�<mn�p�\0��󨑥�֯h�u�.�)�܀F2}x5u{��Sʣ\n����-�+�����/��V�N�;�����σ�����L89nkB{�o�r�qo������*5���\0���LS���r�MiAJj�q�u�eߴ���گՏ�&%�O��/UH�/�$(ݏ�/ʿ$RÂ\\=��S�	A���O�	�v�T7�@��k��\0+)������A�\Z�S�[4r[҇��Ϋ�\n����*%B�V�\'�٘�Y]���<Y�M�^�V���s�jv�|��5���Â�� ��������h_\r�0NV�n��\\�K�<�؂3�AV�8*E|�\'���)�[|@���K`� �uR}�+�iT̲�e|F��\Z��N\\�8����qe\\C��R�*:r��k+���ߧ�߂�\n�E��Z�l���m-��uD�����7;E�w�2� ��9��>\"ǧ2�7&����Wj�[�Xbc>?ލr�����:]��t�i�3��u9u%�൹���Y�y]N�Hlp�X>P��eO|H��-5�B����x~x`7����WVr�c9!9�*��c����F�\Z�.G�I����ԣ����e��ˤ�N���Y�,�\Z���~G���x�J�m��\'��?�M�>=:s��Ս2�V��F��Z�B�\r������_Z�0���c�˿����KQӴin�Vwz���[���)y1�����\"�2���x��M]B�Ð�M!���ȸ��m�/��\'9������ƙ�+G\r�u�$���k���&���<��w�n}���7�??G�.M�ު�W�\"f���ۜ�\'��C\\ԗ\Z��3���;�����\'�J�m���|I�\'�_�t���5[o�5�Ž����4)�#���M�s�\ry��V����o^�~��Ӧ�`k8��k�RHb*�#��Y���H��|k�ӭ=L:S�˛�˯�\n~\rd�i:��c{���}>G�6�dP�}�� [g,O�\0rk���	g}a�?闖����&�	ܪZ�+�ER:��C^��\0��F_�:����i�	����p��?e�~�Z=�\Z����6��R��d����J����l**��H,I5����X�3��T�M�i.fݭm[�x_(��W���J�Tu�*I;���\0��j+&�\0���gn����s����b�Đ��%Ǥ`W�v�\0�d�~��ďxQ\nI��ɩμ2���@}>��Њ��	��|6��|?q$^]��_���,�}mc��s�\'~�_�_�O�|Q��	jV�:��\0��On|�T	Rl�7�F�W�<d���~5��4[=3O�^�ma�@��� E(TQ�@�¾O)�֩��1��ⶍ�W[]_�/��ƽ(`h�I>���{����a�L�3~�^-Aծ4��9�W��mM���\"I-c����w^��Kx�P��~�]U��S��Av֦�E��E>\n���m����0xO��\0����+k^\"���S��\0� ��\"i�i�yM+d�#�ϙ�w�\Zc2�L�8���q������/~�eԌ>2�r��yK�r�V{{�mn�����9g�\rj:F����m�����$�E(���\"�%�e���\0f���BmLķ�פ��9�v{+�$uE��\"��3�J��]�c�)c��?�_~��\0���~)���I��j��^#X�e�̆�P�U�NX��H̧���%iƖ\'\r)Ӗ�]����VC��T�^IFk����?��%�����/M�m5�	뉭��Q*����-|�$�v8�u�g��R��i\Z�oԪ���8�Z��K�*V��Q�h��','Lectures'),('103','attendance','attendance',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0P\0\0\0P\0\0\0��\0\0\0sRGB\0���\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0�\0\0��+\0\0\0bKGD\0\0\0\0\0\0�C�\0\0\0	vpAg\0\0�\0\0�\0�@@�\0\0\0%tEXtcreate-date\02009-09-28T11:27:59-04:00+\\��\0\0\0%tEXtmodify-date\02009-05-29T10:46:34-04:00G<�\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0#`IDATx^�|	|]e����kn�=MӦ�F�)��*�(��\"U@�~ ���(8\"�|*# P�ߠhG���J)mi�tO�6͞������s�{Ӧ�$Q�������s��������\0�?o�DV�����T\0{�wc���Ѽ��]�ڐ��!�N�|�\\���IS��7��c�A��f��q�^���\0oq���8\0�~����K���	/��ng�6v�0�d\0�i��w;QZ`F�#\r�%�L��\'�9���o���P ��\0|�߮���8�+\0���e\0V3�:<�\0�����ۖ�Ǒ�Ò�]��\0��	�H�pۣ��~���?�O>����!TT:a#X�a#`6+��:�-q�7�v�>�m\0+���Nv;��\Z�;��cNw���ȩ���[k�ǣ?w�����J0���P]�S��Ɍ	�dڌ�~;�q+Yy\0e�4���\0��Z�kmVj���V4N�C��)���\rg_��*�b?a[aQ���N�BmvL-�\\���\"��L:�����u?|\rs�w ����C_@A��r˂8)+�\"��M��&��s<�y�k�q�&���;3R�N(4K�0�01 rSl4PQ��P�G����q_9c��B;���bAmŮ4\\d[�%#�1!�4#�I\\`9VxSde�bq�\0�p�\nHaw��1D���*�L�3�`��]�p�o���Q�w��ҸO�v�R$�ԺT\0�K��/N`^u��E0�<�ٕq4�$P�I�НA�#�K�;#\nC�?f�(U(��\"�qY��YX|�ڈ\0�}�N�nz���Tm��;�>�����?C�����b���+Q��.� �c���Tg�g���t~\'`u�����t2�Pm$i�q���{����n�i��wm��f���D7?�V�c���:�������C;� ��	Yע��m�`�y���\0�9�ª!�:��*��ü>������jy\0�qu�����;݈�vP\0[�m��;a�; ��w3{�Hf�r\Ze���L@Cq��.f��W�\\i�\0�[�i�E(O������]����L�����<p��^Dz�`��r�(�1�ʦ����H��o��Jj�SVeI=&�\",��C_4��0{HF��4�L��ϋ;�3d���i��IR]FQ��p�}�������۴���E\0-���L�(Z����ڎ��8�������@\0�n�\'���\\��O�_:�*\\~�U8��K�\'�c�`%p�p�y����Mˮ�U�^�9���O ��#}ƼS�y�C��(�t#�G\0�Y�P�0���R��qn\r� ���ygcZu#\n=x�.�=�-�&`Kp��PWZ���8u��.��|6J|E8e�\'�O]��{<I�I��;w�8�x\0�T�`R�L��t�OE��º��S�#Nt�۔�a_�h)*�xo�>l�3cc��1�m>;�;�JNk�J;�물��󼖟�[;C8W��)�=4�\0��Z99�>D�Z�)ou:a�B�9��\nD��Z���KJW:c�\\�Թ(��A��	mB������Hp�F��Q�W������(�8�@\rH�\Z.t����_@��˴�c�∿����\"��\r���ˇ8Y9��:2J��Pi��^���s��+�4����ƎgD�/���b9�(-�P��c%R@�d]�(9�������{\\~g6������g����i�#�8@e�h�,��1����%�𘌆�ͦ��������\"F�Kk�MX�	j�A2)�M�g�F�+�i�Q�	h�Y�=��J}�d&NJ�C���{��~5�9@�~R[V�q�t��*i�����.�2��=�H���~�X�Q�ر������)��B��ՙ��<]��D��է�����Ŋ�&c�V��g�yOD���\\=��䙌L��̞��<g�om��f*�4�^p�c�W����O�����~E}¦R�\0\'���\\D��IsJ��4���P�7���X2���<J\ne��i��baF��)�8A�D������=Єh(�X8�/�ʘ\'U�0)X_Z�}]�J)h�Fy�+,s1Q�U{\Zl��қ\\��u��\0�Q�A^`��9c����7��bYR�P��\'�C>�9Ga){�Լ�L��Ǟsɘ\'euz�x�%��ު�Ay�o��=��D6�@�t��\\�H<F�P�5ô�k�s�H\03���8�	^*-`Q3����T\Z�`\0�^�|\\&䫡\rH�o(�@KW��#�MB��AH��p�UjnX3���	��0<v�	H\0%\r��e���[Ƣ�RXB��IOTW1о_i�$�6��MCu�Zq�\\�h&m����P̨�6�qK��&(����Z;�����a)����A�p\"Z�3J,\Z&��p��,&F�$�� H���7�;�s�y�H�~L-��k���o�i�lSh�����Z�\\��K{Տ�g_:���,ߐ�S5s!��8�\Z��DB?�ƴ�baLY�I�̘?�*�����1�!�K���3̧A*��BZ�V��ac�R��XD��u}uSQ{��:��/�s)���%��\'�?F8P��=���&d2���>)F|.Q�Q�?Eu�D�,��v^�h\rp�r�,�Rn�|�M�|�AQe�f-@w_\0m=���a_G��v���Ίzl�݃�>�����9�S��.%\r���-�����{)qI3��t��R�&H���ˢ-x֜x���Г[�+�:���M�?�Y�߮Y?�+ku{O\Zl��A�+��i\"2P��R�h͸n��3U&�Ę.#F�Ԫ5p[�z�U�3�&���(�1�Iu��SJ4d���V��\0&tO�`d�OV�R砧��}�3�V��*G�(��}��8���lf�kxj�jl�6bc�\n�\"�x\'T�u�*�	�a�ef�W0P�*(U0��j�<��a��6͡�Qt�NU=����a��/N�\Zgew��0���6SOԄW{��fO	�`���z|X���{-atv�i��S�\0\0+\Zf�[^�P4��i\Z\"�Mu�1x^�7��h,�E@��O��\nf�A\0E�Dbq�C���!ǈ��&E�E�G>�7��v�5+���g�M�¡����C\'i��9g��������#�p<�T���C���)�����qn��������`vW�/Я�Վ�	5C!�k񉫿���<�w_�(F8�K)P��<�h����_%&7N퍿n§��~�#F����[�8������wL1(���ߤLK��^�m����q�m�0�\0�i�#�J��ѡ�y�6�����+��%[1���@�1A3�6�0�ƣ�B��?B��6&�$̟��s3��uO���E|�b����A\05�d�,3��ڊKo����$Z�&,M�����^��LԢ�$�\\z%:��U��HM���4#�b\nY��b�\0�9B��C7�f�lh�ǭ����ym�<�683I��?FD>���%o���������Jֳ��o�5Ei��~��g%\Z�߯��f;�>�v���M%���I����i��^�\nх�����%��E��\n�k�����&?���������P`@���(VĐ��\Zm���|�Ob��n������co\"���n|�@]�4�K`�I�P�q9Pd�6�9��{[�As;�r[�:6�aî$h�y]�0{��ʸ�\'��	bR�$���mX�\Z��{����@omm��W�I����\r��dG��F��d��(��s�{�^v���?���-*p*�>k��(��2����g\"?�U](&��dE�z�S.�\nzc̽L�FE�[e�$bc�l�:L�^U��bt�`��7�B�f���۲M��[�Zp!K�w!A?�?�?��/����^�ڽw�41x� �N\')�(v��鑚xg|�|�\'+�*�#J[U09o�/{[h,LD$e\Z���fF���;Y�4���QV�CCe!&�{P]D�炓��;1i�1}�\Z�iU���[�D���N�\"[v��5�\0&�#e��DT/�N��\\{���\'�\n�!\0酌?eY�������ϼ���0+���Hj�Bƙ�1ܺw��x��[��E�;:бcK�*uZ=�g��\0����\n|S�N���6�nmG�g�ŉK�C�!|)��/aЁ�e��bgs+n�Z_���,@i	v�?�?m؇�{����\0z9��P�a��2��na�����=��0Ңjl�a�dŃ�Y������FW��.Zt�o�{��Ȋ�j\\�/��.{:�������cѩg2�Q��].�~�uب�$��;n���3��\Z�S\r��P�K�t)�Nb�w�\'q�w~����q����\0���\"�v�;}3f}��ţ1�ƶ46�S�]f���\Z��.�C�:t��塲1#�D�0eמg�Që�\"#�8�`�E����+nGf����GIY�2��\n@�͏<�\nCE1ɘ2����ߟt\nzʦ�J��ҸC�L�$���L=�z3�]�#�8`I1�:�72r�Ҍ��1F��h�o�1�\\��{=<�鍠��f����@T~�fwxP�+E{�,�?�<�,c�Wf��@1A�CX��pP�0�k)���\'����^T�W�\'<��]��w�Sf��e\"x�p?�X�����^{*Y��f�rJ)�rdWa��~��ڎ�]��A��q���cl�\nAU\'����)�P�s�]Ԟ���]8�G��-��x��T���.�G��}nW9g�33��\"(��I�p��Ob��+�.Y1��Ml�	4���r5�D1���3��ڝ�ߛ�\rߺ_��.�t��b�c��#�Q����}\0�r��x2��kP��3eg��$]�-T��I�/L-�$i\"*:�)�sŷ������9�A��TPyΨ\0��Q���SX�/�u\'q��j`v��MD�?C�ZZ2�?r>�Zxm��^�`/�8?�����qt�j��ھ}�����z���(�zX�e������Z��kniAc��_��iX;l��y�f���)�KP�.\"[�T#��j�!R@`t���(Fy�\n�+��7�|��\0R6@����sƯżc����h����z<�o8%Be�~���=��Ck�B��V�� �����b}3���ڵ�vd���&�q�Vu\"̲�p_\'\nhz}�A�}M{ha#��v囹���d�eLK�Qh��1�du6=$ ;�wB0	���/��6\Z�mH�x��\nv�|�	a����H�-���%<皮�0F��d;�qM����cBňXV���s�}�=m\Z*+�p׊F�y\"���s7�W�_���:,�?�~�[��PmN���f�NU��r�l��2�ə�P}�	�����t8����6�BT����x�Q�V��w��v+n]P���\\|�yJF��EA�3쑭[���\"K����U>�:[���׌Gt\'ҼWӞ=�%�H�����XP}\'���v��H1���k7}�tx\0��a�)�7\n�������jR��qPh�7jҫ��|m�]8�3��p\'\"�B��r�]���+�$��۶����ώ�;�#�賙���of2L\nε�\n:RR,5���*���眗��U�\"�\0����GХ������u\"�]6l��e�\0Yjс$�;Z�cd���l\n,��HyC&�8��Y��m�T���i��W��_�b�J�@Sڨp�a6�|ň\0���9��]5r?���@g�hȍ��U��Yq�M\0�#������@M6�}���#Q]�w\\g�	%C�5�;�n�y�]��%\nb���v3ֽ�!S�q�}>��o�+ԧ�NE��evn�I+�*\Zvt]�#\nR�SsSiSmB�\"a��:Y�+WRDc�㐠�6�w@����ߓ�a�_�&�\0�NjG��9���)0K���	\'���t�z�۰}�~*���O7�B��V��p��q�f��^�\r?j\ra,��H�i;�D��Tj�Bjێ&���\n�<\nl��C��Sg]s��>5o[�e5�x������a���ő�!��-k$�JU�6�[������0ei\"e�xo_\'���w�1d�.�d�����6�&6�H7Pt�T��8\n�sV���[ʶ�mV�k:�Iեc\0��QHL�=��1lIO���|���|��|p\'��7+f�J9jP���Pa�ʕ��կRIE�^X����+s\'W��x�W�����-@�wøK�\"�+rN��?cc�du�>Y��ș��T�d�S�4l�Mn�BoI(���C�:�\"n������N,x�V5a�L�RЩP�4ɗ~�,g��b%^xJm�5����������9\\����(S��I�p���j�u̓�\n?]�$I��+�{Q�B�^��%ړ��)5c���hcj_Q\"M�{�Xr}8�ڄu�V��=����;�� _i���\0RdaK*�O2%�Ð�<�H�o�O�.v�(t�Y<\\�^��ר^d�v�q�M�ט	^sW�X?n�����J���&�9��Ta���#��\r`r&���Vo5�6mu��\\wQ>+��# ��P=��\"�!\Z��B0.~?=t����5�ð���\"�[+炱�C��bH�*�qM��\'��N	ЊM~�Ȓk�ڙ�g������-�2�8Tz��8G����\\T�\'��3<5��r��ETϢs� R�2l�V2f\'�����@�x�&8&ԅ�Ȯ��u[W2�!}�&�ir��\'l)+���vN�V�R���IF��-��x\0/���7�(l,��r)K���!	�Y�j�Z\n\0��W��{������kp��nt�x6�М���ښ�4i���������)u��\n�rt�+��H�k��P\\AE�Z}��M?�]�$�I�E�w���&��Ȯ��X#�ay�=���\n��|�w\"\n\n�(`���F;���VF��4�d� �^q*��8�H�j}j��h����,.�@\r�a/�I2m��F��M����\'�Y��P4	Yg�١�-�\"�Ȓ���[Q~}�^��Ht#����\0z���?~��S�j|6ڄ?�&㺢3�-��gO�y�p�TⓇ\0x�c��ʞQ4�_������x��)\\�@R[�R/]��q��ݔleB�M��b6,�J6�	���ӝS�ܐ׬��t��J��GM�M�fа��8��_z\"ξ�i\\�č��VanA�ߒ�Ж\'f����V������}X��e�K�C�\"x���Yq�qU|QP1���T�\0?}�\"�(g>�r������q��`i���g����C#)��������Mt�2�$\ZU�U��Ek��ENn�U!�)W�)IYP���݇sfD�������N�e���?����G�^�)�b���͋_x�ଲ��G�ɉ�b+@�\'�3N����r�J5�Ж�22\npRK�˴嗖���lD��?��r��h	�oY\')��&(�jk����8l�|,���H}ê�e��p~��P{�X�һ�?��\\����ϯ�-�n�O\Z߸��V/~鞣��6���NY��~|�cQX\\���Zx�J��{��w�7�D}�\\*�����U�3m��\\�l	s��\Z\'�˼�/�3d�x\Z[����l,;���1�p\Z�	��p#�U��ԥh�znY����	�~rV?�Y�q�)8kv�5Ӟi��J����g%p�(b%��I����BU�$44LA3�\"���EH.�r��Y����~�`�a��Z���_�_݇�:�q���\Z9�F��6d�f_eZ�g|�r��E�kmŔ|\\[9�2�t1�H�l��������m,�-������_(�r\'�Q��X��I����3%m��V0���c��i�2��vH}.�(�g=���Z�������c�F�hb�I���y��\"طo��:��[�j�A��SRi�i�b�ɫ!���r)�}7n�=2dic/�h�N��g�]�Bu+؀C�U*�.����E� �Ox�����}ӱ�λ1i�)L\0T*X�����z݁��XD�X~�<LcJaj�4ub1��*��vG�\'�P�&KWW�0����\\�������֪um��*�P����bO��	����n;���s2{�ܤ��+����Ar\ZZ1������s�qܒe����g�2-��a�ydˮ_�_�Xx����cPA��:��\'OFa!_���e6F�\Z1�M㶗9���;Xےe8����ݗ�\rt�|WU��{�fˉ:�����=� A*�`���M?�X���0ݮd�LdY��\r���I9z���X<��t����x.�`�*)�\ZPSS���h��m�\0\Z J,-ĺ���vd\'��k����\ri/�*,���HM6xQ`�J��\n3��Wm��8ⶽH���f!�����U��,�nÑ��k!�¤�zq�Y(ק�,�d�JK�ќ�H��õq�ؐ�\"�nn�nokŋ�mǺ��:i/ȱ�\"�,���鶰�\"A�L�	���q�������qC��n���gչs�����IѮ	z\\�Z�c�xq�is��8EQ]uu5���Չr<RW\0\rj E6\n���]��0��ف��ݍ7�dYFRe\0�dW�l�;����\Z�IhV�r�u[Vb}�t�l8�5@�����Q�~JΊ�*!{�[�;������f���Vė^TTT*����)�)�w\0sWK(J䣰v��)���zq��A�uk��׃�N�N({$X*�ʴ�zq�NL�)�qnL9�6�Jg��|�\\�4����R1�d��|����+qb~c9N�7�\Z�延��KQRR���\'���IO�rB�em1od�L��X�������}�r�BK���l������¼�;�/X\0�\'�sB��%o��.*u��g)~bZ��P.�9PS�E]�����8���[���}����Em��\r�M��J岷��P�\0\Za}`<F�X�+���,qK�+�e�m]����CP\"�Z]���H�hxq�n����(��*�8IM�A����.��A1\0��q@�}޿	�����l���!\\U]J��<��ve��E�u�Wߚ&��R��,[`ԋ�)1�Q\Z7܆���M��X\'e���������@�{F*�\Z�����[�ܾr��@\0\0\0\0IEND�B`�','Attendance'),('104','assignments','assignments',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0P\0\0\0P\0\0\0��\0\0\0sRGB\0���\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0�\0\0��+\0\0#�IDATx^�\\{�wu>�}��{�v���qb��NB$N �hD\"!��	���@TU�V�_T只��(UUmZ*�j	�@hT�\"!	�<���k�]{�~���������w��73�^�M£bV�;{����}�s�s~gn��E~�\\2�K>�*�������c&�5�[ؖ pA\0��A	gɖ%��v�fU��P2�4\03S�6I���\0�!��V����o�e$H��K&�+��i5NK��Cr]7�!�K4@�\0K�Mi��I�[x\r)�\"9S���N�ہm��p���uٍ�p�<�7`Y��\0!����J�\r�h����q\n��1 �W+&m�1ѼN����m��!�dl`פ�ŇU������j���ɔ�Z�|��1�=�Vp�}�	\0=�w��q�|�/�@{�~\0�&e����ANa�s\Z\0�A;%,_)�l^\Z�9)r��+I��f�9i�V� �z6�ǿJJum|ԔLk�.��篃��������خ����3d�sY�����O� �82\Z�s5�kv����>0�����\r@*5)�\Z��:����Zà��a��v	�eiJ]�\Z曇�,g��vC�K9�\0`�	�t%X<5@Š<�U&�crY�g㋀s>�}[�8�$�`s��u��d/�����ZF\0b�K0&�q>\\C��\\-��\Z��C�o�������\n\0> ��f|�м��W\0���-���w��a�\007L� )�\"9��gv�\0���\0�%�\r2K�`�Q+T`��D�i�A���b���A.G��x��qWu�>`��iw���h������Yje�O�y��a�SJ���D�+\"��ߗ\\~\0b%mb\0�&�����U��D2�n�kk�Ouo��X�&��֚��f�{�,�hF⏀V����%D ��M�!%KUT������u`3��@��\r{���f\0\",*Xx7�\01fg���3�[��e)��\nWXVu0��)ME#�ҕ�ϕ	���X�鿭��DS��0��?��TN��ZI�e���Ϋ�G��m�z��\Z}:���a9����ϝ�L��V*��X�b�@h�d�gjz���% ��Q� �I���Q�:_�Mi43�P��_<���uV���6\r�I3^y�0��FE5\'�_\Zآ+���}Ls�gE��	��\n5�V�D�c�Z_�v���	ɍ�$����BF6�I?�/���x% x�<��Yo/ș`TNGe<8 ��d:sRZ��H���J�\"�BY��&pC����n0��<������1�e��<�ϥ�1�f��9�@F���S�!�X)�������� ��+��c7n�o��9w\\�c{�<�_��].���0a��\0�q���(�G��o^�ԓ�	�uL�Ã2�*S2.3���.a��T*���\n�\n��E��3G�>/�wݍ8ҿ\Z~�Ė_��h�����/�v�H/�\\�t4F�n��J\0z�����Q|h�H�:;��!�{NJ�.����[���R��\r�B�`\"�\rF`9�{���\n� \'����3���#r<�\'g2c2�?%�p�.׷����d|b����ҬJ�e�).m���`� �\Z�)�	��) c	��\n��ã�K�Ӥ\\(l�+|��S�>(a7���;�\\:7*���8����pq�l����\r hf`@��u&���A76��\0�|4+\rH�Z8/�����ї$xmi�����Ƥ4�K}f\\z��LJ�􃒩����D�4X�\\���A.�P�Rgp�\0��כ5SV��A\\����!�����l���?S}YZ}��z���� �)3&^y�R���oȖ�v�R�VJН�p2\rie\"�cpS�I�F��G{���(��*Q20���\Z�M0�4�Y��.п�9,��a	f�����@l�^��FYF[g��Y�+\0�:}l`0a��t���V\0Ni�!6f�\'K;!��IT;(A�Y�����O�b�H!D]�\Z}Z�G����9�\n���fـ���dT\r����ҋ:�t%n\"֐n���=�Q��ry驗���=r���rzj�LLJ�\ZIgG	\0�{q=K�d$�\nʹ9�H����ya�j�����U��O#C\0�xC2\0L4Ca�g���;y�n�����}\"�vH8����<}t���ȡ�%{�G�uzL���,�g�i��^0-������c���͕�Yz�S摆6���d�ߗ΍wH��ߓ��,][?.��38CN\Z\0��tQ\0� ��,f⒨�}�$޼U`��`���j�C	�@���A0W������Z�����\0�1OsNY���\n`%�N���Y��Z��a�$��W\'�T3\Zp4�B��k�l��-���������Cr��Q9{z�[\r�Y;cjn�d�� b~�e~�Y玲��O�As�+�,����CvC�\Z����nx�-�Hm~I�4�F4�P�|8���	�=4���`5a˻��fgg�b��\\n7`������96>.����\0���AP�土�(c ڙ���$��6p�\Z�]0I�����\r��fj�u��k���]L�>)�� _��wd�s/L\0�Y�}��i\Z�) ?��1�������_G ��_}�k\0g$(�΍�>�iX��z��رC�o�.�}&��ܰW{~frA\0�9V\'|�MI@���m�.رS����<��Ak�Pl��y�z�~֙<Y�X8!��cr��i���Oȁ�Qca�J��d�yJX�z��xC���Uo,�r���������Ð�P6\r˶ˇ��vB>mZ�����Q-���ل�L�ЬR��>�\r$��LM����d^8��z�Q������	`0w\\\Z���䙞1t����X��0YԺ�!�,�im��g!� ���\n\0S4�&�ឃ���MM��4\"|��U��*,��\Zx \n\\�j��b�j���L�����3�t�M��|����l�����:�I	�Z�͐��W\\����I��W���LM�S�����	�=�f�f˕@Z�ү� �BVF����\',�=�����ɫ�����<,�g�Tke��8 ��R,I�춁��)�pfq��YWc�漏�=�MP�GU� ۈX������*W��-Ȑ���?*�<�#��߾+}�9r�[匒�-M���	�Y5!�p�S��|��}k�9�_-�q�,��Z4�4���#[�k̞T���b*&�8�GᬙG��.�Y�Lc�R�\ZL�[�C&x��\0��g��-�s���}�������~���%�@����g%?��\\ViC�Q�0� ���a�o�8���nPL/�.� b���z�$��9S�A��_:x�]��Z��+�lz1�Z�f�z;��ָ�*L�Hy�\"������f��i�1V��(4��٩��J�K�yLY��-_�]@N�@�<�g5�5�|IPV�|�!� �\"8s��Ċ	�^K&LNrl���\'��| M&h�lq~-�Ԍ1�Exx3�&eNʄ�uʘ���W*E�@�s�e-�P�/�05AT�ۘSHL�GP�6����W\\���u�1��0�<e���`l1t#N*�@�\" ����$����3NPyN�������a���>�����^��+�S>�\0 �gۜX_؏��DTLȸ��X�8m���\0@���[���L�I����50�q\0[���6¢ [��Z�|qV7e3}�N��`��UL��7ao�&dP>3�(��ā�lb�\0�F0��������&ߥ��6\'%���ᅜ�M幪�R��jpf����B��t�Q?���,�A�Q����G}�6�^㢁3�̏m5a�h�6��<�T��\n����>���>0���Z�*�����p.ڄuB:.��\r�D���dd�u=��#{`8��a�hh:&��ln�\nqTw5F3a�MF Z&�X��e&ch�`<��r^��dԄ	`Ӯ��HQ���\0�Ui@$�����I�i�KF�����|�2�\"}�5����#lTG\rU�攁��6�[���\0Yy���Ã��~Bʁ�A�\0x�����q�b#���@����S��,�ZGe��`��q��.K0Ế�[�E�711!��I�� ��0�\\�\0���ن��V�P0@����c������\0T���jB��VZnN#�0d�Et�N3o2����B��kΊ��\r�+v�!��sƌ�L��d \0\"	޵]o�:|�g \nT悡�������m�̇s��K` [\"T¸�����}&�\\��Z�kG�_�+��0�Ke+W��dm\n�e=�bf섴g�$����\"s�YY`�㢰\nqvF���n�̧Y��\"��&��NB܀R�\0�%%4����@?�Wc\\��P�΁�.@�/ϐ���ρx=hlis\0�1�=�6���\0\\�J�x0=�i�=��:��UDb!��9��ץ��Aw�q�Fd%��0���o\Z�R\Z���oN�SO?-?��<�����?�(�t2�RϰT0�p�>0���_?⁳�h�϶[,]�(�|Qz��U^����Y�^�B[��_�>0��4]���r;�$�&jzs�~2��������ߧrP\'��?��D��J�C6�\r��HG��M�\0h��Q��RY��J�sU���������#�+:\r�\n-m��ޓ���mW�pZ�3V3\r��uY�c�E`d�+�),<���әh(Z�\Z2�:[E�e!6;g�l6BY����dg���}_��:?)���;�95q���{\0	�@_�H:���L�v��N�R$U|�~�\0��K����1p-p��1����\\��@���0�7�>F�1A$�i*�i5`f��)����Hv�2Ѽ^\n��b��vL��\"ۮ���x���>�d�\r^�(�y\'1_��&9h�+5��\'\"+�H�)����p۫1���1`B7��7%9�A�(f�5��(jN�O�@�[��D?7�mFjN��ҞÄҁ\'�>.���Jֿ�����/����/���l��Vq�5+����N�5&?P��L���·�hk��*����-@o\"��,�9\0n@\045����#S[Ёv�~\n�6��`=D��ߝ�k9�fd���]Y��+�@�kA��bQ��}n;fg*�:s̋hqU�\'Wb)��o�].@X��4�>�\0����\n��F��E�@lÌYd>��\rJ��4fV��F��GB��op������Z�\"�Њ�>�&%�j�I=0)[Y�&sZH��T�iC�1�NL;Ѯ~Ӝ�ZKXe��\0\"�yD\0q^~�N/·Xif���?HR��ԙ�uY����Қ����\\��K���f)���)|o�K��<�(N&ٍ�T�f^=S�I�OE{FD?�r�4�(�+&@2��n��s��Ι=c0�U�,�u,��&��Lv�?�vـ@-�%B��ri���ꁉA`tf�p�Z����<��\0¢h���u�$h�<\'���h-���3s.\n��4�T�7y�Ncbnd��*i����-7(5Ӕ�K	�t���u\Zh}���s���|\'�U߁\rZ`0�fn�`�\"0�� 2��M����%�U�-�O�KYܮ��a���]�<r�׋�<-HF�r�eMU��T\\����@�8��ٹϠ���Q�/����0�C���*2�Bj����!���υ5៚/A�����㰰t��LsN�Ll�y�k]V����\"�z�Ap���;�(sq��{�g.|��M&\"�R�Ԅ��	���8vu@TV0yp���Ƴ�hlA���{��e�5G�B�\"A�>\ZJ���&p,AF�#b���͟Aȯ���эU�1�Z���/t~�K����������`��i�5E>(c@�Ȃ5��r��/Z��\r@�\rс�$��mi�$rڰ�<Br�N�0��66?g��TF����}�9s�6��<�|%���I!�w8SuUb�,X�.��O��=�`��z�` �[��Z�$VQ1�	���L�	\n��W��\Z�@����J��d�_|W�)\0���[BXR�w�\n��\"��5D-�ٺ*�Y-ɛ	�@�˙���=�� �[��v���\'�!�aZ��	;\r�g̬��\n$�\r��[���<�;��H���n�Ą�(�Jy\r`z+��\ZZ޼�z��Mx�\0�iHc�w����;�3?ö(��(�F3�@��lB0�q�#ӹ0�A���}��F\0ؤ�m���8ui%/D��f7!���: Zz��l�@(���|Uf�ӢE����r���%�뤇��^�b�����H����࢙���,b �\n�Ɖ�t%ZM�hK�·���8�j4��k\07�2F��-�cQ�dJ�<kFO�Ț�-��f���䊙X��h4�ؐ�%�?&�]��K�gP6U��6a��j>x���5�B�\Z�4�3\"Ig�C5������f~W�G��3<ץ~���50�H5�3+�>�z�����\n8.�/��(���է�t�e\r�П9fد����yε,1a\0X�@�Y�2�����u%�^���m�>e���,m1�7��Εx�3�̷*��3O��2V���MQ_y���d�8R+{]ý��V\0W��E�\rs���\r7��� SM��\'e������δ-�P�NDU��0�[p�Ҙ�k��Yd&�:�0y=�0���i��4\n���\'Dq�LY<����I�0�&��Nl����(n�j�*��M�v��ݿ+�\\.�SS2��8c�&���p�R���Y{�#�J0�qFN�X�rQ��Cx\rАhmc%�.���p3��¬5�gI�\n���b�2��[`�7q�IqՃ�.��\0V�z߸x��\rā����� ��S2؏^��a����!�\'ݽ��0�XHdI5�0���t,T�:�w�6\0��T�9�F�S�G\Z�t^����H8�v�Q�4�΅�L�<\r(K�$[Ң��L�S��箑��6���ߖ���!�߲Q�������A\0�Z�渱PWG��ԸG�\Z+���3�\"��Q��[�(�D��!@i�|��L�T*��20��	/�]�д,r��L��ˀ����$��3����z�U��m*���Z�3cr��	�\\�kNO��VJi���\0D�\05d9����g!�>�\Z�J%4҃�1CfU8g���}i��m����~4\"�I�X]^`#���$xx&%lR 	p��萗��b���2�$4?��U����<��O�����>����x��Ǧ\0`�>��4)E���)��9W<P@ϳ�r>�}l�� �����֨����͛��Ǯ[�N::�f��dg�+e-.�����A9�8v�y����yp���e���-����,�S+�YmfĴ��Q2���g�2&��3��|��*m���<X3�\"�`��ֹ��c\"󆆆��2����6���!*E��%l�ˏ�nX13V�A�&&N���r�-p�|��ڸ�\r����\n�>{&�xמ�K�@�1���XEK���/\'��s#\\R4�qø�d��eU\0�q���i%��x��������D���]\\��U5l��*ϓg\'��G�Gy��i|d���N�StW����H�T�PH;M)���O�+�F����:~^D�Ƕg �#��[� ��g�v&��s����*ri��{q��3��+���~_Ǟ6Ջ�(2�������XD;_���������@M�؝os�6F0|5:�18�S���8:����QXJ��\"Mw˖-r�W.�r낟�>�^�9y�hNN��þ9��+�`�4Cq`zp=+Є�޷�P�_�nPM�}�!�]H�s�Ui�U�i��	�J�\ZD�0�@��̝ufy3&f�3��pR����Q��<�n��~�kM\0��Sn��Ϥ�ʁ�[�C���N|�n�E�\n��Ł��$�����/xS�\rJG}�!����5J��]0��|����AS��A�0�\\T�fK��Q�`�Q���&�F��H�HKa�G���e�V���͟\\�	������\\�Q�^�)yq�CN�k���se��1����\Z^�%\0/n�)������2���j5J��\0vo��]\Z�R��Ou2�*�*�ʊӁ.�\0�E�8p<dc� �ϲ�oV�ߋ��Bٺu��tӍ���f^�|	U��7�+���\'��?���{���i<fe��&7&y դ���#�s	�yl�U6c��}֥����\',$�H����V���M���:��g.�\"�Iu+iE2?����Y�8������]��F\\˲&^�D��^#{>�y��ï��Ч��=2q�,p��%r���(mL=\\e��֧g��ӟG��t#��wڌ�/�L\0Xg.�^#a��v��m�u`dP�^��������K��o���\"�}��?��TJk�e�{�r;�x�vמ˭�>.��zHF\Zw��S�07�(��?����q鞂�4�-Y�U��u�l��`g��J���TR}��)�M>�cS�Z��+a&����u�;�O|��D:5��o�#��q�\\s��wL�r���|�Zx�����Z|�>+�~�L_�i��n9V�1q���,�������^)��Q6��蹻$:�I$�L�\"�rN�t�\"<�	���{�l�R���Țd5̭TQS�k�;�ZL}r�w�3p�G�e���ˊ�����<}�8~5���Iv�����C2x,V�7ZzQX��㷴��R�L�m�~]�CO�o?��D���(�褴�C-��Cao�m{���i9�>.�;�}��y�������rÍ7��C�s��\0�W�PEa��ߔs��,��q}t�\0��SvT��=sA�(��l݅*���dS/�#b�@������ӒÓFt�w�}�\\��Z��KC�sU�ϡ��|��r������_��`z\0Ǐ����I�`ʖu`eW�ZA�_����E��C7ʟo=&�ԞǏ��=b��q�c�,��	�-�����\\���7>���W\n`�J����G��+\Z@�6�ʋ�ё��Y�y��ܽ]�`��g����G�k�C\"{_��?��|�9���;�^�\\�_�	�tQ�౑W���/��C?�w~��M����g�d�ڐ2~�b��(~k�2�e�Mk��ϯ/edMD���Q�j���K9��������\rсo���:���\0��K��u�\0\0\0\0IEND�B`�','Assignments'),('105','tests','tests',1,'����\0JFIF\0\0`\0`\0\0��\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\n\0��\0C\0		\n\n\r\n\n	\r��\0C��\0\0P\0P\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0���54ӡ@���0�8׃#z}1�O`\rg]x�\'�$�$��£j�d��k�Z��|E����4�(�v������4�[ ��;�Ϳ��K�o6��`0�c\n�rA�N~�����M2C��$��6�lpoXT�#�<� ��\0�\"Xӌ`t���7\nܠR@��)�5��PY��%��@�\'\0c�8��99>�P�ۧ\\6�ie-�v6�yO��[c,�lIS���n8�a�Z��ň�����Гt^=򷢀x � �䏔��6�\Z�eH��2.�U\n����ꏦ+�YQ�:��Ӄú��E}��濵��q�G@��Gv��9-��X�^s��Toh�g�zF�.$��մ�K�7ZN����RX_\'�$�����F�ėH���I`�u���57��i���Fp\r!�ZO��.~�b���_���S\'\n��[\\����nS��#�\\�;����\0#�����o���b���\0|�G�]���km��!������>���\Z����m���u�����I,+�G=���7a��w�h��<jf��x�F��R㏪�\0:�rN\"��f�˚2iz7��Oͳ��O*�U�U�R��ndT���X�ӭ��Gp�&\r�\'�=�S�UK��u6��՛�8�	@��|��Wg��v�b�qon~4x�y �Yര0�(&\"~�	���G8$w5_T�R��\r>/�f�p�kh|ȭH�c��A�,y�d�[����Zg{�8]���?Z�A�T�\'��d���:_�f՞Y�5;���\'veR�F	��>Rb1�����t}�6ZD�%o��,H��䓴���P3�a�j��Re��-��p+��\0k�+�B�y-#18\0���5�s�S�v�y��)��7�?�.t�B���̊2�ʻ�a��t��_-Ƙ���q���m۶�^o��|%R�3j������y�m���[ொl/��~ac�G;C�x��2��rC$##ϔz)ڿ������\0٫�O��\0�\'����Ii�w���F���u�]��d�@\n@W�M�>���m�_\ni?hԣ\"����܅��5�FI�W�f������9xr��x]գh8$0��o��#|�>�ѫ��#�%�3��.Jqn��\'f����ۦ�+��\0�q8o�)��|��q����}�K_�������F�w��Ce���J����!Ob����!g���������O�Z�w�c6������+������>��*W˟�{�J�~ZOs�_^kZ��:��72��]H�,͒I�Z���a�o�_���\0M�4K(u(�/,���S�|�{W�Q*�\r�J����Z4ݖ�����ว\rZ4�cB4������\0��?|7����f�e�k3�%���k�u\r6�.���[n�87c��iK����w�3O(Dy���\n��p\0��f]jv�7�_�ݹD�\\HB4���r��TIb\0\0��x��g��Ѭ>�s���.�gx��K?Z(e��V4�R�U�=��U�|�|;\rwTյIlñX�g)���4��O	I	Te\r�XE�\0ć!@�D�g�Ǣ��������1��W�1!I%T���rpdbI$���\r\'�υ�Ҵ[k}+G�Bn!#�v,�I,K1\'�s\\8����p�Ě�5�m�ti\Z�Tg����Yb�Q㐨8���\\�ʴ{���_����O���-,u=k�:�-ws�&TҭDr��b3�t��(l�q#�\r���<G#N��>ܞb�!�#��*{.~��xW�pxR��\'�I.�Y&�d�b��h��h���\0Ԓq<Y�ߔ������Q��b��%G��mVl+2��^3��pI<�o?�үQN��[.��vV�(�7שg��м�K�i�6w\r��0g����?3g��d��a����JbI/%�wQ�#2k׼\r�x��^x|I�ˮ�L����G�Y7g2\"���.d!#�ƾ�M�j�wI\r���3�:�/�NH�П�W�q�Ga���k�w?G����%<M]Z[������\0��qx�������[I�9_pH(��������+O��<=��������&/�YS\'�%�����6߲�%��׼Wc<�l�<S�Er�#��^�h]��$n����\0�}�D����t�:BR��*3�I2�O����[)ɱ��j�V�2~���}����	����FW�a%����ϭ�}{6�%��M5�t���8�h#x�g����\r����խ���p@�0���YR��\0w��c�<��\0�sYz���O|@�ׯ.nV�%��{l�\'��\'UT.$GgG�)E5�;g�q��k~$���WK�\"�O�q���^�4:��Մ�i����8Tw���3O��� �qE�$�w��X�I$�I$��j{�-<=a%��ŵ����$�ȱ�\n��b@�I�CƑ���Ok�5�tM8��\\lYkϴ[mV�@�:�tv<���T��C@�q����/˩x���\ZG���^��5���i�?�٤�\r�`����TQT2K�\'���h�\n�����)�k��K�b��N��*]Up��%��\"@s�c`l�\"*�Kp��(��0P��h\0��`�`W�_�ڏ��a�e��~�,E�e��13\'��2��9��.\\��?�^�~�������fK �:����m@�8�;aQY�Z�W�d��>$C�V�mKX�,�!�6�_�mV^�p�j�\'yp�Gy��B�u#O�|G��i>-�4��Z]<�G6�$H;F$0*) �PJ	$Q��-F��G�3]ʑF̑��I,�T\0	%��\0�@�8�1}����O��K�B����F^y�,q�\'�b\0X�$\n�س��Y��~�-��W���\'�ãf��6�dyH E{���3�<7�:�ko��;Ȧ����b�V\0[g�\Z��IM��| �W�x�zdz]�Vv���\"�~y7��I�fwvfbK31$�I�Ya�QK��>��C�h�����V�!,�Sf�q�N]B�ѡ=ey\0�`�rEu6�v�w1�{}*��O��wĿ\rͥ�Q ��e8x�rH�ys�����H�R}���A�=�|E>��y��wC��;��z�O5����\0\0�|=����̖���#��Y	FB�(;&���b�^&�r6IѴ�\0h�i�M�VVV��ƙ*���ؒIfgfff$�bI$�T��\0�[?����̓�kq�!��00�y�*y@�ռom}�\\iz&��O�XL��ɦG��3�%c,l�|�(Ã��S�M���\0�Z���毭�]Lӻ^^�v���\"�R\\ƀ��s*+6\\�������k�+�����?�I�X~O܉_/�-0��F8\0�n>#*�����r��b��H�<���.2��d���@�4�e񟌾!\\������l�[ؤXQ��ʻϜ�L���訦1,��+�{�� �5�m\nٴ��u�����g��1Hcq�w,M��1�;�te�\"�\'��$�\0�5.SeY!,l���������DQEH�pTp\0���X|Gl%R��f*z�9PO�Nq�5��Yx��m�Y�GHW��R�\"�U���#��k���l����v�=ĸ2L��N8\00\0�RP��εՑ��','Tests'),('106','mail','mail faculty',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0P\0\0\0P\0\0\0��\0\0\0gAMA\0\0��|�Q�\0\0\0 cHRM\0\0�\0\0�\0\0�R\0\0�@\0\0}y\0\0�\0\0<�\0\0�s<�w\0\0\n9iCCPPhotoshop ICC profile\0\0Hǝ�wTT��Ͻwz��0R�޻�\0�{�^Ea�`(34�!�ED�\"HPĀ�P$VD�T�$(1ET,oF֋��������o������Z\0��/��K����<���Qt�\0�`�)\0LVF�_�{��ͅ�!r_�zX�p��3�N���Y�|��\0��9,�8%K�.�ϊ�\Z�,f%f�(Aˉ9a�\r>�,���٩<���9��S�b��L!GĈ��3��,��F�0�+�7��T3\0IlpX�\"61��\"��\0�H	_q�W,�dėrIK��st�.��ښA��d�p�\0&+��g�]�Rә�\0��Y2���EE�4���4432��P�u�oJ��Ez��g������\Z\0`̉j��-�\n��-\0���b�8\0���o׿�M</�A���qVV���2��O�����g$>���]9�La��.�+-%Mȧg�3Y�ះ��uA�x��E�����K����\n�i<:��������Ź���Pc���u*@~�(\n ���]��o��0 ~y�*��s��7�g���%���9�%(���3����H*��@�\0C`��-pn���	VH���@�\nA1�	��jP\ZA3h�A\'8΃K�\Z�n��`L�g`�a!2D��!H҇� d�A�P	�B	By�f�*���z��:	���@��]h��~���L������	��C�Up�΅�p%�\0�;���5�6<\n?���\Z��\"��G��x���G��\n�iE��>�&2�� oQEG�lQ��P��U��FFu�zQ7Qc�Y�G4���G۠���t�]�nB��/�o�\'Я1\r����xb\"1I����>L�f3���b��X}����\n���*�Q�Y�v�Gĩ��p�(�������\r�&qx)�&��g�s��F|7�:~�@�&h�!�$�&B%��p����H$����D.q#��x�x�8F|K�!�\\H�$!i���.�%�L�\";����r3����E�H�K�-�A�F�CbH�$^RS�Ir�d�d��	��3Rx)-))��z�\Z��R#Rs�iSi�T��#�W��d�2Z2n2l���2d�)E��BaQ6S\Z))TU��EM�S��Pgeed�Ɇ�f��Ȟ��!4-�-�VJ;N��[���i	g��%�K����-�s���ɵ�ݖ{\'O�w�O��%�)�P�������_���R�Rۥ��EK�/��+�))�U<�د8���䡔�T�tAiF��쨜�\\�|FyZ��b��U)W9��.Kw���+��YUEUOU�j��ꂚ�Z�Z�Z��Cu�:C=^�\\�G}VCE�O#O�E�&^�����W�Os^K[+\\k�V�֔����v�v������\Z��[�]�n��>�z���^�^��u}X�R���O�\0m`m�3h01$:f\Z��ь|��:��kG�2�3�hba�b�hr�T���4ߴ��w3=3�Y��-s�����.����q��_vǂb�g�բ�⃥�%߲�r�J�*֪�j�Ae0J�������OY����������6�����r��������v�v��t�X����L��ǎ�l�&�I\']�$��NϝM������.6.�\\ι\"��E�n2n�n�n�����[�g=,<�z��D{�x���R�by5{�z[y����!��T�<�����v��~�~����\\�[�����w�?�X�c &0 �&�I�iP^P_0%8&�H���Ґ��:��О0ɰ���p�����u�\"\"��]Qب������n+������.�^��*{Օ�\n�SV����aƜ�Eǆ��}��g60���j�fY.���glGv9{�c�)�L��ŗ�O%�%�N�NtH�H��p��/�<�����%J	OiKťƦ����y�i�i�i�����kl��Y3���7e@�2�T��T�PG�E8�i�Y��&+,�D�t6/�?G/g{�d�{�kQkYk{�T�6卭sZW�Z��g����\r=6�Dؔ��|����W��7w(l,�ⱥ�P��_8��vk�6�6��۫�,b]-6)�(~_�*����7��|��c�Բt�N�N���]��I�喍����QN//*�\'fϕ�eu{	{�{G+}+��4�vV��N��]�\\�V�X��v~{��~���uJu�u�pܩ���h�j�8�9�y�IcXc߷�o�����>�\Z=t��٪������E�2}4���\\��j5l�o��ǄǞ~���q��=\'\'Z������^�u�t�v&v�vEv\r��>��m����я�N���9-{���L��Ogs�ΝK?7s>��xOL��n��\\��x����}N}g/�]>u���ɫ����,�u�[���d�S���@�u��]7�ot.<3�0t����K��n]�����p����;�;SwS�yo����E�V<R|����m�����\\��?�?�\Z�K�/�\'\n���TL�L6O�M��v���t�Ӊg��f\n�������~s��6bv��ŧ�K^ʿ<�j٫����G�S_/���s�-�m߻�w�Y��+?�~��������O���������\0\0\0	pHYs\0\0�\0\0��+\0\0�IDATx^�PT�����Z@�(\ZE%$�\'Dc���d&�Ԧi�1ֱ��yv�ʹ�$N�&3�tƉӴ:F�fL&i�����6��� �K�,첏����.wa�]���������w�w����~Gcc!i0���o����Z�Yo�;�s�#�\Z��U�;��F�ѡL�cCi��8\Z?,���g%�(|w�e��L�\0\Z�д\Z���I@�he�¿��\0:md<�<{X�\0o�\Zh�Gg��-E�10\"\r��˂j��m6ӈ�HZ� �R��ې��Q�DϾ�LL<$H���9\r@\Z�V�#?Z�����)m\0�w�}]3��8�����?}J�ꃸ��|	1-!�6�������6�A���6x8���Q���i1LV6� Zv]�w[�D�mj2Y)��N�2p�c0ӂI)���L��n4��=�}���[�N2�,����|�AJ�	��:�Xy��Vn�H�dx��\r��b��0m^�O�C����\'����\0�G�Yx���\0)`f`�=x�N8Fi��ya�:�[^��\008833�Ӗ�5S�]r�������>�m��,�l���i~���l�#��L����ge*\Z������d2�T���燄�PvV�1BQ�w?�L��S8��9b����f��o2sƝIOO��F�YC�_��,O��c�o�믾�A�-�	#���HD�ԕ%�+��ϝ��cƐ���А�F(bā^LgN����l�J\0q�]�;_!i�v������O�fc+**:v0	e�\n�3=-�H�-�*�F�EINv�C�\r0����[)&.����(�����ݶo�FYNݷ3��>�#��;ܨ���\ZU׍�#\"\"(!!A�ז�D8����H\'\0ݶm���\n��]Xe<|�N?@/Q���G>�v�UTZZ�S_:/���͜��q�����\'Ad���t��$�4��ӌ�4�wʹ��nw�}��	x\ZΗ�BCUy@7�X�\0��{r`ss���\Z�q���h4�m�n|���F�-�rft��fu�t�a\'��rW<\n\"UUU��ҥ�����`P�5\"8���SaA�[�����t�������}z�n����~��m?@/_a�\0bB�ʟ)��N���Ⱦ���_<�<��ԐVeC9+�����o�HS��>\nWVVRvn.��*��U)1�\'Tϝ>MIII*z��?.�a���j<�t����>P�,*�[r�U��m�y�	�AGg�������G/,\\H��\r�f/���n���+���ݻ��ѣ��\r>�S��\\XX���Ӵ�S5��|�\nXu[��H�[V����=���z	�� �����r���I�1K<w���{R|D-^L�_�w=���\'�)))~o[6�uAv���\r��%|���:��v���I\"]����M��D@��ס��k^�r�T�7*\'��bc�����%f|��2c�5�܎�-�Z��~�U|\"v*:K�С��\'�Pưa�+s~\Z�a�Y�,[֣\0\'��p����#�������`���i�����`����^#�_��+�w���v\\��Ǫ�+����2�I�`q؅S���W�H)�z�H-��6����n.�x���٩��bn���Zr���]���.H�����0�av�q���9>tK=o�+�q�mkS )��gA�\00�߱	f`�}$3��u��>-%�IW�6ҬՇ�?�n����=�`&R�\n��Nl���d���<E�����f��8��X=��FyѴhZ�O���r��T���ף�vTQ�D\r�cU�[���z*��j~��ؾc}釧��z��}���ULu�Ma�V������TZ2#�\'�b�\Z�F�\r|�P�A{���`:�h�}������r��E\'�?A��7����J\0�����@���4�[��j?�e��b����hïƶ=����e.��O*�[\\/�$D��_��굾�J�D\0�z4��,�	؀��(֍�{��>>XA�/�\n��ڵx�1;R�7�>r�G�7vo�	�(�S���(k5�ʟ�^ݘ������T��q�\"@I���H{fYM3��޳5d��\"�ʓ��=1�[�������*A�o��&������)�<\\���0z������N:_����T�	%\n0@�~Y6�O_�[�<��̺�����rx9C�i�oZK����k���L�/����&v籮����k\\!I����s�w�{܀�.� Ly��QOJN&��5~~���Q��]����LL�\Z���cӣ���o�� �|����ս����M�q�u��迧o��k�����T��]��<��C��F��&���f\ZB�b�m�*8�l�=��RI<4*̎���\0;�c�x�%���\"e2Հ��֞s5]�w��:u���UIBy�_�hT�����n�������B4(L��Zt%����Cu8��Az�5��ւ���@<��SR��k��[a��*>_�R��e�S9[�s�����m�e @���\r�y��P���~�o���{���r��<r`d-��s뽞�R:��\0q�gf����\n1!�MY����R�9߮o�E)9����qT�e��A5�\0�\Z;����cFr:�R>��1��gq�ì..��I��\ZA�^�@�q/L{@�TH��\\�����~w��.�:s�a����SRD2ݛ�+�P��Q��/D.\'�PX\"���)e����,�9;��K���k���zfr�Hi���^�/�Q%�%@���}1�6st��8���5@\0x����n\"��\"X���W�9�����(O@,~<������Q<�5md�\0#�y��X�*\'���CW�k\n�N*m�\0�r/qJ�P&ֆ-�9 ��s�S^�g\0QSjrVOu�[!����f�sR�oJ�\"> ��Q5p�eX��`[<=]-�|�%�H�k�K�&�B���� eA�Ee��\\Vtdj��\0z�&��ǮަGn�w�ja�C�x�^(�ʁFm��A��\0\0\0\0IEND�B`�','Mail'),('107','grades','grades',1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0P\0\0\0P\0\0\0��\0\0\0sRGB\0���\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0�\0\0��+\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0�IDATx^�\\��\Z��v�9g�@x�D�`���J�l�0�9g˲̱���D�H���2`��A�,���;���۽��}�55��ӳ����j��fzz���s�ݞzqY����V�x<R]]-���)���\r������K��_|!\'NL	�F\0kjj���R222�����M�dff�_�%�Ǐ�K.�D^|�Ťw݈$+dee)\0I�M媫�Raǎ�����;�\0\Z)p������h�PS*���Hz�!%���#}���ɓ\'\'mF\n$�E\"\'|Addg��E�n-�v��ڴo���K�[D�m��䨋��e����k���9k,�@v���CЬ�}s�JŒ%R�a��o�:�X�գ�44Hڜq�40@�jk���J�o!���{N��U^^.-0�ӦM����w`\"�e��~\\�e4a�W_�\'��4�T��&��	$�{w�q����� F���L\0�n�*���dcr�E����ӧO�����)Ѓ�g�l)%_~)�|PQ����\0Z�㏗�#FHn���o�V�1��ΝR�j��~�����S���Շ��������L�W\\\\,o���A\0)�4%jӌ 6��R ��>v����7!����t�yr��K�g��J�D\n���}xV�]}�=R�r�����2��7��sT�n\n�1i�$���@M��2���O>�DY\Z���\r�謳�����n�^*�1�L�Z\0IV�%�,\0Ӌ������.+���x7�k��^�Zrz��z�FS!�;v�w�}�\0��@\\T��S�LQ�1�b�º17���U+)��k�w������*�.\\(���D0�A����v�J&Z�\Z��<L����a~(�\0��-�A�	\ng1�I��P_�{�hd���b��믗2Pz<�����y\0\"�-��\"�b���Xȱ�!C���� *W����;��ѣ���mg\0��\'sA}p�< ����0;�_y��C!ٷn��g{�����\'+��`Pm��v�m�m�6�\Z�-9�d� ����\0<*�s7m���ړZՇY^v���o�`c�����-Z$!|pϬY�؁5{��P�)���6P�r�d\'��]�\n)�`������ȿ��]�t�x@֯_�\nD�\0:�F�V=���oȒ�/V��q9H����7�\0�@!�b�r��,χ{�^���-��s0T>hr��:��@�xvA�f4�k\Ze-d%Y��Q����J���/� �������Q&`p�`� 5i�[n��{Ԛ,�2*�o@�`��Y����>P^�W6o��͙�L�J�|V�N�r�@e�d���w�)�\0w5�Y��K����!�R^<�;\Z�!p\0��E��A>׬�g�4j�N�S1XZZ��\0�e)\0��zu��3�@���6��,��^i~�2�d�e�I���\0�n:HA�G�&؞���V�^u�������R���e�Épb# �Z�����:8�������%o�Z�\0 �k\r�+�}{e���~����g�>D>���I��ۗ-�j���>�t��b�����x�/���S��p�a�$h�U�$�\0�:\\!P��^L�P�A��/e���\n����M,lP�L,�G����8M+h\\vN��ì���R��z���N:IvAQ�\0�|�c�ɥ�<�\0%\r}�Y�w�&5x?��n�(�J������Ⱦz�]r�J=�O�A�����&��sW\0:}�\rEꢼ�aJ���fųg�Lx4k����#�	\"����c˨XP�fN-dS%X�����A��6x5�	�C�Ӕ�7a��m��m�ܼY��n����	H#���XlB6����DwLiM�v_5da\0��v�����3%o�8�ER�-{�5EM����s�����\r\0��̂M����6h�\0�$p�\\�D��D���Yܰ��:&��bZ�	ߩP��]7��%Tu���\Z@E������k\r��AȯjR+.�������%���\n��h���7��%԰C-]�>L;�8�0(���?/A��8Y5%%J��½��p���z����SI���`SF��(F�TA�����hQ���T\0�*\\�\0�ছ�iA\n]*$��>4x��2a��\0YH\no�y2J-�R`� #4�uCa�:n�6��Uc�16PP>\\ RW�wH��Y�P��\Z�Ybm�\Z,x���@x���qP3�]�uP4���B�#�P��x�nJ��C�\r&u�C�>Z���:n���,!�4Ȗ��Bc\Z�2	�GJ<,Z	j�	��;�ˊJ�J��90���at�֭�	�R˷��C%h�����f.����E���8�EH�Ωd8� *p@������+J���p�L%����:��O��<]_�RJ9��!����;�p��#�ȐY����tRd����E٘�	\"0����oe\"�n�iALMK��.Pf�:�rC���\rC�΄L<��seB���1�/UύȈn<�\n$��#|�E￯��-X��\'��A`m��!hjN;��iS%��*���/���Jh �M�Y�ʾu�q��`�K.\\��増_�?�~[vC���3|�����h3P&G�2L]\\���cx��>��z6����w�~�IZ�����[�\n�;�k�\0��$�h�e��땭Y#!7@��ȸ_�.\0���ܷ���)�Ϣx�	�ɿ�j�N?����F,q��s�	�U�d�XS%,�0�NDb�~�Q�����=eS����8�\n��\Z���X��~�R9�k�u�dt2�\rR`�S\'D�P�U��VJ&{P��Z��[Ƙ\"�E���:�v����/�7[�����e��t<�p�^%D���{A�8W�H:��o�!G�`�/�Y����\n���@-L��#�=��U�)�K���D}Is帎p4�0eh̦Bh�\0l�.X~���#	�{rbἼ��\rVJ�K�12h	�r��H6�Z\Z*�_�p���M�h��Z�����\n��x��ojtk�Lx1E| k��R�0nf-=!��C�q��5�r��+d	��2ؐ�ijC�T���	#�?!ҽ��a�>*t����Vۑ�5�Qpd��#�0�6r��n,C$��c�@�����%R�U�V��`D�?�]�#�9�J.@_�t��\0㎽/�\\�zJj\\��Vy\Z)p�+�(�I����	 )�yζ�	Jk��婈�����p뭲��Oe\'���\\s��Fp�2�m�w�S�T�\0nܸ1���{L�HG!���c\"\0o\n��N�������8�R�Z;!\07 ���ΕR˗i�7B��9���4.l�D���W����뮓\0\"A}���=~3a\0�f)��\n�|C��\0D/��B46zC\n�{ʔ����#6���L�c��]�F��0ځZų��T��.� ������v��ډe\"\0W\0� bP^�:�a�#�z���I:�z\r��P��~2�z֣���T���XwV�4���&Lp�iL��\"�&&71Y	��t�ݠ��1YXS��\'���2��ҦFt���P)(f�Y���P�#�����?_Zc�T턲�4�@�!�\Z3egҦb�q:|a�A<�h1#2\"_{���(ڝr��6���T_��s��R\r;�~�و2*Z[����QI1c�d�SS�N�����_dC�;cԫ���+yԮj�((sRH�\"@��w\ZV���ק��h�@#;	e��6���m\'�����\"�s%R��\'����|��ҵkU`a,V\0���\\���D�-�F^g<�+��m�X2�S�r\'���g��fD��\"�w�Q=�[�\"/F�5�Ӭ�_$�$�;#�˱�#��$�m��6#�a!���6\0n0��OS����8t���\0\\�l�� )��H�l%�0��)�t�ܮ0�a�=L�	 ;O$#�ԔH{V�\"��q�#�p8ry�JBJĭ�8���s3c5vC�ߋ}d�~ot?���5���|Ҿ\r��\r�ۑ�T�OA$:��a�稧@N��n��.��eA�� iI��٘/I���|��!�8l�ɀgR\n�ۃ�h��z��m�c��)��}O��o�c���T��z�P�1�e�:������gi¸�M@�h.��6;3FoM�/�ׅ���:(n�]�L�=�gO�c�Ȥ�g�&�u�{�ȑ*U�=|�|��Us7���\Z��P��S��y\ZF:.۸$����al�e\n��(�d�y�{��\"Mw<n�d��-������\n���W|,Τ�G�0Q�p,\03��\0�,d�V!s�\0��#�K*�th�D�F^�<e;V�~�	nf����\\&KY\rz~�i�_}UV`ќ{���E�6�8\na��\0�gz0�V��`\"�����R�T��|�2���o��6!�Eo0vȷ?�4)o`��|�\0��A\Z	8��#@P��X�U�VcY�i��@	��1c�����qI\"}�,lШD��ԑP�.�~5\0�,�o���7x�k�������l�C㴡R9�t�M�x ��\riz����!��p�N��Vj�\Z��OT�9ځ[+[Z_�ڬ\'��7�|����h,������j���;��Nu}�%ߵ����{��E���\ZhՇ�r�AӍ�>�T;��3�����\r�>P�n�]Q�0)��L����5��7�������y�T\r�>�I/�[����R�]��Ԭg΍@N&���Z�+V�\ZD+�����:��\rz\n��Քg=��.��	\rL,O ���\0�)\'�\r��V�-ˣ����D��O��`�s=�� jj�\0j��cG��-�鰔n��{N��g�B�*7}n`tv�L�-����YYX�|�_\"�R���I\0\0\0\0IEND�B`�','Grades');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personaldetails`
--

DROP TABLE IF EXISTS `personaldetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaldetails` (
  `userid` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `gender` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(80) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `image` blob,
  PRIMARY KEY (`userid`),
  CONSTRAINT `fk17` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaldetails`
--

LOCK TABLES `personaldetails` WRITE;
/*!40000 ALTER TABLE `personaldetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `personaldetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialpermissions`
--

DROP TABLE IF EXISTS `specialpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialpermissions` (
  `userid` varchar(45) NOT NULL,
  `permissionid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`userid`,`permissionid`),
  KEY `fk6_idx` (`permissionid`),
  CONSTRAINT `fk5` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialpermissions`
--

LOCK TABLES `specialpermissions` WRITE;
/*!40000 ALTER TABLE `specialpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `specialpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjectclasses`
--

DROP TABLE IF EXISTS `subjectclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjectclasses` (
  `subjectid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`subjectid`,`classid`) USING BTREE,
  KEY `fk9_idx` (`classid`),
  CONSTRAINT `fk8` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk9` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectclasses`
--

LOCK TABLES `subjectclasses` WRITE;
/*!40000 ALTER TABLE `subjectclasses` DISABLE KEYS */;
INSERT INTO `subjectclasses` VALUES ('cs-101','class1',1),('cs-102','class1',1),('cs-103','class1',1),('cs-104','class1',1),('cs-105','class2',1),('cs-106','class2',1),('cs-107','class2',1),('cs-108','class2',1),('cs-109','class3',1),('cs-110','class3',1),('cs-111','class3',1),('cs-112','class3',1),('cs-113','class4',1),('cs-114','class4',1),('cs-115','class4',1),('cs-116','class4',1),('me-101','class5',1),('me-102','class5',1),('me-103','class5',1),('me-104','class5',1);
/*!40000 ALTER TABLE `subjectclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `subjectid` varchar(45) NOT NULL,
  `subjectname` varchar(120) NOT NULL,
  `branchid` varchar(45) NOT NULL,
  PRIMARY KEY (`subjectid`),
  KEY `fk12_idx` (`branchid`),
  CONSTRAINT `fk12` FOREIGN KEY (`branchid`) REFERENCES `branches` (`branchid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES ('cs-101','Computer Architecture','cse-1'),('cs-102','Object Oriented Programming using C++','cse-1'),('cs-103','Digital Circuits & Logic Design','cse-1'),('cs-104','Mathematics-III','cse-1'),('cs-105','Computer Networks-II','cse-1'),('cs-106','Relational Database Management System-II','cse-1'),('cs-107','Design & Analysis of Algorithms','cse-1'),('cs-108','Computer Graphics','cse-1'),('cs-109','Formal Language & Automata Theory','cse-1'),('cs-110','System Simulation and Modelling','cse-1'),('cs-111','Environmental Sciences','cse-1'),('cs-112','Expert System','cse-1'),('cs-113','Formal Language & Automata Theory','cse-1'),('cs-114','System Simulation and Modelling','cse-1'),('cs-115','Environmental Sciences','cse-1'),('cs-116','Expert System','cse-1'),('me-101','Theory of Machines-I','mech-1'),('me-102','Strength of Materials- I','mech-1'),('me-103','Machine Drawing','mech-1'),('me-104','Applied Thermodynamics -I','mech-1');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachersubject`
--

DROP TABLE IF EXISTS `teachersubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachersubject` (
  `userid` varchar(45) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`,`subjectid`),
  KEY `fk32` (`subjectid`),
  CONSTRAINT `fk31` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `fk32` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachersubject`
--

LOCK TABLES `teachersubject` WRITE;
/*!40000 ALTER TABLE `teachersubject` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachersubject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testdata`
--

DROP TABLE IF EXISTS `testdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testdata` (
  `testid` varchar(45) NOT NULL,
  `questiono` int(11) NOT NULL,
  `question` varchar(45) NOT NULL,
  `opt1` varchar(45) NOT NULL,
  `opt2` varchar(45) NOT NULL,
  `opt3` varchar(45) DEFAULT NULL,
  `opt4` varchar(45) DEFAULT NULL,
  `answer` varchar(45) NOT NULL,
  PRIMARY KEY (`testid`),
  CONSTRAINT `fk24` FOREIGN KEY (`testid`) REFERENCES `testnotice` (`testid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdata`
--

LOCK TABLES `testdata` WRITE;
/*!40000 ALTER TABLE `testdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `testdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testfolder`
--

DROP TABLE IF EXISTS `testfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testfolder` (
  `userid` varchar(45) NOT NULL,
  `testid` varchar(45) NOT NULL,
  `marks` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`userid`,`testid`) USING BTREE,
  KEY `fk22_idx` (`testid`),
  CONSTRAINT `fk22` FOREIGN KEY (`testid`) REFERENCES `testdata` (`testid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk23` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testfolder`
--

LOCK TABLES `testfolder` WRITE;
/*!40000 ALTER TABLE `testfolder` DISABLE KEYS */;
/*!40000 ALTER TABLE `testfolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testnotice`
--

DROP TABLE IF EXISTS `testnotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testnotice` (
  `testid` varchar(45) NOT NULL,
  `testname` varchar(45) NOT NULL,
  `subjectid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `maximarks` int(11) NOT NULL,
  `dateoftest` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `maxitime` time NOT NULL,
  PRIMARY KEY (`testid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testnotice`
--

LOCK TABLES `testnotice` WRITE;
/*!40000 ALTER TABLE `testnotice` DISABLE KEYS */;
/*!40000 ALTER TABLE `testnotice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userattendance`
--

DROP TABLE IF EXISTS `userattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userattendance` (
  `lectid` varchar(45) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `lectsattended` int(11) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lectid`,`userid`) USING BTREE,
  KEY `fk25_idx` (`userid`),
  CONSTRAINT `fk25` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk26` FOREIGN KEY (`lectid`) REFERENCES `attendance` (`lectid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userattendance`
--

LOCK TABLES `userattendance` WRITE;
/*!40000 ALTER TABLE `userattendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `userattendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userbranch`
--

DROP TABLE IF EXISTS `userbranch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userbranch` (
  `userid` varchar(45) NOT NULL,
  `branchid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`),
  KEY `fk34` (`branchid`),
  CONSTRAINT `fk33` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `fk34` FOREIGN KEY (`branchid`) REFERENCES `branches` (`branchid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userbranch`
--

LOCK TABLES `userbranch` WRITE;
/*!40000 ALTER TABLE `userbranch` DISABLE KEYS */;
INSERT INTO `userbranch` VALUES ('aman','cse-1',1),('manik','cse-1',1),('ram','cse-1',1),('sham','cse-1',1),('virdi','mech-1',1);
/*!40000 ALTER TABLE `userbranch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userclasses`
--

DROP TABLE IF EXISTS `userclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userclasses` (
  `userid` varchar(45) NOT NULL,
  `classid` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `subjectid` varchar(45) NOT NULL,
  `branchid` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`,`classid`,`subjectid`,`branchid`) USING BTREE,
  KEY `fk11_idx` (`classid`),
  CONSTRAINT `fk10` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk11` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userclasses`
--

LOCK TABLES `userclasses` WRITE;
/*!40000 ALTER TABLE `userclasses` DISABLE KEYS */;
INSERT INTO `userclasses` VALUES ('aman','class1',1,'cs-101','cse-1'),('aman','class2',1,'cs-105','cse-1');
/*!40000 ALTER TABLE `userclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergrades`
--

DROP TABLE IF EXISTS `usergrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergrades` (
  `userid` varchar(45) NOT NULL,
  `domainid` varchar(45) NOT NULL,
  `gradeobtained` int(11) DEFAULT '0',
  `subjectid` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`,`subjectid`,`domainid`),
  KEY `fk30_idx` (`domainid`),
  CONSTRAINT `fk29` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk30` FOREIGN KEY (`domainid`) REFERENCES `gradedomains` (`domainid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergrades`
--

LOCK TABLES `usergrades` WRITE;
/*!40000 ALTER TABLE `usergrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `userid` varchar(45) NOT NULL,
  `groupid` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`,`groupid`),
  KEY `fk2_idx` (`groupid`),
  CONSTRAINT `fk1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
INSERT INTO `usergroups` VALUES ('aman','1002','1'),('aman','1003','1'),('aman','2001','1'),('amar','1004','1'),('amrinder','1004','1'),('amritpal','1003','1'),('amritpal','2001','1'),('ashu','1004','1'),('avinash','1003','1'),('avinash','2001','1'),('babbar','1004','1'),('bagga','1004','1'),('balkar','1004','1'),('bhaskar','1004','1'),('bhinder','1004','1'),('charna','1004','1'),('davinder','1004','1'),('deep','1004','1'),('gogi','1004','1'),('goldy','1004','1'),('gora','1004','1'),('gurdas','1004','1'),('happy','1004','1'),('harcharan','1004','1'),('harjeet','1003','1'),('harjeet','2001','1'),('harjinder','1004','1'),('harman','1004','1'),('harpreet','1003','1'),('harpreet','2001','1'),('heli','1004','1'),('hodcse','1002','1'),('hodcse','2001','1'),('hodme','1002','1'),('hodme','2002','1'),('ishu','1004','1'),('jagdish','1003','1'),('jagdish','2001','1'),('jaggi','1004','1'),('jaspal','1004','1'),('jassa','1004','1'),('jatinder','1004','1'),('jeevan','1004','1'),('jugal','1004','1'),('kaka','1004','1'),('kala','1004','1'),('kamal','1004','1'),('kevy','1004','1'),('kiran','1003','1'),('kiran','2001','1'),('kulwnat','1004','1'),('lakha','1004','1'),('lakhi','1004','1'),('major','1004','1'),('makhan','1004','1'),('manik','1001','1'),('manjeet','1004','1'),('midha','1004','1'),('mirtunjay','1004','1'),('narinder','1004','1'),('navneet','1003','1'),('navneet','2001','1'),('nikhil','1004','1'),('nikka','1004','1'),('pamma','1004','1'),('partap','1003','1'),('partap','2002','1'),('parteek','1004','1'),('prakhar','1004','1'),('prince','1003','1'),('prince','2001','1'),('rajdavinder','1003','1'),('rajdavinder','2001','1'),('rajesh','1004','1'),('rajiv','1003','1'),('rajiv','2001','1'),('rajnikant','1004','1'),('rajveer','1003','1'),('rajveer','2002','1'),('ram','1001','1'),('ranveer','1004','1'),('roomi','1004','1'),('root','1001','1'),('sam','1004','1'),('sampooran','1004','1'),('satnam','1004','1'),('saudagar','1004','1'),('sewak','1004','1'),('sham','1001','1'),('soma','1004','1'),('sukha','1004','1'),('sukhjot','1004','1'),('taranjeet','1003','1'),('taranjeet','2001','1'),('vinay','1003','1'),('vinay','2001','1'),('virdi','1003','1'),('yadwinder','1003','1'),('yadwinder','2002','1');
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('aman','aman',1),('amar','amar',1),('amrinder','amrinder',1),('amritpal','amritpal',1),('ashu','ashu',1),('avinash','avinash',1),('babbar','babbar',1),('bagga','bagga',1),('balkar','balkar',1),('bhaskar','bhaskar',1),('bhinder','bhinder',1),('charna','charna',1),('davinder','davinder',1),('deep','deep',1),('gogi','gogi',1),('goldy','goldy',1),('gora','gora',1),('gurdas','gurdas',1),('happy','happy',1),('harcharan','harcharan',1),('harjeet','harjeet',1),('harjinder','harjinder',1),('harman','haman',1),('harpreet','harpreet',1),('heli','heli',1),('hodcse','hodcse',1),('hodme','hodme',1),('ishu','ishu',1),('jagdish','jagdish',1),('jaggi','jaggi',1),('jaspal','jaspal',1),('jassa','jassa',1),('jatinder','jatinder',1),('jeevan','jeevan',1),('jugal','jugal',1),('kaka','kaka',1),('kala','kala',1),('kamal','kamal',1),('kevy','kevy',1),('kiran','kiran',1),('kulwnat','kulwnat',1),('lakha','lakha',1),('lakhi','lakhi',1),('major','major',1),('makhan','makhan',1),('manik','manik',1),('manjeet','manjeet',1),('midha','midha',1),('mirtunjay','mirtunjay',1),('narinder','narinder',1),('navneet','navneet',1),('nikhil','nikhil',1),('nikka','nikka',1),('pamma','pamma',1),('partap','partap',1),('parteek','parteek',1),('prakhar','prakhar',1),('prince','prince',1),('rajdavinder','rajdavinder',1),('rajesh','rajesh',1),('rajiv','rajiv',1),('rajnikant','rajnikant',1),('rajveer','rajveer',1),('ram','ram',1),('ranveer','ranveer',1),('roomi','roomi',1),('root','redhat',1),('sam','sam',1),('sampooran','sampooran',1),('satnam','satnam',1),('saudagar','saudagar',1),('sewak','sewak',1),('sham','sham',1),('soma','soma',1),('sukha','sukha',1),('sukhjot','sukhjot',1),('taranjeet','taranjeet',1),('vinay','vinay',1),('virdi','virdi',1),('yadwinder','yadwinder',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-29 14:31:10
