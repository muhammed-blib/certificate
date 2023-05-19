const fs = require("fs");
const path = require("path");

const filePath = path.join(__dirname, "example.txt");
const backupPath = path.join(__dirname, "backup", "example.txt");

// check if the backup folder exists, and create it if it doesn't
if (!fs.existsSync(path.join(__dirname, "backup"))) {
  fs.mkdirSync(path.join(__dirname, "backup"));
}

// function to create a backup of the file
function createBackup() {
  fs.copyFileSync(filePath, backupPath);
  console.log("Backup created!");
}

// watch for changes to the file
fs.watch(filePath, (eventType, filename) => {
  if (filename && eventType === "change") {
    console.log(`${filename} changed!`);
    createBackup();
  }
});

// handle FileNotFound exception
fs.access(filePath, fs.constants.F_OK, (err) => {
  if (err) {
    console.error("File not found!");
  } else {
    console.log(`Watching ${filePath} for changes...`);
  }
});
