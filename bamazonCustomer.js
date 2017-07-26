var mysql = require("mysql");
var inquirer = require("inquirer");
var colors = require('colors');

// create the connection information for the sql database
var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,

    // Your username
    user: "root",

    // Your password
    password: "",
    database: "bamazon_DB"
});

// connect to the mysql server and sql database
connection.connect(function(err) {
    if (err) throw err;
    console.log("");
});

connection.query("SELECT * FROM products", function(err, res) {

    console.log('======================_.~"~._.~"~._.~Welcome to BAMazon~._.~"~._.~"~._============================='.rainbow)
    console.log("");
    console.log("");

    for (var i = 0; i < res.length; i++) {
        console.log("id: " + res[i].ItemID + " | " + "product: " + res[i].product_name + " | " + "department: " + res[i].department_name + " | " + "price: " + res[i].price + " | " + "Qty: " + res[i].stock_quantity);
        console.log('--------------------------------------------------------------------------------------------------')
    }
    console.log("");
    start();
});



var start = function() {

    inquirer.prompt([{
            name: "id",
            type: "input",
            message: "Which ID of the product would you like to buy?".green,
            validate: function(value) {
                if (isNaN(value) === false && value <= 10) {
                    return true;
                } else {
                    return false;
                }
            }
        }, {


        type: "text",
        message: "Input how many of that product would you like to order.",
        name: "Qty",
        validate: function(val){
            return (!isNaN(val) && parseInt(val) > 0)
        }
    }
    ]).then(function(answer) {
            var ItemInt = parseInt(answer.Qty);
                //Queries the database
                connection.query("SELECT * FROM products WHERE ?", { ItemID: answer.id }, function(err, data) { 
                    if (err) throw err;
                    //Checks if sufficient quantity exists
                    if (data[0].stock_quantity < ItemInt) {
                       console.log("We're sorry, that Item is currently out of stock\n");
                       console.log("Please choose another Product\n");
                       start(); 
                    } else {
                        //if quantity exists updates database
                        var updateQty = data[0].stock_quantity - ItemInt;
                        var totalPrice = data[0].price * ItemInt;
                        connection.query('UPDATE products SET stock_quantity = ? WHERE ItemID = ?', [updateQty, answer.Item], function(err, results) {
                        if(err) {
                            throw err;
                        } else {
                        console.log("Purchase successfull!\n");
                        console.log("Your total cost is: $ " + totalPrice);
                        //Asks the buyer if they would like to continue
                        inquirer.prompt({
                            name: "buyMore",
                            type: "confirm",
                            message: "Would you like to buy another Product?",
                        }).then(function(answer) {
                            if (answer.buyMore === true) {
                                start();
                            } else {
                                console.log("Thank your for shopping with Bamazon!");
                                connection.end();
                            }
                        });
                        }
                    });
                }               
            });
        });
    };



//         var query = "SELECT product_name, stock_quantity, price FROM product WHERE ?"
//         connection.query(query, { id: answer.id }, function(err, res) {

//             if (res[0].stock_quantity >= answer.quantity) {

//                 var dept = res[0].product_name;
//                 var adjustedQuantity = res[0].stock_quantity - answer.quantity;
//                 var purchasePrice = (answer.quantity * res[0].Price).toFixed(2);

//                 var query2 = " UPDATE products SET ? WHERE ?";
//                 connection.query(query2, [{ stock_quantity: adjustedQuantity }, { id: answer.id }],

//                     function(err, res) {

//                         if (err) throw err;
//                         console.log("Success! Your total is $".red.bold + purchasePrice.red.bold + "\nYour item(s) will be shipped to you in 3-5 business days.".bold);

//                     });



//                 var query3 = "SELECT TotalSales FROM products WHERE ?"
//                 connection.query(query3, { product_name: dept }, function(err, data) {

//                     if (err) throw err

//                     var currentSales = data[0].TotalSales;
//                     var adjustedSales = currentSales + parseFloat(purchasePrice);





//                     var query4 = "UPDATE product SET ? WHERE ? "
//                     connection.query(query4, [{ TotalSales: adjustedSales }, { product_name: products }], function(err, data) {

//                         if (err) throw err
//                         start();


//                     })

//                 })

//             } else {
//                 console.log("Sorry, there are ".bold + res[0].stock_quantity + " units in stock for this product".bold);
//                 console.log("\n-----------------------------------------\n");

//                 start();

//             }

            

//         })

//     })
// }