import UIKit
// comment
/* multiline comments
var greeting = "Hello, playground"

//variables
var name: String = "Get"
var age: Int = 18
var isMale: Bool = true
var height: Double = 1.80
print(name, age, isMale, height)

//constants
let pi: Double = 3.14
let maxInt: Int = Int.max
let minInt: Int = Int.min
print(pi, maxInt, minInt)

let myName = "Thewa Laokasikan"
let id = "6614110014"
let dept = "ITMI"
print("My name is \(myName), my id is \(id), and my department is \(dept).")
*/


let std = ["Name": "Thewa", "Surname": "Laokasikan","ID": "6614110014", "Department": "ITMI", "GPA": "3.54", "University": "MUT"]
print("I am \(std["Name"]!) \(std["Surname"]!), ID: \(std["ID"]!)\nI study \(std["Department"]!) at \(std["University"]!)\nMy GPA is \(std["GPA"]!)")
