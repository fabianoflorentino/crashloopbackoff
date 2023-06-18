-- BEGIN: DO NOT EDIT
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
SET NAMES utf8mb4;
SET @DATABASE_NAME = "crashloopbackoff";
SET @USERNAME = "crashloopbackoff";
-- END: DO NOT EDIT

-- EDIT DATABASE NAMES HERE
SET @DATABASE_NAME_DEVELOPMENT = CONCAT(@DATABASE_NAME, "_development");
SET @DATABASE_NAME_TEST = CONCAT(@DATABASE_NAME, "_test");

-- CREATE DATABASE IF NOT EXISTSS
SET @create_database_development = CONCAT("CREATE DATABASE IF NOT EXISTS ", @DATABASE_NAME_DEVELOPMENT, " CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;");
SET @create_database_test = CONCAT("CREATE DATABASE IF NOT EXISTS ", @DATABASE_NAME_TEST, " CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;");
SET @create_database_production = CONCAT("CREATE DATABASE IF NOT EXISTS ", @DATABASE_NAME, " CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;");

PREPARE create_database_development FROM @create_database_development;
PREPARE create_database_test FROM @create_database_test;
PREPARE create_database_production FROM @create_database_production;

EXECUTE create_database_development;
EXECUTE create_database_test;
EXECUTE create_database_production;

DEALLOCATE PREPARE create_database_development;
DEALLOCATE PREPARE create_database_test;
DEALLOCATE PREPARE create_database_production;

-- PERMISSIONS
SET @grant_development = CONCAT("GRANT ALL PRIVILEGES ON ", @DATABASE_NAME_DEVELOPMENT, ".* TO '", @USERNAME, "'@'%';");
SET @grant_test = CONCAT("GRANT ALL PRIVILEGES ON ", @DATABASE_NAME_TEST, ".* TO '", @USERNAME, "'@'%';");
SET @grant_production = CONCAT("GRANT ALL PRIVILEGES ON ", @DATABASE_NAME, ".* TO '", @USERNAME, "'@'%';");

PREPARE grant_development FROM @grant_development;
PREPARE grant_test FROM @grant_test;
PREPARE grant_production FROM @grant_production;

EXECUTE grant_development;
EXECUTE grant_test;
EXECUTE grant_production;

DEALLOCATE PREPARE grant_development;
DEALLOCATE PREPARE grant_test;
DEALLOCATE PREPARE grant_production;

FLUSH PRIVILEGES;
