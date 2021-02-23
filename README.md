# Bookmark Manager

## User Stories
```
As a user
In order to access my favourite site quickly
I want to display a list of my bookmarks

As a user
In order to save time 
I want to be able to save a website with a bookmark
```


## Domain Modelling
![Domain model](https://github.com/peter-james-allen/bookmark_manager/blob/main/images/Screenshot%202021-02-22%20at%2014.49.02.png)

![Object model](https://github.com/peter-james-allen/bookmark_manager/blob/main/images/Screenshot%202021-02-22%20at%2014.39.38.png)

## How to run the database
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql
5. Create the database using the psql command CREATE DATABASE bookmark_manager_test;
6. Connect to the database using the pqsl command \c bookmark_manager_test;
7. Run the query we have saved in the file 01_create_bookmarks_table.sql
