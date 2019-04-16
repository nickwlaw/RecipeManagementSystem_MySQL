USE rms;

INSERT INTO User (Username, Password, FirstName, LastName, IsAdmin)
VALUES ('SYSTEM', 'password', 'system', 'system', 1),
	   ('nickwlaw', 'password', 'Nicholas', 'Law', 1);
       
INSERT INTO Ingredient (Ingredient)
VALUES ('kosher salt'),
	   ('black peppercorn, ground'),
       ('italian parsley'),
       ('tarragon'),
       ('chervil'),
       ('chive'),
       ('chicken stock');
       
INSERT INTO Recipe (Name, UserID, Description)
VALUES ('Chicken Soup', 2, 'A simple chicken broth soup base with herbs'),
	   ('Fines Herbes', 2, 'Classic french fines herbes');
       
INSERT INTO RecipeLineItem (RecipeID, IngredientID, Quantity, Unit)
VALUES (1, 7, 1, 'quart'),
	   (1, 1, 50, 'grams'),
       (1, 2, 30, 'grams'),
       (1, 6, 3, 'ounces'),
       (2, 3, 1, 'part'),
       (2, 4, 1, 'part'),
       (2, 5, 1, 'part'),
       (2, 6, 1, 'part');