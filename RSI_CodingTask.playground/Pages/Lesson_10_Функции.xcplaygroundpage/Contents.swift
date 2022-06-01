//Functions (функции)

//let wallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]
/*
// как мы до этого считали сумму:
var sum = 0
for value in wallet {
    sum += value
}
sum
 */
 // далее к примеру работали с массивом - прибавляли/убавляли/и т.д.
/*
  
..........
 
 */

// чтобы дальше посчитать сумму, обнуляли sum и снова запускали цикл "for value in wallet", но можно создать функцию:

// func calculateMoney(wallet: [Int])
/*
func calculateMoney(wallet: [Int]) {
    var sum = 0
    for value in wallet {
        sum += value
    }
    print("sum = \(sum)")
}

let wallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]

calculateMoney(wallet: wallet)
calculateMoney(wallet: wallet)
*/

// функция в том виде, что выше, не возвращает значение после подсчета; для того, чтобы вернуть значение: "-> Int" и "return sum":

/*
func calculateMoney(wallet: [Int]) -> Int {
    var sum = 0
    for value in wallet {
        sum += value
    }
    return sum
}

let wallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]


calculateMoney(wallet: wallet)

var sum = calculateMoney(wallet: wallet)
// !!!sum как переменная в выражении (var sum = calculateMoney(wallet: wallet)) и sum переменная в цикле функции - это разные переменные и дальше можно работать с значением этой переменной
*/

/*
// функция может принимать несколько параметров, например, если я хочу посчитать сумму купюр какого-нибудь номинала:
func calculateMoney(wallet: [Int], type: Int) -> Int {
    var sum = 0
    for value in wallet {
        if value == type {
            sum += value
        }
    }
    return sum
}

let wallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]


calculateMoney(wallet: wallet, type: 1)
calculateMoney(wallet: wallet, type: 100)
*/

/*
// функция может возвращать несколько параметров ввиде тюпла (количество банкнот одного номинала и сумму):
func calculateMoney(wallet: [Int], type: Int) -> (total: Int, count: Int) {
    var sum = 0
    var count = 0
    for value in wallet {
        if value == type {
            sum += value
            count = count + 1
        }
    }
    return (sum, count)
}

let wallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]


// let maney = calculateMoney(wallet: wallet, type: 1) - для принта так можно, но лучше возвращать значение тюплом, чтобы дальше использованть значения:

let (maney, count) = calculateMoney(wallet: wallet, type: 100)
maney
count

calculateMoney(wallet: wallet, type: 5)
calculateMoney(wallet: wallet, type: 100)
*/

/*
// если второй параметр optional и если он такой, то считаем все деньги:
func calculateMoney(wallet: [Int], type: Int?) -> (total: Int, count: Int) {
    var sum = 0
    var count = 0
    for value in wallet {
        if type == nil || value == type! {
            sum += value
            count = count + 1
        }
    }
    return (sum, count)
}

let wallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]


let (maney, count) = calculateMoney(wallet: wallet, type: nil)
maney
count
*/

/*
// можно дать дефолтное значение:
func calculateMoney(wallet: [Int], type: Int? = nil) -> (total: Int, count: Int) {
    var sum = 0
    var count = 0
    for value in wallet {
        if type == nil || value == type! {
            sum += value
            count = count + 1
        }
    }
    return (sum, count)
}

let wallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]

// теперь в этом выражении: let (maney, count) = calculateMoney(wallet: wallet, type: nil) можно убрать значение "type: nil"
let (maney, count) = calculateMoney(wallet: wallet)
maney
count

calculateMoney(wallet: wallet, type: 5)
calculateMoney(wallet: wallet, type: 100)
*/

// можно добавить внешний параметр inWallet перед локальным wallet (локальный можно изменять вплоть до одной буквы, например wallet -> w
func calculateMoney(inWallet wallet: [Int], type: Int? = nil) -> (total: Int, count: Int) {
    var sum = 0
    var count = 0
    for value in wallet {
        if type == nil || value == type! {
            sum += value
            count = count + 1
        }
    }
    return (sum, count)
}

let wallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]

let (maney, count) = calculateMoney(inWallet: wallet)
maney
count

calculateMoney(inWallet: wallet, type: 5)
calculateMoney(inWallet: wallet, type: 100)
calculateMoney(inWallet: wallet, type: 100).count
calculateMoney(inWallet: wallet, type: 100).total

// Variadic Parameters (Вариативные параметры) Вариативный параметр принимает ноль или более значений указанного типа. Вы используете переменный параметр, чтобы указать, что параметру может быть передано различное количество входных значений при вызове функции. Запишите переменные параметры, вставив три символа точки (...) после имени типа параметра. Значения, переданные вариативному параметру, становятся доступными в теле функции - calculateMoney(inSequence: 5,5,10,2,3,4,3,23,34), в виде массива соответствующего типа.
func calculateMoney(inSequence range: Int...) -> Int {
    var sum = 0
    for value in range {
            sum += value
    }
    
    return sum
    
}
calculateMoney(inSequence: 5,5,10,2,3,4,3,23,34)

//функция sayHi пустая (ничего не входит и не выходит)
func sayHi() -> () {
    print("hi")
}
sayHi()
sayHi()
sayHi()
let hi = sayHi
// теперь константа "hi" равна функции "sayHi", а тип фунции (let hi: () -> () = sayHi): () -> () :
hi()
hi()

func sayPhrase(phrase: String) -> Int? {
    print(phrase)
    return 0
}

sayPhrase(phrase: "aaa")

let phrase = sayPhrase
// тип этой функуии let phrase: (String) -> (Int?) = sayPhrase: (String) -> (Int?)

phrase("bbb")
phrase("ccc")

func doSomething(whatToDo: () -> ()) {
    whatToDo()
}

func whatToDo() -> () -> () {
 //   return sayHi
    func printSomething() {
        print("hello world!!!")
    }
    return printSomething
}

doSomething(whatToDo: hi)

// whatToDo()() - будет печатать "hello world!!!", но можно было и так:

let iShouldThis = whatToDo()
iShouldThis()


