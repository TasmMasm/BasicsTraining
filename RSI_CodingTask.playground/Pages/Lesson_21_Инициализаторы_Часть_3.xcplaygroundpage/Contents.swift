// Failable Initializers (Неудачные инициализаторы)
import Foundation
import Darwin

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
    deinit {
        print("Human Deinitializatized")
    }
    
}

// Иногда полезно определить class, structure, or enumeration, инициализация которых может завершиться ошибкой (fail). Этот сбой может быть вызван недопустимыми значениями параметров инициализации, отсутствием требуемого внешнего ресурса или каким-либо другим условием, препятствующим успешному выполнению инициализации.
// Чтобы справиться с условиями инициализации, которые могут привести к сбою, определите один или несколько failable initializers как часть определения class, structure, or enumeration. Вы пишете failable initializer, помещая вопросительный знак после ключевого слова init (init?).


// ПРИМЕЧАНИЕ!!! Вы не можете определить failable и nonfailable initializer с одинаковыми типами параметров и именами.

// Failable Initializer создает optional value типа, который он инициализирует. Вы пишете return nil внутри failable initializer, чтобы указать точку, в которой может произойти сбой инициализации.

// ПРИМЕЧАНИЕ!!! Initializers не возвращают значения. Скорее, их роль состоит в том, чтобы обеспечить полную и правильную инициализацию self к моменту окончания инициализации. Хотя вы пишете return nil, чтобы инициировать ошибку инициализации, вы не используете ключевое слово return для индикации успеха инициализации.

enum Color: Int {
    case Black
    case White
    
    init?(value: Int) {
        switch value {
        case 0: self = Color.Black
        case 1: self = Color.White
        default: return nil
        }
      
    }
}
/*
class Friend {
    var name: String
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}
// Swift не дает до окончания первой фазы вернуть nil ??? почему? работает
*/

class Friend: Human {
    var name: String!
// String! - по умолчанию в значение name уже установлен в nil
/*
    let scin: Color = {
        let random = Int(arc4random_uniform(2))
        return Color(random)!
    } ()
*/
    
    
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
        super.init(weight: 0, age: 0)
    }
// Required Initializers (Требуемые инициализаторы): если модификатор required написать перед определением инициализатора класса, то каждый подкласс класса должен реализовать этот инициализатор:
    required init() {
        self.name = "Hi"
        super.init(weight: 0, age: 0)
    }
    deinit {
        print("Friend Deinitializatized")
    }
}
let f = Friend(name: "AAA")
f!.name

// можно переопределять failable initializers в дочернем классе не в failable initializers:
/*
class BestFriend: Friend {
    
    override init(name: String) {
        
        if name.isEmpty {
            super.init()
        } else {
            super.init(name: name)!
        }
    }
// required - требуемый иницилизатор родительского класса, т.е. обязательное переопредиление designated Initializer класса Friend:
    required init() {
        super.init()
    }
}
*/

// Deinitialization (Деинициализация)

// рассмотрим удаление объекта из памяти

class BestFriend: Friend {
    override init(name: String) {
        if name.isEmpty {
            super.init()
        } else {
            super.init(name: name)!
        }
    }
    required init() {
        super.init()
    }
    deinit {
        print("BestFriend Deinitializatized")
    }
}
let b = BestFriend(name: "")

struct Test {
    var bestFriend: BestFriend? = BestFriend(name: "")
}

var test: Test? = Test()
test!.bestFriend = nil

