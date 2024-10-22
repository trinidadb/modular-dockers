// db = db.getSiblingDB('my-db');

// db.createCollection("users");

db.users.insertOne({ name: "Trinidad", age: 26 });


/* Explanation of why only one line:

In MongoDB's shell or an initialization script, the "db" object refers to the currently active database. The db object is a global object automatically provided by the MongoDB shell (or MongoDB when running the init script). 
When you first start the MongoDB shell or an initialization script runs, the db object is set to the default database ("my-db" in this case").

db.getSiblingDB() is a MongoDB shell method that is used to switch to another database, not to create one. 
In MongoDB, databases are not explicitly created when you use this function. Instead, a database is created implicitly when you first write data (such as inserting a document) into it.
This command switches the context to the specified database, meaning all the subsequent commands in the script (such as inserting data or creating collections) will be executed in that database.
If no data is inserted into it, MongoDB will not create it
A MongoDB database is created automatically when you first insert data into it.
The same thing happens with collections, you don't have to explicitly create them.
*/
