const prompt = require("prompt");

const properties = [
  {
    name: "firstnumber",
    validator: /^[0-9]+$/,
    warning: "number should be only integer",
    message: "enter first number",
  },
  {
    name: "secondnumber",
    validator: /^[0-9]+$/,
    warning: "number should be only integer",
    message: "enter second number",
  },
  {
    name: "menu",
    validator: /^[a-zA-Z]+$/,
    message:
      "Select an option from the menu Add, Subtract, Multiply, Divide, Exit",
  },
];

prompt.start();

prompt.get(properties, function (err, result) {
  if (err) {
    return onErr(err);
  }
  console.log("Command-line input received:");
  num1 = parseInt(result.firstnumber);
  num2 = parseInt(result.secondnumber);
  men = result.menu;
  console.log(num1, num2, men);
  operate(num1, num2, men);
});

function onErr(err) {
  console.log(err);
  return 1;
}

function add(num1, num2) {
  return num1 + num2;
}

function subtract(num1, num2) {
  return num1 - num2;
}

function multiply(num1, num2) {
  return num1 * num2;
}

function divide(num1, num2) {
  if (num2 == 0) {
    return "Cannot divide by zero";
  } else {
    return num1 / num2;
  }
}
function exit() {
  return "exit";
}

function operate(num1, num2, menu) {
  switch (menu) {
    case "Add":
      return console.log("the sum is: ", add(num1, num2));
      break;
    case "Subtract":
      return console.log("the subtraction is: ", subtract(num1, num2));
      break;
    case "Multiply":
      return console.log("the multiplication is: ", multiply(num1, num2));
      break;
    case "Divide":
      return console.log("the division is: ", divide(num1, num2));
      break;
    case "Exit":
      return console.log(exit());
  }
}
