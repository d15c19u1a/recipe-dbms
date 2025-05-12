# 📖 Recipe Database Management System

## 📋 Description
A MySQL-based database schema for managing recipes of foods and beverages. The system tracks:
- Authors (Users)
- Recipes (titles, prep/cook times, servings)
- Ingredients and quantities per recipe
- Categories (e.g., Dessert, Beverage)
- Tools/equipment needed per recipe

## 🚀 Setup
1. Clone the repository into a folder on your computer:
   ```bash
   git clone https://github.com/d15c19u1a/recipes-dbms.git
2. Navigate to the repository folder
   - locate the 'recipes_db.sql' script
   - open the file and copy all its contents.

3. Open MySQL Workbench.

4. On the 'Navigator' panel, click on 'Schemas' tab. Then either:
   - Navigate to toolbar and click on "Create a new schema in the connected server"
   - Right click on empty part of the 'Navigator' panel, then select 'Create Schema'

5. Initiate schema creation and table creation
   - In the blank Name field, type the name "recipedb"
   - Click on "Apply" button. and wait until it's done.
   - A window titled 'Apply SQL Script to Database' will appear.
   - Line 1 contains the text "CREATE SCHEMA `recipedb` ;". Don't erase it, leave it as it is.
   - Paste the contents of the 'recipes_db.sql' script, on line 2
   - Click on "Apply" button. and wait until it's done.
   - In the next page, make sure there's a tick on the checkbox for 'Execute SQL Statements'
   - Click on "Finish" button. and wait until it's done.

6. Go back to the 'Navigator' panel, to confirm the created schema and tables. Either:
   - click on the icon that is on the far right of the 'SCHEMAS' label
   - right click on empty part of the 'Navigator' panel, then select 'Refresh All'

7. All Done. Database is ready.

🗺️ ERD

![recipes_erd](https://github.com/user-attachments/assets/2f33d134-6767-4505-8736-04f2b7016a63)

🧱 Built With
- MySQL 8.x
- dbdiagram.io for ERD visualization
