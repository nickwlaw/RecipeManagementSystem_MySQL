-- create and select the database
DROP DATABASE IF EXISTS rms;
CREATE DATABASE rms;
USE rms;

-- create the User table
CREATE TABLE User (
	ID					int					primary key			auto_increment,
    UserName			varchar(24)			not null			unique,
    Password			varchar(24)			not null,
    FirstName			varchar(50)			not null,
    LastName			varchar(50)			not null,
    IsActive			tinyint(1)			not null			default 1,
    IsAdmin				tinyint(1)			not null			default 0
);

-- create the Ingredient table
CREATE TABLE Ingredient (
	ID					int					primary key			auto_increment,
    Ingredient			varchar(24)			not null			unique
);

-- create the Recipe table
CREATE TABLE Recipe (
	ID					int					primary key			auto_increment,
    Name				varchar(24)			not null,
    UserID				int					not null,
    Description			varchar(255),
    DateCreated			datetime			not null			default current_timestamp,
    DateUpdated			datetime			not null			default current_timestamp on update current_timestamp,
    IsActive			tinyint(1)			not null			default 1,
    
    FOREIGN KEY (UserID) REFERENCES User (ID),
    UNIQUE KEY NAME_UID (Name, UserID)
);

-- create the Recipe Line Item table
CREATE TABLE RecipeLineItem (
	ID					int					primary key			auto_increment,
    RecipeID			int					not null,
    IngredientID		int					not null,
    Quantity			decimal(10, 2)		not null,
    Unit				varchar(10)			not null,
    
    FOREIGN KEY (RecipeID) REFERENCES Recipe (ID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredient (ID),
    UNIQUE KEY RID_IID (RecipeID, IngredientID)
);

-- create appication user and grant priviledges
CREATE USER IF NOT EXISTS 'rms_user'@'localhost'
IDENTIFIED BY 'rms_db_access';

GRANT SELECT, UPDATE, INSERT, CREATE, DELETE
ON rms.*
TO rms_user@localhost;