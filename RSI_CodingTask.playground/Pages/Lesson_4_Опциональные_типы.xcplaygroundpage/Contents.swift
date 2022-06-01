
// продажи
/*
50 + 20 = 70
10 - 10 = 0
0
*/

/*
 //server request
 is it Saturday?
 
 tru / false / nil
 */

/*
 Петя в кармане 5 яблок - 5
 
 Вася нет карманов
 */

var apples: Int? = 5

//apples = nil
 
if apples == nil {
    print("nil apples")
} else {
    //print(apples)
    
    //apples = apples + 2 - так нельзя, если apples = nil
    
//присвоение значения опционалу: apples! - forced unwrapping (развертывание)силовое/вынужденное преобразование
    let a = apples! + 2
}

// Optional Binding (связывание Optional)
if var number = apples {
    number = number + 2
} else {
    print("nil apples")
}


let age = "60"

//Int(age)

if Int(age) != nil {
    let ageNumber = Int(age)!
}

if let ageNumber = Int(age) {
    ageNumber
}

//Int
//Int?
//Int! - не явно развернутый опцинал
var apples2: Int! = nil
apples2 = 2

// assert - утверждать
assert(apples2 != nil, "oh no!!!")

apples2 = apples2 + 5

// Домашнее задание
// №1:  сделать 5 констант - строковые константы и одни из них будут состоять только из цифр, а другие цифры/буквы и просто буквы
// Задание: найти сумму всех констант, (не все могут быть integer, но если они integer надо просуммировать) приведя их к integer (некоторые переводить через опшинал байдинг, некоторые напрямую, форсируя перевод)

// №2: считаем, что получаем тюпл с сервесного запроса-ответа и он приходит с тремя параметрами: 1 - статус код (интеджер) 2 - месседж строка опциональная 3 - эрор месидж строка опциональная
// Задание: если мой статус код находится в зоне от 200 до 300 включительно, то тогда должен показать месидж, если он в другом диопазоне, то должен показать эрор месидж. После этого создать точно такой тюпл в котором нет статус кода, только 2 меседжа и задача: один из них всегда нил, другой всегда содержит что-то, надо разобраться что из них что содержит и показать соответствующую строку
// №3: создать тюпл студента с тремя параметрами: имя, номер машины и оценка за контрольную  (0...5) (для практики, где ставить "?", а где "!")
// Задание: когда создаем тюпл, то в них не должно быть данных (все нил), создать 5 тюплов, для 5 студентов разных (машина может быть/не быть, оценка так же), надо вывести это все в принт. можно использовать и опшинал байдинг и анрэп, сравнить разные методы.


// ДЗ№1

let const1 = "12"
let const2 = "23d"
let const3 = "28"
let const4 = "abc"
let const5 = "45"

var transfer11 = 0
var transfer22 = 0

if let transfer1 = Int(const1) {
    transfer11 = transfer1
}
    
if let transfer2 = Int(const2) {
    transfer2
}

let t1 = Int(const3)
if t1 != nil {
    let transfer3 = t1!
}

let t2 = Int(const4)
if t2 != nil {
    let transfer4 = t2!
}

if let transfer5 = Int(const5) {
    transfer5
}
let sum = transfer11 + transfer22


let tuple: (statusKod: Int, message: String?, errorMessage:String?) = (statusKod:254, message:"message", errorMessage:"errorMessage")

tuple.statusKod
tuple.message
tuple.errorMessage

