// Structures and Classes (Структуры и классы)

/*
let student1 = (name: "Alex", age: 20)
let student2 = (name: "Bob", age: 22)

student1.name
student2.name
 
let student3 = (nam: "Sam", ag: 23)

student3.nam
 */

// параметры первых двух будут отличаться от третьего: name, age и nam/ag соответственно, т.е. у тюплов нет инструкции по созданию этих параметров; класс - это инстркуция для созданию параметров
/*
class Student {
    var name = "No name"
    var age = 20
}
*/
// name и age - свойства класса
// создаем экземпляр класса StudentClass - stClass, а конструктор класса - это функция init():

class StudentClass {
    var name: String
    var age: Int
    
    // пустой конструктор:
    init() {
        name = "No name"
        age = 20
    // параметизированный конструктор:
    }
    init(name: String, age: Int) {
    // для разделения property name (var name: String) от локального name используют такой синтаксис: self.name = name, где self.name - property name
        self.name = name
        self.age = age
    }
}

// создаем структуру:

struct StudentStruct {
    var name: String
    var age: Int
}

//let stClass = StudentClass(name: "Bob", age: 18)
let stClass = StudentClass()

stClass.name = "Alex"
stClass.age = 21

// для создания экземпляра структуры не нужен конструктор, Swift по умоляанию создает его (это первое различие классов и структур):

var stStruct1 = StudentStruct(name: "Sam", age: 24)

//stStruct1.name = "Sam2"
//stStruct1.age = 21

// второе отличие структур от классов: присваивать новые значения в структуре можно только, если экземпляр структуры (чтобы изменить property у структуры, т.е. добавить ему какое-то значение обязательно нужно иметь саму структуру var и property - var) - переменная (в классе можно с константой)


// пример того, что экземпляры структуры имеют значение value type (копирование):
stStruct1
stStruct1.name
stStruct1.age

var stStruct2 = stStruct1

stStruct2.name
stStruct2.age

stStruct2.name = "Samuel"
stStruct2.age = 25

// при изменении значения в stStruct2, в stStruct1 без изменений
stStruct2.name
stStruct2.age

stStruct1.name
stStruct1.age

// экземпляры класса имеют значение reference type (ссылка):

var stClass1 = stClass

stClass.name
stClass.age
stClass1.name
stClass1.age

stClass1.name = "Bob"
stClass1.age = 20

stClass.name
stClass.age

// это третье отличие класса и структуры - тип значения reference и value соответсвенно.

/*
func addOneYear(student: StudentClass) {
    student.age += 1
}
func addOneYear(student: StudentStruct) {
    student.age += 1
}
*/

var arrayStructs = [stStruct1]
arrayStructs[0]
arrayStructs[0].age = 50
arrayStructs[0]
stStruct1

var arrayClasses = [stClass1]
arrayClasses[0]
arrayClasses[0].age = 50
arrayClasses[0]
stClass1

// ДЗ
// Задание №1 Сделать структуру "Студент", у него будет Имя, Фамилия, год рождения и средний бал оценок. Сделать несколько экземпляров и заполнили их данными, потом положить их все в массив (Журнал студентов - класс), потом написать функцию, которая принимает массив этих студентов и вывести в консоль данные студентов и перед каждым студентом поставить номер по списку (как индекс массивов, но начать с единицы); затем использывать функцию массивов и отсортировали студентов по среднему балу по убыванию и распечатать весь массив, далее отсортировать массив по возрастанию фамилий по алфавиту (создать студентов с одинаковыми фамилиями, если фамилии одинаковые, то по имени сортировка); сделать константу/переменную и присвоить ей массив (т.е. появятся два одинаковых массива) и теперь в существующем массиве начали менять данные студентов, ну например, средний бал и сравнить эти два массива, распечатать и посмотреть
// Задание №2 Сделать то же самое, но для классов
// Задание №3 Сделать задание по энумам используя классы или структуры
