USE `j&tcarrentals`;

CREATE TABLE Users (
  userID INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255),
  email VARCHAR(255) UNIQUE NOT NULL,
  address VARCHAR(255),
  phoneNumber VARCHAR(255) UNIQUE,
  age INT,
  accountType VARCHAR(255) NOT NULL,
  favorites INT,
  creationDate DATETIME NOT NULL
);

CREATE TABLE Vehicles (
  vehicleID INT AUTO_INCREMENT PRIMARY KEY,
  make VARCHAR(255) NOT NULL,
  model VARCHAR(255) NOT NULL,
  `year` YEAR NOT NULL,
  color VARCHAR(255) NOT NULL,
  `condition` VARCHAR(255) NOT NULL,
  `description` TEXT,
  price DECIMAL(10, 2) NOT NULL,
  reviewAverage DECIMAL(3, 2),
  isAvailable BOOLEAN NOT NULL
);

CREATE TABLE Payment (
  paymentID INT AUTO_INCREMENT PRIMARY KEY,
  userID INT NOT NULL,
  nameOnCard VARCHAR(255) NOT NULL,
  cardNumber VARCHAR(255) NOT NULL,
  expDate DATE NOT NULL,
  securityCode VARCHAR(255) NOT NULL,
  FOREIGN KEY (userID) REFERENCES Users(userID)
);

CREATE TABLE Rental (
  rentalID INT AUTO_INCREMENT PRIMARY KEY,
  vehicleID INT NOT NULL,
  initialCondition VARCHAR(255) NOT NULL,
  initialDate DATETIME NOT NULL,
  finalDate DATETIME,
  totalPrice DECIMAL(10, 2) NOT NULL,
  isReturned BOOLEAN NOT NULL,
  finalCondition VARCHAR(255),
  userID INT NOT NULL,
  paymentID INT NOT NULL,
  isApproved BOOLEAN,
  FOREIGN KEY (vehicleID) REFERENCES Vehicles(vehicleID),
  FOREIGN KEY (userID) REFERENCES Users(userID),
  FOREIGN KEY (paymentID) REFERENCES Payment(paymentID)
);



CREATE TABLE Reviews (
  rentalID INT NOT NULL,
  vehicleID INT NOT NULL,
  rating DECIMAL(2, 1) NOT NULL,
  feedback TEXT,
  PRIMARY KEY (rentalID, vehicleID),
  FOREIGN KEY (rentalID) REFERENCES Rental(rentalID),
  FOREIGN KEY (vehicleID) REFERENCES Vehicles(vehicleID)
);

CREATE TABLE Tickets (
  ticketID INT AUTO_INCREMENT PRIMARY KEY,
  userID INT NOT NULL,
  issue TEXT NOT NULL,
  rentalID INT,
  paymentID INT,
  FOREIGN KEY (userID) REFERENCES Users(userID),
  FOREIGN KEY (rentalID) REFERENCES Rental(rentalID),
  FOREIGN KEY (paymentID) REFERENCES Payment(paymentID)
);
ALTER TABLE Users ADD CONSTRAINT fk_favorites FOREIGN KEY (favorites) REFERENCES Vehicles(vehicleID);

show tables from `j&tcarrentals`



