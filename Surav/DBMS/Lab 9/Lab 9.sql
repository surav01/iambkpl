-- no.1
CREATE USER "jon" IDENTIFIED BY "jon123";

-- no.2
GRANT ALL PRIVILEGES ON hr_db.* TO "jon";

-- no.3


-- no.4
CREATE USER "hazel" IDENTIFIED BY "hazel123";
CREATE USER "bob" IDENTIFIED BY "bob123";
CREATE USER "sam" IDENTIFIED BY "sam123";

-- no.5
GRANT ALL PRIVILEGES ON hr_db.* TO "sam";

-- no.6
GRANT SELECT ON hr_db.* TO "bob";

-- no.7
GRANT INSERT,UPDATE,DELETE ON hr_db.* TO "hazel";

-- no.8
SHOW GRANTS FOR "hazel";

-- no.9
REVOKE ALL PRIVILEGES ON hr_db.* FROM "jon";

-- no.10
DROP USER "jon";

GRANT ALL PRIVILEGES ON hr_db.* TO "bob";

FLUSH PRIVILEGES;

-- creating role



 