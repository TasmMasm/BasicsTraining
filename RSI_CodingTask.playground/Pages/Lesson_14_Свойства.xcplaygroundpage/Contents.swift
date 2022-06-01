// Properties (Свойства)
// Stored Properties and Computed Properties
// Свойства связывают значения с определенным классом, структурой или перечислением. Сохраненные свойства хранят постоянные и переменные значения как часть экземпляра, тогда как вычисляемые свойства вычисляют (а не сохраняют) значение. Вычисляемые свойства предоставляются классами, структурами и перечислениями. Сохраненные свойства предоставляются только классами и структурами.

import Foundation

// Stored Properties

/*
struct Student {
    var firstName: String
}

var student = Student(firstName: "Alex")
// наш Properties firstName тип String иницилизирован и хранит данные "Alex"

student.firstName
student.firstName = "Bob"
student.firstName
*/

// Кроме того, вы можете определить наблюдателей свойств (property observers) для отслеживания изменений значения свойства, на которые вы можете реагировать с помощью настраиваемых действий. Наблюдатели свойств могут быть добавлены к сохраненным свойствам, которые вы определяете сами, а также к свойствам, которые подкласс наследует от своего суперкласса:
/*
struct Student {
    var firstName: String {
        
        willSet(newFirstName) {
            print("will set" + newFirstName + "instead of" + firstName)
        }
        didSet(oldFirstName) {
            print("did set" + firstName + "instead of" + oldFirstName)
            
            firstName = firstName.capitalized
        }
        
    }
}

var student = Student(firstName: "Alex")
student.firstName

student.firstName = "Bob"

student.firstName = "sam"
student.firstName
*/
// firstName = firstName.capitalized - если я неправильно ввел строку с именем - "sam" (все/часть заглавные буквы), то это поможет исправить на  "Sam" (capitalized - с большой буквы)
// в didSet, кроме capitalized, можно поставить еще много других ограничений по сохранению данных

// можно не писать в willSet(newFirstName) - newFirstName, по умолчанию это выглядит так: willSet(newValue) и didSet(oldValue), newValue и oldValue - дефолтные операторы willSet и didSet:
/*
struct Student {
    var firstName: String {
        
        willSet {
            print("will set" + newValue + "instead of" + firstName)
        }
        didSet {
            print("did set" + firstName + "instead of" + oldValue)
            
        }
        
    }
}
*/

// Computed Properties
/*
struct Student {
    var firstName: String {
        
        willSet(newFirstName) {
            print("will set" + newFirstName + "instead of" + firstName)
        }
        didSet(oldFirstName) {
            print("did set" + firstName + "instead of" + oldFirstName)
            
            firstName = firstName.capitalized
        }
        
    }
    
    var lastName: String {
        didSet {
            lastName = lastName.capitalized
        }
    }
    
    var fullName: String
}

var student = Student(firstName: "Alex", lastName: "Skutarenko", fullName: "Alex Skutarenko")
student.firstName
student.lastName
student.fullName

student.firstName = "Bob"
student.fullName
*/
// при замене firstName, мы хотим изменить fullName, но это не получится, ктому же мы увеличиваем память и чтобы не дублировать (прямым изменением fullName) можно сделать так:

struct Student {
    var firstName: String {
        
        willSet(newFirstName) {
            print("will set " + newFirstName + " instead of " + firstName)
        }
        didSet(oldFirstName) {
            print("did set " + firstName + " instead of " + oldFirstName)
            
            firstName = firstName.capitalized
        }
        
    }
    
    var lastName: String {
        didSet {
            lastName = lastName.capitalized
        }
    }
    
    var fullName: String {
        
        get {
            return firstName + " " + lastName
        }
// если мы ипользуем только один get, то можно упростить: return firstName + " " + lastName, без get { }
        set(newValue) {
// newValue можно и не писать, если устанавливать дефолтное значение (как пример см. выше)
            print("fullName wants to be set to " + newValue)
            
            let words = newValue.components(separatedBy: " ")
            
            if words.count > 0 {
                firstName = words[0]
            }
            if words.count > 1 {
                lastName = words[1]
            }
            
        }
    }
}

// мы не иницилизируем Properties fullName, потому что fullName - это уже Computed Properties, он не сохраняет данные, а только производит вычесление:
var student = Student(firstName: "Alex", lastName: "Skutarenko")
student.firstName
student.lastName
student.fullName

student.firstName = "Bob"
student.fullName

student.fullName = "iVAN Ivanov"
student.fullName
student.firstName
student.lastName

// в Stored Properties есть property observers, но нет get(еров) и set(еров), в Computed Properties - наоборот

// ДЗ
// Задание №1 повторить все сказанное в уроке самостоятельно, добавить параметр дату рождения к этому студенту, но это будет отдельная структура, которая содержит день/месяц/год и добавить в эту структуру Computed Properties, которая будет считать сколько студенту лет третью Properties - Computed Properties - которая будет считать сколько студент учился (с 6 лет), но если студенту меньше 6 лет, то уйти в ноль, а не в минус
// Задание №2 создать структуру - отрезок, и у него будут две внутренние структуры (точки) и это Stored Properties, и будет две Computed Properties: 1 - это мидпоинт (посчитать функциями математическими), 2 - длина отрезка.
// Задание №3 если переместить мидпоинт в другое место, то и две точки должны переместиться на тот же вктор, что и мидпоинт и если хотим поменять длину отрезка, то одна из точек должна сдвинуться, а вторая на месте (через увеличение дины отрезка! на разность расстояний)



