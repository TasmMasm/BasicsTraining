//          МАССИВЫ [] - упорядочная коллекция только одного типа

import Foundation


let constArraw = ["a", "b", "c", "d"]
//let arraw: Array<String> = ["a", "b", "c", "d"]
//let arraw: [String] = ["a", "b", "c", "d"]

// количество элементов в массиве: .count
constArraw.count

// иницилизация массива без элементов
var array = [String]()
// так как это массив строк добавлять можно только строки!
// можно проверить на наличие элементов:
if array.count == 0 {
    print("arraw is emty")
}
//  или используя оператор .isEmpty
if array.isEmpty {
    print("arraw is emty")
}
// сложение массивов:
array += constArraw
//array += constArraw

// добавление строки в массив (в конец массива будет добавление) или при помощи команды .append:
array += ["e"]
array.append("f")

// в языке SWIFT массив (как и строки, интенжеры и др.) имеет value type, т.е. когда одному массиву присваивается другой массив (=), происходит копирование, а не указание на ссылку, как в других языках программирования

var array2 = array
array
array2
// array2[0] - доступ к элементу массива по номеру индекса этого массива или к ряду элементов в массиве: array [1...4]
array2[0] = "1"

array
array2

//array [1...4] = ["0"]
array

// можно вставить в массив элемент ("-", at: 3), где "-" это элемент, а at: 3 - перед каким элементов вставка
array.insert("-", at: 3)
// можно убрать элемент(ы) из массива все/часть/первый/последний: .remove
array.remove(at: 3)
array

// [Int](repeatElement(_, count: _))   -  создание массива одного значения с большим количетвом элементов
let test = [Int](repeatElement(100, count: 10))

// примеры суммирования элементов (Int) в массиве:
let money = [100, 1, 5, 20, 1, 50, 1, 1, 20, 1]

var sum = 0
for i in 0..<money.count {
    print("index = \(i) value = \(money[i])")
    sum += money[i]
}
sum

sum = 0
var index = 0
for value in money {
    print("index = \(index) value = \(value)")
    sum += value
    index += 1
}

sum
sum = 0
for i in money {
    print("i = \(i)")
    sum += i
}
sum

// .enumerated() - возвращение тюпла: индекс: "значение"
sum = 0
for (index, value) in money.enumerated() {
    print("index = \(index) value = \(value)")
    sum += value
}
sum

// самоизучение https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html
//var shoppingList: [String] = ["Eggs", "Milk"]
var shoppingList = ["Eggs", "Milk"]

print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
shoppingList

shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList

shoppingList.insert("Maple Syrup", at: 0)
shoppingList

let mapleSyrup = shoppingList.remove(at: 0)
shoppingList

firstItem = shoppingList[0]
shoppingList

let apples = shoppingList.removeLast()
shoppingList

for item in shoppingList {
    print(item)
}
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

// ДЗ
// Задание №1 создать массив в который будет входить 12 месяцев (вернее 12 элементов с количеством дней в каждом месяце) и вывести количество дней в месяцах без названия месяцов
// Задание №2 создать тот же массив, в котором будут имена месяцев, затем в цикле for вывести название месяца из одного массива и количество дней из другого массива
// Задание №3 вместо 2-ч предыдущих массивов создать третий - это массив тюплов (параметрезированный), в котором 1-й параметр: название месяца, 2-й параметр: количество дней в месяце и выполнить предыдущее задание используя массив тюплов, один массив
// Задание №4 вывести количество дней в месяце в обрaтном порядке
// Задание №5 посчитать в первом массиве количество дней до дня рождения (18.05)
// Задание №6 создать массив опциональных интенжеров и заполнили константами, которые создавали в Урок.4 и в цикле вывести сумму 3-мя способами (Optional Binding, forced unwrapping и ??
// Задание №7 создать строку алфавит a...z, пройти в цикле по порядку по каждому character и создать пустой массив строк, и когда проходили по каждому character, переводили его в строку и добавляли в массив пустой, при этом добавляли элементы таким образом, чтобы на выходе получился массив строк, но алфавит от z...a

/*
var months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

var months2 = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

months.count
months2.count

for numberOfDays in 0..<months.count {
    print("index = \(numberOfDays) numberOfDays = \(months[numberOfDays])")
}

for monthName in 0..<months2.count {
    print("index = \(monthName) monthName = \(months2[monthName])")
}

for index in 0..<months.count {
    print("\(months2[index]) = \(months[index])")
}
print("-------")
for index in 0..<months.count {
    print("\(months2[(months.count - 1) - index]) = \(months[(months.count - 1) - index])")
}

// второй способ:

months2 = months2.reversed()
months = months.reversed()

print("-------")

for index in 0..<months.count {
    print("\(months2[index]) = \(months[index])")
}


let tupleMonths = (January:31, February:28, March:31, April:30, May:31, June:30, July:31, August:31, September:30, October:31, November:30, December:31)

let arrayOfTuple = [("January", 31), ("February", 28), ("March", 31),("April", 30),("May", 31),("June", 30),("July", 31),("August", 31),("September", 30),("October", 31),("November", 30),("December", 31)]

print("-------")

for (index, value) in arrayOfTuple.enumerated() {
    print("index = \(index) month and number of days = \(value)")
}
*/

var months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

var months2 = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
 
let birthday = 18
let month3 = "May"

print("-------")
/*
var sum2 = 0
var index2 = 0
for i in 0..<months2.count {
        if months2[i] == month3 {
            index2 = i
            for i2 in 0..<index2 {
                sum2 = sum2 + months[i2]
            }
    }
}
sum2
var sumTotal = sum2 + birthday
 */


print("<---------->")
var sum2 = 0
var isTriggered = true
for i in 0..<months2.count {
    if months2[i] == month3 {
        print("isTriggered = false")
        isTriggered = false
    }
    if isTriggered {
        sum2 += months[i]
        print("sum2 += months[i]: \(sum2)")
    }
 
    print("sum2: \(sum2), i: \(i)")
}
sum2
var sumTotal = sum2 + birthday



/*
print("----------")
var sum3 = 0
for i in 0..<months2.count {
    if months2[i] == month3 {
        break
    }
    sum3 += months[i]
}

sum3
*/


//let lesson4 = ["12", "23d", "28", "abc", "45"]



    
    
