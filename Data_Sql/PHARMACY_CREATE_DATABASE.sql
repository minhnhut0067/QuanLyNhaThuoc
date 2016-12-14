-- Role: msolution

-- DROP ROLE msolution; Pass msolution
CREATE ROLE msolution LOGIN
ENCRYPTED PASSWORD 'md56785a8e9dbbe647823d555690133ed3a'
SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;
  
-- Database: ms_medical
-- DROP DATABASE ms_medical;
DROP DATABASE ms_root;
CREATE DATABASE ms_root WITH OWNER = msolution ENCODING = 'UTF8'
-- TABLESPACE = pg_default LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252'
TABLESPACE = pg_default LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8'
CONNECTION LIMIT = -1;

DROP DATABASE ms_9999999999;
CREATE DATABASE ms_9999999999 WITH OWNER = msolution ENCODING = 'UTF8'
-- TABLESPACE = pg_default LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252'
TABLESPACE = pg_default LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8'
CONNECTION LIMIT = -1;

CREATE public database link root connect to msolution identified by 'msolution' using libpq 'host=172.168.1.244 port=5434 dbname=ms_root';
drop public database link root;