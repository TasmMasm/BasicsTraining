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
/*
class Student: Human {
    
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        super.init(weight: 0, age: 0)
        self.weight = 50
    }

    convenience init(firstName: String) {
        self.init(firstName: firstName, lastName: "")
        self.age = 28
        test()
    }
}
*/
// при создании нового class Doctor, который наследует свойства class Student и при дефолтном значении свойства: var fieldOfStudy = "", константа let d1 видит родительские Designated Initializer (firstName: String, lastName: String) и Convenience initializer (firstName: String):

// class Doctor: Student {
//     var fieldOfStudy = ""
// }
// let d1 = Doctor(firstName: "aaa")


// если var fieldOfStudy не определена, то создавая свой Designated Initializer - init(fieldOfStudy: String) и родительский - super.init(firstName: "Doctor", lastName: "House"), то не передается родительский иницилизатор convenience init(firstName: String):

// class Doctor: Student {
//    var fieldOfStudy: String
// init(fieldOfStudy: String) {
//    self.fieldOfStudy = fieldOfStudy
//     super.init(firstName: "Doctor", lastName: "House")
//    }
// }
// let d1 = Doctor(firstName: "aaa") - error!!!

// Subclasses по умолчанию не наследуют инициализаторы своих superclass. Однако инициализаторы superclass автоматически наследуются, если выполняются определенные условия.

// Правило 1. Если ваш subclass не определяет никаких designated initializers (или назначены дефолтные значения properties), он автоматически наследует все superclass designated initializers.

//  в примере выше можно создать convenience initializer, чтобы сохранить метод superclass Student - (firstName: String, lastName: String):
/*
 class Doctor: Student {
     var fieldOfStudy: String = ""
 
//     init(fieldOfStudy: String) {
//         self.fieldOfStudy = fieldOfStudy
//         super.init(firstName: "Doctor", lastName: "House")
//     }
     
     convenience init(fieldOfStudy: String) {
         self.init(firstName: "Doctor", lastName: "House")
         self.fieldOfStudy = fieldOfStudy
     }
}
let d1 = Doctor(firstName: "Doctor", lastName: "House")
*/
// ЗАПОМНИТЬ: convenience init всегда вызывает self.init, а init designated initializer вызывает super.init superclass


// Правило 2. Если ваш subclass предоставляет реализацию всех superclass designated initializers — либо путем inheriting (наследования) их в соответствии с правилом 1, либо путем предоставления пользовательской реализации как части своего определения — тогда он automatically inherits все automatically inherits.
// Эти правила применяются, даже если ваш subclass добавляет дополнительные convenience initializers.

//  ПРИМЕЧАНИЕ!!! Subclass может реализовать superclass designated initializer в качестве subclass convenience initializer в рамках выполнения правила 2.

// если необходимо в class Doctor создать свой designated initializer и сохранить все свойства subclass Student, то необходимо переопределить все (!!!) родительские designated initializer subclass Student (в данном случае один), согласно Правилу №2:
/*
class Doctor: Student {
    var fieldOfStudy: String = ""

    init(fieldOfStudy: String) {
         self.fieldOfStudy = fieldOfStudy
         super.init(firstName: "Doctor", lastName: "House")
     }
    
    override init(firstName: String, lastName: String) {
        self.fieldOfStudy = "Health"
        super.init(firstName: firstName, lastName: lastName)
    }
}
// также от superclass Student унаследовались все его convenience initializers, в данном случае один: convenience init(firstName: String)
// если бы в superclass Student было, например, пять designated initializer и нам нужно было бы наследовать один (как в данном случае) convenience initializer, то необходимо было переопределить все пять designated initializer родительского subclass Student

// в примере с class Doctor, мы не унаследовали свойства class Human (weight и age), для этого нужно эти свойства сначала переопределить в subclass Student
*/
/*
class Student: Human {
    
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        super.init(weight: 0, age: 0)
        self.weight = 50
    }
// здесь перенаследуем свойства class Human (weight и age):
    override init(weight: Int, age: Int) {
        self.firstName = ""
        self.lastName = ""
        super.init(weight: weight, age: age)
    }

    convenience init(firstName: String) {
        self.init(firstName: firstName, lastName: "")
        self.age = 28
        test()
    }
}
 */
// теперь, для того, чтобы в class Doctor могли снова передаться свойства от superclass Student и добавится от superclass Human нужно переопределить в class Doctor еще один появивишийся designated initializer в superclass Student: override init(weight: Int, age: Int):
/*
class Doctor: Student {
    var fieldOfStudy: String = ""

    init(fieldOfStudy: String) {
         self.fieldOfStudy = fieldOfStudy
         super.init(firstName: "Doctor", lastName: "House")
     }
    
    override init(firstName: String, lastName: String) {
        self.fieldOfStudy = "Health"
        super.init(firstName: firstName, lastName: lastName)
    }
// еще одно переопределение designated initializer от superclass Student:
    override init(weight: Int, age: Int) {
        self.fieldOfStudy = ""
        super.init(weight: weight, age: age)
    }
}
*/

// чтобы избежать больших переопредилений можно в superclass Student переопределить не designated initializer superclass Human, а convenience initializer superclass Student и там переопределим свойства class Human (weight и age):

class Student: Human {
    
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        super.init(weight: 0, age: 0)
        self.weight = 50
    }
// здесь добавляем convenience initializer с переопределением свойства class Human (weight и age):
    override convenience init(weight: Int, age: Int) {
        self.init(firstName: "")
        self.weight = weight
        self.age = age
    }

    convenience init(firstName: String) {
        self.init(firstName: firstName, lastName: "")
        self.age = 28
        test()
    }
}

class Doctor: Student {
    var fieldOfStudy: String = ""

    init(fieldOfStudy: String) {
         self.fieldOfStudy = fieldOfStudy
         super.init(firstName: "Doctor", lastName: "House")
     }
    
    override init(firstName: String, lastName: String) {
        self.fieldOfStudy = "Health"
        super.init(firstName: firstName, lastName: lastName)
    }
// это теперь не нужно:
/*
    override init(weight: Int, age: Int) {
        self.fieldOfStudy = ""
        super.init(weight: weight, age: age)
    }
*/
}

let d1 = Doctor()
