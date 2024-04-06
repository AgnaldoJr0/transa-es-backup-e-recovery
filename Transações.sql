use ecommerce;
show tables;

SET SQL_SAFE_UPDATES = 0;

SET autocommit = 0;

start transaction;

update clients set Fname = 'Josué' WHERE Fname = 'Velma';

update clients set CPF = 40293851234 WHERE cpf = 36478345636 ;

commit;

SET SQL_SAFE_UPDATES = 1;

set autocommit = 1;

 select * from clients;
 
DELIMITER //

CREATE PROCEDURE procedure1()
BEGIN
    DECLARE erro BOOLEAN DEFAULT FALSE;

    SET autocommit=0;

    START TRANSACTION;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = TRUE;

        insert into supplier(SocialName, CNPJ, contact) values
        ('Tech Juvent&Ciris',742813842671108,'11032452949');

        IF erro THEN
            ROLLBACK;
        ELSE
            COMMIT;
        END IF;
    END;

    SET autocommit=1;
END //

DELIMITER ;

 select * from supplier;