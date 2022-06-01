// Type Properties
// static - это Stored Properties для типа (там устанавливается параметр для всех экземпляров структуры, а также и для энумов, хотя экземпляр энума не может иметь Stored Properties!!!).

import Foundation

let MaxNameLength = 20

/*
class Human {
    var name: String

    let maxAge = 100
    
    var age: Int {
        didSet {
            if age > Human.maxAge {
                age = oldValue
                }
            }
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
*/
 
// у классов нет Stored Properties (как типа), только для экземпляров!!!
// Computed Properties есть как для типов, так и для экземпляров класса/структуры/энума!!!

enum Direction {
    
    static let enumDescription = "Directions in the game"
    
    case Left
    case Right
    case Top
    case Bottom
    
// создадим Computed Properties для экземпляра:
    var isVertical: Bool {
        return self == .Top || self == .Bottom
    }
    var isHorizontal: Bool {
        return !isVertical
    }
    
}

let d = Direction.Right

d.isVertical
d.isHorizontal

Direction.enumDescription


/*
struct Cat {
    var name: String
// константа/переменная (static...) эта должна быть иницилизирована каким нибудь значением, у него нет конструктора для самого типа, он загружается автоматически и должен иметь дефолтное значение:
    static let maxAge = 20

    static var totalCats = 0
    
    var age: Int {
        didSet {
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
// хоть свифт и создал автоматически структуры, мы здесь переопределили его, чтобы посчитать Cat.totalCats:
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        
        Cat.totalCats += 1
    }
}

// let human = Human(name: "Peter", age: 40)

var cat = Cat(name: "Whiten", age: 10)

Cat.totalCats

let cat1 = Cat(name: "Whiten1", age: 10)
let cat2 = Cat(name: "Whiten2", age: 10)

Cat.totalCats
*/

// если мы не мрожем установить Stored Properties для класса, то можем установить для него Computed Properties:
/*
class Human {
    var name: String
// class var - это Computed Properties для типа class, и здесь можно создавать get(еры) и set(еры) для типов
    
    class var maxAge: Int {
        return 100
    }
    
    var age: Int {
        didSet {
            if age > Human.maxAge {
                age = oldValue
                }
            }
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let human = Human(name: "Peter", age: 40)
*/

// ПОПРОБУЕМ ОГРАНИЧИТЬ name ПО ДЛИНЕ (количество символов):
// можно сделать так:
/*
struct Cat {
    var name: String {
        didSet {
            if name.count > 15 {
            name = oldValue
        }
    }
}

    static let maxAge = 20

    static var totalCats = 0
    
    var age: Int {
        didSet {
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
}
*/

// а можно создать глобальную переменную, чтобы не делать Computed Properties для экземпляра в каждом классе/структурк, энуме: let MaxNameLength = 20 (и теперь: if name.count > MaxNameLength):

struct Cat {
    var name: String {
        didSet {
            if name.count > MaxNameLength {
            name = oldValue
        }
    }
}

    static let maxAge = 20

    static var totalCats = 0
    
    var age: Int {
        didSet {
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
}


// Lazy Stored Properties (Lazy - ленивый)

class Human {
    var name: String
// class var - это Computed Properties для типа class, и здесь можно создавать get(еры) и set(еры) для типов
    lazy var storyOfMyLife = "This is a story of my entire life..."
    
    class var maxAge: Int {
        return 100
    }
    
    var age: Int {
        didSet {
            if age > Human.maxAge {
                age = oldValue
                }
            }
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let human = Human(name: "Peter", age: 40)

human
human.storyOfMyLife
human

// Lazy Stored Properties имеет тип - String!, он вначале nil, но как только к нему обратиться - он загружен, и он изначально должен быть var (!)


// ДЗ
// Задание №1 создать структуру, которое будет называться "Описание файла" и она должна содержать следующие свойства: путь файла, имя файла, максимальный размер файла, путь к папке, содержащий этот файл, тип этого файла (скрытый/не скрытый) и содержимое файла (например строка), главная задача - использовать правильные свойства там, где это нужно (к какому типу какие свойства, правильно использовать Lazy Stored Properties).
// Задание №2 создать энум (тип интенжер - 3-х байтное значение цвета), который будет представлять какую нибудь цветовую гамму (красный, синий, зеленый), и создать энуму три свойства (Type Properties), количество цветов в гамме, начальный и конечный цвет,
// Задание №3 создать класс (Human), с менем, фамилией, возрастом, ростом и весом, а также максимальный и минимальный: рост и вес, возраст, макс/минимум: длина имени, фамилии. И чтобы в классе хранилось количество созданных объектов

