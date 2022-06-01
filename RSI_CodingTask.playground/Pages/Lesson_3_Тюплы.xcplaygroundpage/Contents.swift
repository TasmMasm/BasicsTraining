// 3.ТЮПЛЫ Tuples ()

//let a = (1, "Hello", true, 2.4)
//let simpleTuple: (Int, String, Bool, Double) = (1, "Hello", true, 2.4)
let simpleTuple = (1, "Hello", true, 2.4)

// decompose (разложить) этого тюпла

let (number, greatings, check, decimal) = simpleTuple

number
greatings
check
decimal

// можно использовать undercode (_), если надо из тюпла использовать только одно значение: check2, здесь важны последовательность undercode и их количество!
let (_, _, check2, _) = simpleTuple
check2

// второй вариант decompose тюпла
simpleTuple.0
simpleTuple.1
simpleTuple.2
simpleTuple.3


var tuple = (index:1, phrase:"Hello", registred:true, latance:2.4)
tuple.0
tuple.1
tuple.2
tuple.3

tuple.index
tuple.phrase
tuple.registred
tuple.latance

// change tuple's value
tuple.index = 2

/*
// делать операции над тюплами типа сложения нельзя, можно только операцию присваивания (если они абсолютно одинаковые - количество, типы, имена/параметры)
let a = (x:1, y:2)
var b = (x:2, y:3)

b = a
b
*/

/*
let redColor = "red"
let greenColor = "green"
let blueColor = "blue"
// можно так записать:
 */
// let redColor = "red"; let greenColor = "green"; let blueColor = "blue"

// можно еще записать ввиде тюпла:
let (redColor, greenColor, blueColor) = ("red", "green", "blue")

redColor
greenColor
blueColor

let totalNumber = 5
let merchantName = "Alex"

print("\(totalNumber) \(merchantName)")
print((totalNumber, merchantName))
print(simpleTuple)
