//var str = String()

import Foundation
var str = "c"

str = str + "a"
str += "b"
/*
var a = 5
var b = a

a = a + 1
b
*/

var str1 = "a"
var str2 = str1

str1
str2

//str1 = ""
// var str2 = str1 здесь происходит копирование, поэтому str2 = "a"
str1
str2

// проверка пустая строка или нет:
str1.isEmpty


// character - символ, из которых состоит строка, требование для character - это один символ

let char1: Character = "x"
for c in "Hello world!" {
    print(c)
}

/*
// нельзя складывать строку и символ
str1 += char1
*/

// но можно использовать другую команду:
str1.append(char1)

//(str1 as NSString).length
//NSString(string: str1).length


// UNICODE стандарт кодирования символов

let heart = "\u{1F496}"

//var fun: Character = "ъ"

let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"
//u{65} - это буква "е", а u{301} - это ударение, т.е. один символ состоит из двух сложенных

let fun: Character = "ъ\u{301}\u{20dd}"

// функция для просчета количества элементов:
let funString = "what is this? -> \(fun)"

funString

funString.count
(funString as NSString).length

// сравнивание строк
if funString == "aa" {
    
} else {
    print("not equal")
}

// проверка наличия префикса
funString.hasPrefix("what")
funString.hasSuffix("ъ")
funString.hasSuffix("ъ\u{301}\u{20dd}")
funString.hasSuffix("ъ\u{20dd}\u{301}")








