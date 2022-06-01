
/*
let total = ((5 + 6) - (8 * 3)) - (5 / 10)

let div = 10 / 3
let rest = 10 % 3
let rest = 11 % 3
let rest = 12 % 3

455896521313102 % 101
*/
var small : UInt8 = 0xff

//small = 0
//small = small - 1

//small = small + 5

small = 0b11111111

//&+ &* &/ &- &% амперсанд

small = small &+ 5

// конкатенация строк (операция склеивания объектов линейной структуры, обычно строк)
let str = "Hi, " + "there!"

// >, <, >=, <=, ==, !=, ===, !== операторы сравнения
let a = 6
let b = 2

if a < b {
    print("yes!")
} else {
    print("no!")
}

var c : Int
/*
if a < b {
    c = a
} else {
    c = b
}
*/

//  это можно заменить так (тернарна умовна операція):
c = a < b ? a : b

 let text = "123"

Int(text)

let n = Int(text)

/*
if n != nil {
    c = n!
} else {
    c = 0
}
*/

/*
if let opt = n {
    c = opt
} else {
    c = 0
}
*/


// оператор возвращения значения
c = n ?? 0


// унарный оператор (унарная операция приводит  значение переменной к следующему элементу базового типа (для целых чисел - увеличивает на 1)), инкримент - операция, увеличивающая значение переменной, дикримент - обратная операция

var sum = 5
sum = sum + 1
sum += 1

/*
let good = true
!good
*/

var good = true
good = !good
// логические операторы && (и), || (или); у && приоритет выше,чем у ||
// && = *, || = +
if good {
    print("good")
} else {
    print("bad")
}

/* && = *, || = +
true = 1, false = 0
true && true = true
true && false = false
false && true = false
false && false = false

true || true = true
true || false = true
false || true = true
false || false = false
 */

let i = 5
let j = 6
let k = 7
let m = 8

if (i < 3) && (j > k) && ((m != k) || m > i) {
    
}

// оператор range (оператор диапазона)
0...5
0..<4

for i in 0...5 {
    print("\(i)")
}



