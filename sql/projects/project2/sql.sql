CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL
);

CREATE TABLE Roles (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL
);

CREATE TABLE UserAccounts (
    UserAccountID INT PRIMARY KEY,
    UserID INT NOT NULL,
    RoleID INT NOT NULL,
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

INSERT INTO Users (UserID, UserName, Email)
VALUES (1, 'John Doe', 'johndoe@gmail.com'),
       (2, 'Jane Smith', 'janesmith@yahoo.com');


INSERT INTO Roles (RoleID, RoleName)
VALUES (1, 'Admin'),
       (2, 'User');

INSERT INTO UserAccounts (UserAccountID, UserID, RoleID, Status)
VALUES (1, 1, 1, 'Active'),
       (2, 2, 2, 'Inactive');


DELETE FROM Users;
DELETE FROM Roles;
DELETE FROM UserAccounts;
