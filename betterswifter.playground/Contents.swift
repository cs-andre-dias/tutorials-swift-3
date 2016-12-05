//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Extension

// Ex.: Square a number
// OK version

func square(x: Int) -> Int {
    return x * x
}

var squaredOfFive = square(x: 5)

square(x: squaredOfFive)

// Better Version

extension Int {
    var square: Int { return self * self }
}

5.square

5.square.square.square

class example {
    var printExample = "this is a example"
}

extension example {
    
    func addOtherExample() -> String {
        return "Other Example"
    }
}


var trueExample = example()

trueExample.printExample
trueExample.addOtherExample()


// Generics 


// Bad version

var stringArray = ["Bob", "Bobby", "SangJoon"]

var intArray = [1, 2, 3, 4]

var doubleArray = [1.0, 2.0, 3.0]

func printStringArray(a: [String]) { for s in a { print(s) } }

func printIntArray(a: [Int]) { for s in a { print(s) } }

func printdoubleArray(a: [Double]) { for s in a { print(s) } }


// Awesome version

func printElementFromArray<T>(a: [T]) {
    for element in a {
        print(element)
    }
}

printElementFromArray(a: stringArray)
printElementFromArray(a: intArray)
printElementFromArray(a: doubleArray)

struct GenericArray<T> {
    var items = [T]()
    
    mutating func push(item: T) {
        items.append(item)
    }
}

var array = GenericArray(items: stringArray)
array.push(item: "andre")
array.items




// For loop vs while loop 

//Ok code

var i = 0

while 5 > i {
    print("count")
    i += 1
}

//Better version

for _ in 1...5 { print("Count")}


// Optional Unwrapping
// guard let vs if let

var myUserName: Double?
var myPassWord: Double?

func userLogIn() {
    if let username = myUserName {
        if let password = myPassWord {
            print("Welcome \(username)")
        }
    }
}

//better code

func userlogIn() {
    guard let username = myUserName, let password = myPassWord
    else { return }
    print("Welcome \(username)")
}

//Computed Property vs function
// shit code

func getDiameter(radius: Double) -> Double { return radius * 2 }

func getRadius(diameter: Double) -> Double { return diameter  / 2 }

getDiameter(radius: 20)
getRadius(diameter: 300)

// Good code

var radius: Double = 10

var diameter: Double {
    get { return radius * 2 }
    set { radius = newValue / 2 }
}

radius
diameter

diameter = 5000
radius

//Enum to Type Safe
//Simply bad code
var person = "Adult"

switch person {
    case "Adult": print("Pay $7")
    case "Child": print("Pay $7")
    case "Senior": print("Pay $7")
    default: print("You alive, bruh?")
}

// Beatiful Code

enum People {
    case adult
    case child
    case senior
}

var persoN = People.adult

switch persoN {
    case .adult: print("Pay $7")
    case .child: print("Pay $3")
    case .senior: print("Pay $4")
}


// Nil Coalescing
//Long Code

var userChosenColor: String?
var defaultColor = "Red"
var colorToUse = ""

if let Color =  userChosenColor {
    colorToUse = Color
}else{
    colorToUse = defaultColor
}

// Concise

var colortoUse = userChosenColor ?? defaultColor

//Conditional Coalescing
//simply Verbose

var currentHeight = 185
var hasSpikyHair = true
var finalHeight = 0

if hasSpikyHair {
    finalHeight = currentHeight + 5
}else{
    finalHeight = currentHeight
}

//Lovely code
/*finalheight vai ser igual a currentheight mais 5
se hasspikyhair for true, se nao for vai ser igual a currentheight
*/
finalHeight = currentHeight + (hasSpikyHair ? 5 : 0)


//functional way
//imperative a.k.a boring

var newEvens = [Int]()

for i in 1...10 {
    if i % 2 == 0 {
        newEvens.append(i)
    }
}
print(newEvens)

//Declarative

var evens = Array(1...10).filter { $0 % 2 == 0 }
print(evens)


//Closure vs Func

func sum(x: Int, y:Int) -> Int {
    return x + y
}

var result = sum(x: 5, y: 6)

//Closure

var sumUsingClosure: (Int, Int) -> (Int) = {
    $0 + $1
}

sumUsingClosure(5, 6)


//Convenient Initializers
// Original Way
class Human {
    var finger: Int
    var toe: Int
    
    init(finger: Int, toe: Int){
        self.finger = finger
        self.toe = toe
    }
}

var elon = Human(finger: 10, toe: 10)
elon.finger
elon.toe

//Coller way

class Humano {
    var finger: Int
    var toe: Int
    
    init(finger: Int, toe: Int){
        self.finger = finger
        self.toe = toe
    }
    
    convenience init() {
        self.init(finger: 10, toe: 10)
    }
}

var bill = Humano()
bill.finger
bill.toe


//TypeCasting
//Upcasting

var likes = [123, 423, 243] as [Any]
var photos = ["Beach", "Girls", "Chill"] as [Any]

for like in likes {
    photos.append(like)
}

photos

//Downcasting

for i in photos {
    if let number = i as? Int {
        print(number)
    }
    
    if let string = i as? String{
        print(string)
    }
}


// switch vs if else

//Aweful code

var myAge = 20

if myAge >= 1 && myAge <= 7 {
    print("milk")
}else if myAge >= 9 && myAge <= 80 {
    print("beer")
}else if myAge >= 81 && myAge <= 150 {
    print("Water")
}else{
    print("You alive bro?")
}

//Beatiful code

switch myAge {
case 2...7:
    print("milk")
case 8...80:
    print("beer")
case 81...150:
    print("water")
default:
    print("You alive bro?")
}

//Function Custon Parameter

func getD(userOrigin: String, userDestination: String) {
    print("from \(userOrigin), to \(userDestination)")
}

getD(userOrigin: "brazil", userDestination: "germany")

func getDestination(from userOrigin: String, to userDestination: String){
    print("from \(userOrigin), to \(userDestination)")
}

getDestination(from: "Germany", to: "Thailand")

// Variadic Parameters

var total: Double = 0

func findTheMean(numbers: Double...) -> Double {
    for number in numbers { total += number }
    
    return total / Double(numbers.count)
}

findTheMean(numbers: 1, 2, 3, 5, 1.5, 40.5)
findTheMean(numbers: 100, 230, 410)


// Property Observers

var celsius = 0

func convertFToC(F: Double) -> Double {
    return (F - 32) * (5 / 9)
}

convertFToC(F: 300)

//willset & didset

var celsiuS: Double = 0

var fahrenheint: Double = 100 {
    willSet {
        print("You are about to change")
    }
    didSet {
        celsiuS = (fahrenheint - 32) * (5 / 9)
    }
}

fahrenheint = 300
celsiuS


//Subscript
//Normal way
class DatOfWeek {
    var days = ["Sun", "Mon", "Tue", "Wed", "Thru", "Fri", "Sat"]
}

var dayOfWeek = DatOfWeek()
dayOfWeek.days[0]


//Cooler way
class NewDayOfWeek {
    var days = ["Sun", "Mon", "Tue", "Wed", "Thru", "Fri", "Sat"]
    
    subscript(index: Int) -> String {
        return days[index]
    }
}

var newDayOfWeek = NewDayOfWeek()
newDayOfWeek[0]


