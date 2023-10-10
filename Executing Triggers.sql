CREATE TABLE  trigger_test (
    message VARCHAR (100)
);

-- Has to be done in terminal
DELIMITER $$
CREATE 
    TRIGGER my_trigger BEFORE INSERT
    ON  employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES ('added new employee');
    END$$
        DELIMITER ;

INSERT INTO employee
VALUES (109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);

SELECT * FROM trigger_test;

--Another trigger (NEW refers to new row)
DELIMTER $$
CREATE
    TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES(NEW.first_name);
    END $$
DELIMITER ;

INSERT INTO employee
VALUES(110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);

-- A more complexed trigger
-- You can swap 'BEFORE' with 'AFTER' and 'INSERT' with 'DELETE'
DELIMTER $$
CREATE
    TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        IF New.sex = 'M' THEN
            INSERT INTO trigger_test VALUES ('added male employee');
        ELSEIF NEW.sex = 'F' THEN   
            INSERT INTO trigger_test VALUES ('added female');
        ELSE
            INSERT INTO trigger_test VALUES('added other employee');
        END IF;
    END $$
DELIMITER ;

INSERT INTO employee
VALUES (110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);
