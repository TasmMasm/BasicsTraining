// Дополнительные возможности, поддерживаемые классами, достигаются за счет увеличения сложности. Как правило, отдавайте предпочтение структурам, потому что о них легче рассуждать, и используйте классы, когда они уместны или необходимы. На практике это означает, что большинство пользовательских типов данных, которые вы определяете, будут структурами и перечислениями (энумами).

// Definition Syntax (синтаксис определения)

struct SomeStructure {
    // здесь идет определение структуры
}
class SomeClass {
    // здесь находится определение класса
}

// Всякий раз, когда вы определяете новую структуру или класс, вы определяете новый тип Swift. Дайте типам имена UpperCamelCase (такие как SomeStructure и SomeClass здесь), чтобы они соответствовали написанию заглавных букв стандартных типов Swift (таких как String, Int и Bool). Дайте свойствам и методам имена lowerCamelCase (например, frameRate и incrementCount), чтобы отличать их от имен типов.

// Вот пример определения структуры и определения класса:
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// Structure and Class Instances (Экземпляры структуры и класса)
// Синтаксис создания экземпляров очень похож как для структур, так и для классов:

let someResolution = Resolution()
let someVideoMode = VideoMode()

// Accessing Properties (Доступ к свойствам)
// Вы можете получить доступ к свойствам экземпляра, используя точечный синтаксис. В точечном синтаксисе вы пишете имя свойства сразу после имени экземпляра, разделяя его точкой (.), без пробелов:

print("The width of someResolution is \(someResolution.width)")
someResolution.height
someResolution.width

// Вы можете перейти к подсвойствам, таким как свойство ширины в свойстве разрешения VideoMode:
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.height
someVideoMode.resolution.width

// Вы также можете использовать точечный синтаксис, чтобы присвоить новое значение свойству переменной:
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

// Memberwise Initializers for Structure Types (поэлементные инициализаторы для типов структур)

// Все структуры имеют автоматически сгенерированный инициализатор для отдельных элементов, который можно использовать для инициализации свойств элементов новых экземпляров структуры. Начальные значения для свойств нового экземпляра могут быть переданы инициализатору членов по имени (width,height):
let vga = Resolution(width: 640, height: 480)
 
// В отличие от структур, экземпляры класса не получают поэлементный инициализатор по умолчанию.


// Structures and Enumerations Are Value Types

// Value Types — это тип, значение которого копируется, когда оно присваивается переменной или константе или когда оно передается функции.
// Фактически, все основные типы в Swift — integers, floating-point numbers, Booleans, strings, arrays and dictionaries — это value types.

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
// Несмотря на то, что hd и cinema теперь имеют одинаковую ширину и высоту, за кулисами это два совершенно разных экземпляра.

cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
// Однако свойство ширины исходного экземпляра hd по-прежнему имеет старое значение 1920:
print("hd is still \(hd.width) pixels wide")
// Когда cinema было присвоено текущее значение hd, значения, хранящиеся в hd, были скопированы в новый экземпляр cinema. Конечным результатом стали два совершенно отдельных экземпляра, содержащих одинаковые числовые значения. Однако, поскольку это отдельные экземпляры, установка ширины cinema на 2048 не влияет на ширину, хранящуюся в hd

// То же самое относится и к enumerations (перечислениям):
enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")
// Когда RememberDirection присваивается значение currentDirection, фактически устанавливается копия этого значения. Изменение значения currentDirection после этого не влияет на копию исходного значения, которое было сохранено в RememberDirection.


// Classes Are Reference Types

// В отличие от типов значений, ссылочные типы не копируются, когда они присваиваются переменной или константе или когда они передаются функции. Вместо копии используется ссылка на тот же существующий экземпляр.

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
// Поскольку классы являются Reference Types, tenEighty и alsoTenEighty на самом деле ссылаются на один и тот же экземпляр VideoMode. По сути, это просто два разных имени для одного и того же экземпляра.

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

// Identity Operators (Операторы идентификации)
// Идентичен (===), Не идентично (!==)
// Используйте эти операторы, чтобы проверить, относятся ли две константы или переменные к одному и тому же экземпляру:

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// Обратите внимание, что идентичный (представленный тремя знаками равенства или ===) не означает то же самое, что и равный (представленный двумя знаками равенства или ==). Идентичен означает, что две константы или переменные типа класса ссылаются на один и тот же экземпляр класса. Равно означает, что два экземпляра считаются равными или эквивалентными по значению для некоторого подходящего значения равенства, определенного разработчиком типа.
