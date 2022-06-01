// Closures

let numbers = [4, 3, 12, 7, 6, 3, 56, 7, 8, 9, 10, 4, 3, 1, 8, 11]

// пишем функцию отфильтровать массив filterArraw, принимать будем массив [Int] (любой), в данном случае массив numbers, и эта функция еще будет принимать один параметр (Int) и будет возвращать булевое значение Bool и еще вся эта функция filterArraw(array: [Int], f: (Int) -> Bool) будет возвращать массив [Int], собственно отфильтрованный - четные и не четные значения массива numbers:

func filterArraw(array: [Int], f: (Int) -> Bool) -> [Int] {
    var filtered = [Int]()
    for i in array {
        if f(i) {
            filtered.append(i)
        }
    }
    return filtered
}
/*
func compare(i: Int) -> Bool {
    return i % 2 == 0
}

func compare2(i: Int) -> Bool {
    return i % 2 == 1
}

filterArraw(array: numbers, f: compare)
filterArraw(array: numbers, f: compare2)
*/

// если необходимо завтра сделать еще одну функцию написать, будет еще одна функция, , поэтому для таких случаев необходимы Closures, в данном случае это inline Closures, т.е. мы не выносим функцию отдельно, а прямо пишев в этом методе:
filterArraw(array: numbers, f: {(i: Int) -> Bool in
    print("i = \(i)")
    return i % 2 == 0
})

filterArraw(array: numbers, f: {(i: Int) -> Bool in
    return i % 2 == 1
})

filterArraw(array: numbers, f: {(i: Int) -> Bool in
    print("i = \(i)")
    return i % 3 == 0
})

filterArraw(array: numbers, f: {(i: Int) -> Bool in
    return i < 10
})

// можно еще упрощать так:
// filterArraw(array: numbers, f: {(i: Int) -> Bool in
//   return i % 2 == 0
// })
filterArraw(array: numbers, f: {i in
    return i % 2 == 0
})
// i в этой функции, можно представить любой переменной, и эта i, это не одна и та же i, которая в этой функции:
/*
func filterArraw(array: [Int], f: (Int) -> Bool) -> [Int] {
    var filtered = [Int]()
    for i in array {
        if f(i) {
            filtered.append(i)
        }
    }
    return filtered
}
*/

// i в этой функции (filterArraw), можно представить любой переменной...:
filterArraw(array: numbers, f: {d in
    return d % 2 == 0
})

// можно убрать и return и записать все в одну строку, Swift это позволяет:
let a =
filterArraw(array: numbers, f: {i in i % 2 == 1})


// Shorthand Argument Names
// так как часто Closures - это одна операция, можно сделать еще более укороченную форму - Shorthand Argument Names (так как функция принимает один аргумент, то $0 - это первый аргумент,  $1 и $2 - это второй и третий аргумент, если бы функция принимала два и три аргумента соответственно, их, и т.д.):
let a1 =
filterArraw(array: numbers, f: {$0 % 3 == 0})

// Trailing Closures - замыкание
// правило это гласит, что в функции "filterArraw(array: numbers, f: {$0 % 3 == 0})" Closures - "f: {$0 % 3 == 0}" находится в конце, то можно еще упростить:

let a2 =
filterArraw(array: numbers) {$0 % 3 == 0}

// при определенных условиях "(array: numbers)" можно также убрать

// Пример использования Closures. Сортировка: этого массива значений "let numbers = [4, 3, 12, 7, 6, 3, 56, 7, 8, 9, 10]" оставить значения, соответствующие значениям массива "let arraw = [1, 2, 3]":

let arraw = [1, 2, 3, 5, 7, 123]

// создаем переменную, чтобы узнать, сколько циклов прошло:
var count = 0

let a3 =
filterArraw(array: numbers) {value in
    
    for include in arraw {
        count += 1
        if include == value {
            return true
        }
    }
    return false
}
count
// из этого примера надо обратить внимание!!! - код сортировки написан внутри Closures и был захвачен массив "let arraw = [1, 2, 3]" и передал в Closures, т.е. можно захватывать константы из существующего контекста - не нужно передавать в эту функцию "filterArraw(array: numbers)", их (константы) как дополнительный параметр и создавать еще какой-нибудь массив

// решим ту же задачу через Дикшинари в контексте предыдущего Closures: 

count = 0
var dict = [Int:Bool]()
for value in arraw {
    count += 1
    dict[value] = true
}
let a4 =
filterArraw(array: numbers) {value in
    count += 1
    return dict[value] != nil
}
count

// можно и сократить:
let a5 =
filterArraw(array: numbers) {dict[$0] != nil}

// ДЗ
// №1 написать функцию, которая ничего не принимает и не возвращает, а только принимает один клоужер, который ничего не принимает, ничего не возвращает; в тело функиии добавить цикл for от 1 до 10 и сделать в этом теле print, который выведет эти цифры от 1 до 10; после выхода из цикла вызвать клоужер, в клоужер положить еще один print
// №2 
