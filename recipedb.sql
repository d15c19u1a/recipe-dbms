-- Description: A normalized MySQL schema for managing recipes of foods and beverages

USE recipedb;

-- 0. Drop tables if they exist (in order to avoid dependency issues)
DROP TABLE IF EXISTS RecipeTools, RecipeCategories, RecipeIngredients, Tools, Categories, Recipes, Ingredients, Users;

-- 1. Users (recipe authors)
CREATE TABLE Users (
    UserID      INT          PRIMARY KEY AUTO_INCREMENT,
    Username    VARCHAR(50)  NOT NULL UNIQUE,
    Email       VARCHAR(100) NOT NULL UNIQUE,
    FullName    VARCHAR(100),
    JoinDate    DATETIME     NOT NULL DEFAULT NOW()
);

-- 2. Recipes
CREATE TABLE Recipes (
    RecipeID    INT           PRIMARY KEY AUTO_INCREMENT,
    Title       VARCHAR(150)  NOT NULL,
    Description TEXT,
    PrepTime    INT           NOT NULL COMMENT 'in minutes',
    CookTime    INT           NOT NULL COMMENT 'in minutes',
    Servings    INT           NOT NULL,
    CreatedBy   INT           NOT NULL,
    CreatedAt   DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserID)
);

-- 3. Ingredients
CREATE TABLE Ingredients (
    IngredientID INT          PRIMARY KEY AUTO_INCREMENT,
    Name         VARCHAR(100) NOT NULL UNIQUE,
    Description  TEXT
);

-- 4. RecipeIngredients (M–M between Recipes and Ingredients)
CREATE TABLE RecipeIngredients (
    RecipeID      INT         NOT NULL,
    IngredientID  INT         NOT NULL,
    Quantity      DECIMAL(10,2) NOT NULL,
    Unit          ENUM('g','kg','ml','l','tsp','tbsp','cup','pcs') NOT NULL,
    PRIMARY KEY (RecipeID, IngredientID),
    FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID)
);

-- 5. Categories (e.g., 'Dessert', 'Beverage', 'Vegetarian')
CREATE TABLE Categories (
    CategoryID   INT          PRIMARY KEY AUTO_INCREMENT,
    Name         VARCHAR(50)  NOT NULL UNIQUE,
    Description  VARCHAR(255)
);

-- 6. RecipeCategories (M–M between Recipes and Categories)
CREATE TABLE RecipeCategories (
    RecipeID     INT          NOT NULL,
    CategoryID   INT          NOT NULL,
    PRIMARY KEY (RecipeID, CategoryID),
    FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- 7. Tools/Equipment (e.g., 'Oven', 'Blender')
CREATE TABLE Tools (
    ToolID       INT          PRIMARY KEY AUTO_INCREMENT,
    Name         VARCHAR(100) NOT NULL UNIQUE,
    Description  VARCHAR(255)
);

-- 8. RecipeTools (M–M between Recipes and Tools)
CREATE TABLE RecipeTools (
    RecipeID     INT          NOT NULL,
    ToolID       INT          NOT NULL,
    PRIMARY KEY (RecipeID, ToolID),
    FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
    FOREIGN KEY (ToolID) REFERENCES Tools(ToolID)
);
