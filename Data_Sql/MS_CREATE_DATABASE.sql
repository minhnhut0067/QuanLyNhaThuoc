-- Role: msolution

-- DROP ROLE msolution; Pass msolution
CREATE ROLE msolution LOGIN
  ENCRYPTED PASSWORD 'md56785a8e9dbbe647823d555690133ed3a'
  SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;
  
-- Database: ms_medical
-- DROP DATABASE ms_medical;
CREATE DATABASE ms_root WITH OWNER = msolution ENCODING = 'UTF8'
TABLESPACE = pg_default LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252'
CONNECTION LIMIT = -1;

CREATE public database link meta connect to msolution identified by 'msolution' using libpq 'host=localhost port=5435 dbname=cm_meta';
drop public database link meta;