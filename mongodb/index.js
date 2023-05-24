const express = require("express");
const mongodb = require("mongodb");

const app = express();

// Create a MongoDB client
const client = new mongodb.MongoClient("mongodb://localhost:27017");


client.connect((err, db) => {
    if (err) {
        console.log(err);
        process.exit(1);
    }

    // Create a collection
    const collection = db.collection("collection");


    app.post("/create", (req, res) => {
        // Get the data from the request body
        const data = req.body;

        // Insert 
        collection.insertOne(data, (err, result) => {
            if (err) {
                console.log(err);
                res.status(500).send("Error creating document");
            } else {
                res.status(200).send("Document created successfully");
            }
        });
    });


    app.get("/read", (req, res) => {
        // Find all d
        collection.find({}, (err, results) => {
            if (err) {
                console.log(err);
                res.status(500).send("Error reading documents");
            } else {
                res.status(200).json(results);
            }
        });
    });

    // update
    app.put("/update", (req, res) => {

        const data = req.body;


        collection.updateOne({
            "name": data.name
        }, data, (err, result) => {
            if (err) {
                console.log(err);
                res.status(500).send("Error updating document");
            } else {
                res.status(200).send("Document updated successfully");
            }
        });
    });

    // delete
    app.delete("/delete", (req, res) => {

        const data = req.body;

        // Delete the document from the collection
        collection.deleteOne({
            "name": data.name
        }, (err, result) => {
            if (err) {
                console.log(err);
                res.status(500).send("Error deleting document");
            } else {
                res.status(200).send("Document deleted successfully");
            }
        });
    });


    app.listen(3000, () => {
        console.log("Server started on port 3000");
    });
});