class Student1 {
    var firstName: String
    var lastName: String
    var fullName: String {
        return firstName + " " + lastName
    }
    
    init() {
        self.firstName = ""
        self.lastName = ""
    }
}

class Student2 {
    var firstName = ""
    var lastName = ""
    var fullName = ""
}

class Student3 {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
// НАПОМИНАНИЕ!!! firstName/lastName - это external (внешний) и internal (внутренний) параметр одновременно, здесь: (self.firstName = firstName) firstName - внутренний/локальный параметр, а здесь: (let s3 = Student3(firstName: "a", lastName: "b")) - наружный/глобальный.
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Student4 {
    var middleName: String?
}
// ПРИМЕЧАНИЕ!!! если есть optional property, даже если он stored property, его иницилизировать не нужно (так как в момент иницилизвации он прмет значение nil)


class Student5 {
    let maxAge: Int
    
    init() {
        maxAge = 100
    }
}

// ВАЖНО!!! подкласс не может переназначить свойству значение let:
/*
class Student6: Student5 {
    override init() {
        maxAge = 110 // error!!!
    }
}
*/

struct Student7 {
    var firstName: String
    var lastName: String
}
// ! хотя в структуре уже зашит конструктор, можно в структуру добавить два конструктора дефолтный и иницилизированный:
struct Student8 {
    var firstName: String
    var lastName: String
    
    init() {
        firstName = ""
        lastName = ""
    }
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

let s1 = Student1()
let s2 = Student2()
let s3 = Student3(firstName: "a", lastName: "b")

// к НАПОМИНАНИЮ: можно сделать такой синтаксис - наружную/глобальную переменную обозначить как "_" (underscore/нижнее подчеркивание)  init(_ firstName: String, _ lastName: String), и тогда тут будет let s3 = Student3("a", "b")

let s7 = Student7(firstName: "a", lastName: "b")
let s8 = Student8()
let sa8 = Student8(firstName: "c", lastName: "d")
let sb8 = Student8()

// Designated Initializers and Convenience Initializers (Назначенные инициализаторы и удобные инициализаторы)

// выше на примерах были показаны так называемые Designated Initializers

// Designated Initializers являются первичными initializers для class. Designated Initializers полностью initializes все properties, представленные этим class, и вызывает соответствующий superclass initializer, чтобы продолжить процесс initialization вверх по цепочке superclass.
// Classes, как правило, имеют очень мало designated initializers, и довольно часто class имеет только один. Designated Initializers — это точки «воронки», через которые происходит initialization и через которые процесс initialization продолжается вверх по цепочке superclass.
// Каждый class должен иметь по крайней мере один designated initializer. В некоторых случаях это требование удовлетворяется путем наследования (inheriting) одного или нескольких designated initializers от superclass.
// Convenience initializers являются вторичными, поддерживающими initializers для class. Вы можете определить convenience initializer для вызова designated initializer из того же class, что и convenience initializer, с некоторыми designated initializer’s parameters, установленными default values. Вы также можете определить convenience initializer для создания instance этого class для определенного варианта использования или типа входного значения.
// Вам не нужно предоставлять convenience initializers, если они не требуются вашему class. Создавайте convenience initializers всякий раз, когда ярлык для общего шаблона initialization сэкономит время или сделает initialization class более понятной.


// Convenience Initializers

class Human {
    var weight: Int
    var age: Int
    
    init(weight: Int, age: Int) {
        self.weight = weight
        self.age = age
    }
    
    convenience init(age: Int) {
        self.init(weight: 0, age: age)
    }
    
    convenience init(weight: Int) {
        self.init(weight: weight, age: 0)
    }
    
    convenience init() {
        self.init(weight: 0)
    }
    
    func test() {}
}

let h1 = Human(weight: 70, age: 25)
let h2 = Human(weight: 70)
let h3 = Human(age: 25)
let h4 = Human()

class Student: Human {
    
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
//  super.init(weight: 0, age: 0) error!!! - в Designated Initializer иницилизирует свойства дочернего класса (subrclass), а затем родительского (superclass), поэтому иницилизацию свойств родительского класса проводим после дочернего:
        self.firstName = firstName
        self.lastName = lastName
// надо завершить Designated Initializer свойств родительского класса Human:
        super.init(weight: 0, age: 0) // вставить сюда Convenience initializer из класса Human нельзя!!!, так как Designated Initializer вызывает только Designated Initializer!!!
// после иницилизации всех свойств (здесь) начинается вторая фаза иницилизации:
        self.weight = 50
        test()
    }
    
    convenience init(firstName: String) {
       // test()   - error!!!
       // self.age = 28 - error!!!
       // только после обращения к Designated Initializer:
        self.init(firstName: firstName, lastName: "")
        self.age = 28
        test()
    }
}

let student = Student(firstName: "s")

// в период initialization (прохождение 2-х фаз) или дефолтного значения Propertys не вызывается родительские Property Observers

