<h1 align="center">🚀SQL BOOTCAMP FINAL PROJECT</h1>

###

<h1 align="center">Database Design and Implementation Project Report</h1>
<h2 align="left"> Project Objective </h2>

<h4 align="left">The aim of this project is to develop the skills of relational database design and implementation. A game database was designed for this purpose. This database consists of six main tables: players, levels, characters, items, friends and character items, and logical relationships between these tables. </h4>

<h2 align="left"> Database Design </h2>
<h4 align="left"> The design of our database consists of the following tables: </h4>

<h4 align="left">
  
- Player Contains information about the players.
  
- Level: Contains information about the game levels. 
  
- Item: Contains information about the items in the game. 
  
- Friend: Contains information about players' friendship relationships. 
  
- Character: Contains information about players' characters. 
  
- Character_Item: Contains information about the items owned by the characters. </h4>

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/b969a305-ff24-465a-ade8-80c7415633bf)

<h4 align="left">Each table is designed for a specific purpose and has logical relationships between the tables. For example, the Character table is related to the Player, Level and Character_Item tables. This allows us to determine which player a character belongs to, what level it is and what items it has.</h4>

<h2 align="left"> Trigger </h2>
<h4 align="left"> Before adding data to the tables, trigger definitions were made first because there will be tables affected by data entry.</h4>

<h4 align="left"> A trigger that increases the user's friend_count when a friend is added to the Friend table.  </h4>

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/1b42d4b9-7238-40b7-b49a-c9d3b31a5cf7)

<h4 align="left"> A trigger that increments the item_count value from the Character table when data is added to the Character_item table. </h4>

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/f0eedf36-b1b3-4605-af2f-8ce38f1e2fb9)


<h2 align="left"> Data Entry </h2>

<h4 align="left"> For each table, the rand() function and loops are used to add the desired number of data. </h4>

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/f9a00d8c-4f72-4dbd-8d7b-3295fe612374)

<h4> For example, a data is added to the Character_Item table and since we created a trigger beforehand, the item_count value of the Character with the related character_id will also increase as a result of this addition.  </h4>

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/822edb57-5e84-4bdc-ae31-08b06453916b)


<h2 align="left"> Stored Procedure </h2>

<h4> A procedure that returns all characters of the requested Player</h4>

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/1700f111-b2c9-498d-ae3a-98a087db0736)

<h4> When running the procedure, we run the procedure by giving the desired player_id value. </h4>

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/409539d6-22e8-4171-8e7e-079c5cb68248)

<h4>And when executed, we can see the properties of all the characters of the Player whose player_id value we queried.</h4>

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/b7a53d0c-ebf0-4627-b366-f0524cab3c39)


<h2>View</h2>

<h4> We created the desired properties of the characters that each player in the database has as a view.</h4>

![image](https://github.com/sahinsalim/GitHubTests/assets/156147444/f06e0238-2544-4400-860e-9a46a2c57d73)

<h4>This way keeps 100.000 data in the view.</h4>

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/1d8ef882-9b2a-4557-83b9-44e975a85c26)


<h2> SQL Query Examples </h2>

<h4> Query1 : shows the highest level characters of the Player whose player_id is queried... </h4>

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/179063ad-9a12-41d8-871d-6f1fbe19240b)

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/e551cca7-b62f-4749-957c-58e5b3543622)

<h4>Query2 : Find the 3 characters with the highest level among all players.</h4>

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/d7912196-331a-4e82-954d-e3970dc16e1a)

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/9ebf27e2-e946-475a-835c-2e85ba89f4d7)


<h4> Query3 :The item with the highest strength value</h4>

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/d6ab8863-6022-4be9-aa88-41c9ba68185c)

<h3>Query4 : Player with the highest total_score </h4>

![image](https://github.com/sahinsalim/SQLFinalProject/assets/156147444/0b2015c1-8168-446a-9fbd-0950eef4fdff)

###
