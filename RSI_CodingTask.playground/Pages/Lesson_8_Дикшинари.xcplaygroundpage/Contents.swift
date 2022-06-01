// dictionary
// ["kay": "value"], все ключи, как и значения, одного типа
// все ключи должны поддерживать протокол Hashable

var dict: [String:String] = ["машина": "car", "мужик": "man"]
let dict2: [Int:String] = [0: "car", 1: "man"]
let dict3: Dictionary<String, Double> = ["a": 2.0]

dict["мужик"]
dict2[1]

dict.count
dict.isEmpty

var dict4 = [String:String]()

dict4.count
dict4.isEmpty

dict["комп"] = "computer"
dict
// произошло добавление в словарь ключа "комп" со значением "computer" (стало три пары элементов), но если б вместо этого ключа подставил существующий, то он поменял бы только значение, количество элементов осталось бы такое же - 2:
//dict["мужик"] = "computer"


// получение массива ключей или значения (порядок их случайный!!!)
dict.keys
dict.values
print(dict.keys)
print(dict.values)

//dict["комп"] = "mac"
dict
// второй вариант перезаписывания/добавления значения для ключа/нового ключа, но одновременно показывает старое значение (если возвращает nil - значит такого ключа ранее не было)
dict.updateValue("mac", forKey: "комп")

// ВАЖНО!
// если мы присваиваем значение из словаря, то возвращаетя опциональное значение! Потому что, если такого значения нет, то вернется nil
//let comp: String? = dict["комп"]

if let comp = dict["комп"] {
    print("/(comp)")
} else {
    print("no value for key комп")
}

// если мы хотим убрать ключ (и значение):
//dict["мужик"] = nil
dict
/*
// если мы хотим убрать ключ (и значение), второй вариант:
dict.removeValue(forKey: "мужик")
dict
// это вариант, как и с updateValue, в случае чего это значение можно вернуть или узнать какое было для отчетности, например

// для обнуления всей конструкции
dict = [:]
dict.isEmpty

// даже, если словарь пустой, добавлятб можно ключ/значение только того же типа!
dict["Hello"] = "world"
dict.count
*/

for key in dict.keys {
    print("key =  \(key), value = \(dict[key]!)")
}
// ! - убираем насильно опционал

for (key, value) in dict {
    print("key =  \(key), value = \(value)")
}
// здесь не нужно unwrapping, получаем сразу не опциональное значение


