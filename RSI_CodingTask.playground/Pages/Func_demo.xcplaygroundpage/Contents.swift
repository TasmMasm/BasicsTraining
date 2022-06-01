//: [Previous](@previous)

import Foundation

struct Person {
    static var ageStatic: Int = 0
    
    let age: Int
    let name: String
    let surrName: String
    
    var fullName: String = ""
    
    func addPlusIOne(to ageee: Int) -> Int {
        ageee + 1
    }
    
    func adddPlusIOneTo() -> Int {
        age + 1
    }
    
    func addPlusIOneTo(ageee: Int) -> Int {
        ageee + 1
    }
    
    func getUserFullInfo() -> String {
        "Age: \(age)\nname: \(name)\nsurrName: \(surrName)"
    }
    
    mutating func fillUserFullInfo() {
        fullName = "Age: \(age)\nname: \(name)\nsurrName: \(surrName)"
    }
}

//Person(age: 0, name: "").addPlusIOne(to: 0)
//Person(age: 0, name: "").addPlusIOneTo(ageee: 0)
//Person(age: 0, name: "").adddPlusIOneTo()

let personAlex = Person(age: 18, name: "Alex", surrName: "ABC").getUserFullInfo()
let personOleg = Person(age: 18, name: "Oleg", surrName: "ABC").getUserFullInfo()
let personOlga = Person(age: 18, name: "Olga", surrName: "ABC").getUserFullInfo()
let personInna = Person(age: 18, name: "Inna", surrName: "ABC").getUserFullInfo()

//print("Age: \(personAlex.age)\nname: \(personAlex.name)\nsurrName: \(personAlex.surrName)")
//print("Age: \(personAlex.age)\nname: \(personAlex.name)\nsurrName: \(personAlex.surrName)")
//print("Age: \(personAlex.age)\nname: \(personAlex.name)\nsurrName: \(personAlex.surrName)")
//print("Age: \(personAlex.age)\nname: \(personAlex.name)\nsurrName: \(personAlex.surrName)")
//print("Age: \(personAlex.age)\nname: \(personAlex.name)\nsurrName: \(personAlex.surrName)")


let personInnaq = Person(age: 18, name: "Inna", surrName: "ABC")

enum PersonEnum: String, CaseIterable {
    case oleg
    case alex
    case inna
}

let somePerson: PersonEnum = PersonEnum.allCases.randomElement()!

switch somePerson {
case .oleg:
    print("oleg")
case .alex:
    print("alex")
case .inna:
    print("inna")
}


struct Person2 {
    let age: Int
    let name: String
    let surrName: String
    
    var willSetNewValue = "" {
        didSet {
            print(age)
        }
    }
    
    var didSetNewValue = "" {
        didSet {
            print(name)
        }
    }
    
    private var _fullName: String = "" {
        willSet {
            print("willSetTriggred\n")
            willSetNewValue = newValue
            print(newValue)
        }
        didSet {
            print("didSetTriggred\n")
            didSetNewValue = _fullName
            print(_fullName)
        }
    }
    
    var fullName: String {
        get {
            print("fullNameGetTriggered")
            return _fullName
        }
        set { _fullName = newValue }
    }
    
    init(age: Int, name: String, surrName: String) {
        self.age = age
        self.name = name
        self.surrName = surrName
    }

    
    mutating func fillUserFullInfo() {
        fullName = "Age: \(age)\nname: \(name)\nsurrName: \(surrName)"
    }
}

var personAlex2 = Person2(age: 18, name: "Alex", surrName: "ABC")
//personAlex2.fullName
//personAlex2.age

personAlex2.fillUserFullInfo()
personAlex2.fullName

var personOleg2 = Person2(age: 21, name: "Oleg", surrName: "ABC")

personOleg2.fillUserFullInfo()
personOleg2.fullName
