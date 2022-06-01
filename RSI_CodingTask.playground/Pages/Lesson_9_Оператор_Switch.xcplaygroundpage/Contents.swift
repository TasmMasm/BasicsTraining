// ОПЕРАТОР_Switch
/*
var age = 21
if age == 21 {
    print("wau!!!")
} else if == 22 {
    
} else {
    
}
/
 / теперь это можно заменить оператором switch
switch age {
case 21: ......
    break
default:
    break
 }
*/

// оператор break - выбросить из цикла (внутреннего), break mainLoop - выбросить из цикла mainLoop, continue - пропускает следующий цикл (пример3)
/*
for _ in 0...1000 {
    for i in 0..<20 {
        if i == 10 {
            break
        }
    print(i)
    }
}

mainLoop: for _ in 0...1000 {
    for i in 0..<20 {
        }
        if i == 10 {
            break mainLoop
        }
    print(i)
    }
}

mainLoop: for _ in 0...1000 {
            for i in 0..<20 {
            if i < 15 {
                continue
            }
            if i == 10 {
                break mainLoop
        }
    print(i)
    }
}
*/
 
// когда используем break внутри switch, он выкидывает из switch
// оператор fallthrough (проваливаться) необходим, если предыдущий case сработал/не сработал, а нужно перейти дальше в другой case, при этом этот case не проверяется на условие
// оператор fallthrough даже можно ставить

var age = 65
switch age {
case 0...16: print("школьник"); fallthrough
case 17...21: print("студент")
case 22...50: break
// можно так (не только ипользуя диапазон)
case 51, 56, 57, 60: print("yes!")
default: break
}

// можно задавать несколько условий в case с помощью оператора where или другие: и, или и т.д.
var name = "Alex"
switch name {
case "Alex" where age < 50:
    print("hi buddy!")
    case "Alex" where age >= 50:
    print("i don't know you")
default: break
}

// switch может работать с тюплами:

let tuple = (name, age)
/*
switch tuple {
//case ("Alex", _): print("hi Alex") если необходим из тюпла только один параметр, но выполняться будет только первый по порядку case, который отвечает условию!!!
case ("Alex", 60): print("hi Alex 60")
case ("Alex", 59): print("hi Alex 59")
default: break
}
 */

// можно использовать Value Binding (привязка значения)
// вспоминаем Optional Binding:

var optional: Int? = 5
if let a = optional {
   print("\(a) != nil")
// можно и так:
// if let optional = optional {
//   print("\(optional) != nil")
    
}

switch tuple {
case ("Alex", 60): print("hi Alex 60")
case ("Alex", 59): print("hi Alex 59")
    // пример Value Binding:
case (_, let number) where number >= 65 && number <= 70:
    print("hi old man!")
default: break
}

let point = (5,-6)

switch point {
    // можно сделать Value Binding внутри тюпла, а можна целиком весь тюпл:
case let (x,y) where x == y:
    print("x = y")
case let (x,y) where x == -y:
    print("x = -y")
case let (_,y) where y < 0:
    print("y < 0")

default: break
}

// ДЗ
// Задание №1 создать строку произвольного текста (200 символов) и создать цикл со встроенным свитчом и посчитать количество гласных, цифр, согласных и других символов
// Задание №2 создать свитч, который будет принимать возраст человека и выводить описание периода жизни человека (детство, студенчество и т.д.)
// Задание №3 есть студент с Ф.И.О. (три строки), в одном свитче сделать следующее, если его имя начинается с "А" или с "О", то к студенту обращаться по имени, в противном случае, если его отчество начинается с "В" или "Д", то обращаться к нему по имени и отчеству, в противном случае, если его имя начинается с "Е" или "З", то тбращаться к нему только по фамилии. Если все это не сработает, то обращаться к нему по фамилии, имени и отчеству.
// Задание №4 Морской бой: поле 10х10 (можно использовать буквы/буквы и цифры) и осталось несколько кораблей часть из которых подбиты. Создать свитч, который будет получать тюпл-поинт (х,у или символы и цифры) и вернуть одно из трех значений: мимо, ранил, убил
