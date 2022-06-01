// Inheritance (Наследование)

// Class может inherit (наследовать) методы, свойства и другие характеристики от другого класса. Когда один класс наследуется от другого, наследующий класс называется subclass (подклассом), а класс, от которого он наследуется, называется его superclass (суперклассом). Inheritance — это фундаментальное поведение, которое отличает classes от других типов в Swift.

// Classes в Swift могут вызывать и получать доступ к methods, properties и subscripts, принадлежащим их superclass, и могут предоставлять свои собственные overriding (переопределяющие) версии этих methods, properties, и subscripts для уточнения или изменения своего поведения. Swift помогает убедиться, что ваши overrides (переопределения) верны, проверяя, что определение переопределения имеет соответствующее определение superclass.
// Classes также могут добавлять property observers (наблюдателей свойств) к inherited properties (унаследованным свойствам), чтобы получать уведомления об изменении значения свойства. Property observers  могут быть добавлены к любому свойству, независимо от того, было ли оно первоначально определено как stored или computed property.

class Human {
    
    var firstName: String = ""
    var lastName: String = ""
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    func sayHello() -> String {
        return "Hello"
    }
}
/*
class Student {
    var firstName: String = ""
    var lastName: String = ""
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    func sayHello() -> String {
        return "Hello"
    }
}
*/

// но можно это записать так (происходит наследование свойств и методов от сlass (superclass) Human, а Student - subclass):
class Student: Human {
    
    override func sayHello() -> String {
        return super.sayHello() + " my friend"
    }
}
// override - этот оператор переопределяет метод func sayHello() у superclass Human, но можно вернуть родительский метод superclass Human и добавить новое: например return super.sayHello() + " my friend", где возврат дает нам орератор - super

class Kid: Human {
    
    var favoriteToy: String = "iMac"
    
    override func sayHello() -> String {
        return "agu"
    }
    
    override var fullName: String {
        return firstName
    }
    
    override var firstName: String {
        set {
            super.firstName = newValue + ":)"
        }
        get {
            return super.firstName
        }
    }
    override var lastName: String {
        didSet {
            print("new value " + self.lastName)
        }
    }
}

let human = Human()
human.firstName = "Alex"
human.lastName = "Skutarenko"
human.fullName
human.sayHello()

let student = Student()
student.firstName = "Max"
student.lastName = "Mix"
student.fullName
student.sayHello()

let kid = Kid()
kid.firstName = "Kid"
kid.lastName = "Boben"
kid.fullName
kid.sayHello()
kid.lastName
kid.favoriteToy

// Можно предотвратить переопределение method, property, или subscript, пометив их как final. Для этого напишите модификатор final перед вводным словом method, property, или subscript’s (например, final var, final func, final class func и final subscript).
// О любой попытке переопределить окончательный method, property, или subscript в subclass сообщается как об ошибке времени компиляции. Methods, properties, или subscripts, которые вы добавляете к class в расширении, также могут быть помечены как окончательные в определении расширения.
// Можно пометить весь class как final, написав модификатор final перед ключевым словом class в его определении класса (final class). О любой попытке создать subclass конечного class сообщается как об compile-time error (ошибке времени компиляции).

// пример полиморфизма (способность функции обрабатывать данные разных видов):

// let arraw: [Human] = [kid, student, human] или так:
 let arraw = [kid, student, human]

for value in arraw {
    print(value.sayHello())
}

