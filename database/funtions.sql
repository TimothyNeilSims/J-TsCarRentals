DELIMITER //
CREATE PROCEDURE CreateAccount(
    IN _username VARCHAR(255),
    IN _password VARCHAR(255),
    IN _name VARCHAR(255),
    IN _age INT,
    IN _address VARCHAR(255),
    IN _phoneNumber VARCHAR(255),
    IN _email VARCHAR(255),
    IN _accountType VARCHAR(255)
)
BEGIN
    INSERT INTO Users (username, `password`, `name`, age, address, phoneNumber, email, accountType, creationDate)
    VALUES (_username, _password, _name, _age, _address, _phoneNumber, _email, _accountType, NOW());
END //
DELIMITER ;

CALL CreateAccount('admin', 'admin', 'admin', 25, '123 Admin Lane', '123-123-1234', 'admin@example.com', 'admin');
SELECT * FROM Users;

DELIMITER //
CREATE PROCEDURE ValidateUserLogin(
    IN _username VARCHAR(255),
    IN _password VARCHAR(255),
    OUT _isValid BOOLEAN
)
BEGIN
    SELECT EXISTS(SELECT 1 FROM Users WHERE username = _username AND `password` = _password) INTO _isValid;
END //
DELIMITER ;
