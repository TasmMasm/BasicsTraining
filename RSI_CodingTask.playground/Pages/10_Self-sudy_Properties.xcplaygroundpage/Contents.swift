// 1. Properties

// Свойства связывают значения с определенным class, structure, or enumeration. Stored properties хранят постоянные и переменные значения как часть экземпляра, тогда как Сomputed properties вычисляют (а не сохраняют) значение. Сomputed properties предоставляются classes, structures, and enumerations. Stored properties предоставляются только классами и структурами.
// Stored and computed properties обычно связаны с экземплярами определенного типа. Однако свойства также могут быть связаны с самим типом. Такие свойства известны как Type Properties.
// Кроме того, вы можете определить property observers (наблюдателей свойств) для отслеживания изменений значения свойства, на которые вы можете реагировать с помощью настраиваемых действий. Property observers могут быть добавлены к stored properties, которые вы определяете сами, а также к свойствам, которые subclass (подкласс) наследует от своего superclass (суперкласса).
// Вы также можете использовать property wrapper (оболочку свойств) для повторного использования кода в getter(ах) (getter - метод получения) и setter(ах) (setter - метод установки) нескольких свойств.


// 2. Stored Properties

//В своей простейшей форме stored properties — это константа или переменная, которая хранится как часть экземпляра определенного класса или структуры. Stored properties могут var и let.
// Вы можете указать default value (значение по умолчанию) для stored properties, как часть его определения. Вы также можете установить (set) и изменить начальное значение для stored property во время инициализации.

// В приведенном ниже примере определяется структура с именем FixedLengthRange, которая описывает диапазон целых чисел, длина диапазона которых не может быть изменена после его создания:

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// диапазон представляет целые значения 0, 1 и 2

rangeOfThreeItems.firstValue = 6
// диапазон теперь представляет целые значения 6, 7 и 8


// 3. Stored Properties of Constant Structure Instances


// Если вы создаете экземпляр структуры как let, вы не можете изменять свойства экземпляра, даже если они были объявлены как var:

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// этот диапазон представляет целые значения 0, 1, 2 и 3

// rangeOfFourItems.firstValue = 6
// это сообщит об ошибке, даже если firstValue является var

// Поскольку rangeOfFourItems объявлен как let, невозможно изменить его свойство firstValue, даже если firstValue является var. Потому что структуры являются value types. Когда экземпляр value types помечен как let, помечены и все его свойства. То же самое не верно для классов, которые являются reference types. Если вы присваиваете let экземпляр reference type, вы все равно можете изменить свойства var этого экземпляра.


// 4. Lazy Stored Properties

// Lazy Stored Properties — это свойство, начальное значение которого не вычисляется до первого использования. Вы указываете lazy Stored Properties, записывая модификатор lazy перед его объявлением.
// Вы всегда должны объявлять lazy property как var, потому что его начальное значение может быть получено только после завершения инициализации экземпляра. Постоянные свойства всегда должны иметь значение (!!!) до завершения инициализации, поэтому их нельзя объявлять ленивыми.
// Lazy property полезны, когда начальное значение свойства зависит от внешних факторов, значения которых неизвестны до завершения инициализации экземпляра. Lazy property также полезны, когда начальное значение свойства требует сложной или ресурсоемкой настройки, которую не следует выполнять до тех пор, пока она не потребуется.


// В приведенном ниже примере Lazy Stored Properties, чтобы избежать ненужной инициализации сложного класса. В этом примере определяются два класса с именами DataImporter и DataManager, ни один из которых не показан полностью:

class DataImporter {
    /*
     DataImporter — это класс для импорта данных из внешнего файла.
          Предполагается, что для инициализации класса требуется нетривиальное время.
    */
    var filename = "data.txt"
    // класс DataImporter предоставит здесь функциональность импорта данных
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
    // класс DataManager будет обеспечивать функциональность управления данными здесь
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// экземпляр DataImporter для свойства importer еще не создан

// Класс DataManager имеет stored property, называемое data, которое инициализируется новым пустым массивом строковых значений. Хотя остальная часть его функций не показана, целью этого класса DataManager является управление и предоставление доступа к этому массиву данных String. Частью функциональных возможностей класса DataManager является возможность импорта данных из файла. Эта функциональность обеспечивается классом DataImporter, который, как предполагается, требует нетривиального времени для инициализации. Это может быть связано с тем, что экземпляру DataImporter необходимо открыть файл и прочитать его содержимое в память при инициализации экземпляра DataImporter. Поскольку экземпляр DataManager может управлять своими данными без импорта данных из файла, DataManager не создает новый экземпляр DataImporter при создании самого DataManager. Вместо этого имеет смысл создать экземпляр DataImporter, если и когда он используется впервые.

// Поскольку он помечен модификатором lazy, экземпляр DataImporter для свойства импортера создается только при первом доступе к свойству importer, например, когда запрашивается его свойство имени файла:

print(manager.importer.filename)
// экземпляр DataImporter для свойства importer теперь создан
// Печатает "data.txt"

// ПРИМЕЧАНИЕ!!! Если к свойству, отмеченному модификатором lazy, одновременно обращаются несколько потоков, и свойство еще не было инициализировано, нет гарантии, что свойство будет инициализировано только один раз.

// 5. Computed Properties

// В дополнение к stored properties, classes, structures, and enumerations могут определять computed properties, которые фактически не хранят значение. Вместо этого они предоставляют getter (геттер) и optional (необязательный) setter (сеттер) для косвенного извлечения и установки других свойств и значений.

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center

// InitialSquareCenter находится в (5.0, 5.0)

square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Печатать "square.origin is now at (10.0, 10.0)"

// В этом примере определяются три структуры для работы с геометрическими фигурами:
// Point инкапсулирует координаты x и y точки.
// Размер включает в себя ширину и высоту.
// Rect определяет прямоугольник по исходной точке и размеру.
// Структура Rect также предоставляет вычисляемое свойство, называемое центром. Текущее центральное положение Rect всегда можно определить по его исходной точке и размеру, поэтому вам не нужно сохранять центральную точку как явное значение Point. Вместо этого Rect определяет собственный геттер и сеттер для вычисляемой переменной с именем center, чтобы вы могли работать с центром прямоугольника, как если бы он был реальным хранимым свойством.
// В приведенном выше примере создается новая переменная Rect с именем Square. Переменная Square инициализируется исходной точкой (0, 0), шириной и высотой 10. Этот квадрат представлен светло-зеленым квадратом на диаграмме ниже.
// Затем доступ к свойству center переменной Square осуществляется с помощью точечного синтаксиса (square.center), что вызывает вызов геттера для center для извлечения текущего значения свойства. Вместо того, чтобы возвращать существующее значение, геттер фактически вычисляет и возвращает новую точку, представляющую центр квадрата. Как видно выше, геттер правильно возвращает центральную точку (5, 5).
// Затем свойству center присваивается новое значение (15, 15), которое перемещает квадрат вверх и вправо в новое положение, показанное темно-зеленым квадратом на диаграмме ниже. Установка свойства center вызывает сеттер для center, который изменяет значения x и y сохраненного исходного свойства и перемещает квадрат в новое положение.


// 6. Shorthand Setter Declaration (упрощенная запись сеттера)

// Если setter computed property не определяет имя для нового устанавливаемого значения, используется имя по умолчанию newValue. Вот альтернативная версия структуры Rect, использующая преимущества этой сокращенной записи:
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}


// 7. Shorthand Getter Declaration (упрощенная запись сеттера)

// Если все тело getter(а) представляет собой одно выражение, то getter по-умолчанию возвращает это выражение. Вот еще одна версия структуры Rect, которая использует преимущества этой сокращенной записи и сокращенной записи для setter(а):

struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
    //  get {
    //      let centerX = origin.x + (size.width / 2)
    //      let centerY = origin.y + (size.height / 2)
    //          return Point(x: centerX, y: centerY)
    //  }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}


// 8. Read-Only Computed Properties

// Computed property с getter(ом), но без setter(а) называется Read-Only Computed Propertie. Read-Only Computed Propertie, всегда возвращает значение, и к нему можно получить доступ с помощью точечного синтаксиса, но нельзя установить другое значение.

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)

print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// Prints "the volume of fourByFiveByTwo is 40.0"


// 9. Property Observers (наблюдатели)

// Property Observers наблюдают и реагируют на изменения в значении свойства. Property Observers вызываются каждый раз, когда устанавливается значение свойства, даже если новое значение совпадает с текущим значением свойства.
// Property Observers можно добавить в следующих местах:
// Stored properties, которые вы определяете
// Stored properties, которые вы наследуете
// Computed properties, которые вы наследуете
// Для унаследованного свойства вы добавляете property observer, переопределяя это свойство в subclass. Для computed property, которое вы определяете, используйте setter, чтобы наблюдать и реагировать на изменения значения, вместо того, чтобы пытаться создать наблюдатель.
// У вас есть возможность определить один или оба этих наблюдателя для свойства:
// willSet вызывается непосредственно перед сохранением значения.
// didSet вызывается сразу после сохранения нового значения.
// Если вы реализуете наблюдатель willSet, ему передается новое значение свойства в качестве постоянного параметра. Вы можете указать имя для этого параметра как часть реализации willSet. Если вы не напишете имя параметра и круглые скобки в своей реализации, параметр будет доступен с именем параметра по умолчанию newValue.
// Точно так же, если вы реализуете наблюдатель didSet, ему передается постоянный параметр, содержащий старое значение свойства. Вы можете назвать параметр или использовать имя параметра по умолчанию oldValue. Если вы присваиваете значение свойству в его собственном обозревателе didSet, новое значение, которое вы присваиваете, заменяет только что установленное.
// ПРИМЕЧАНИЕ!!! Наблюдатели willSet и didSet свойств суперкласса вызываются, когда свойство устанавливается в инициализаторе подкласса после вызова инициализатора суперкласса. Они не вызываются, пока класс устанавливает свои собственные свойства, до вызова инициализатора суперкласса.

// Вот пример willSet и didSet в действии. В приведенном ниже примере определяется новый класс StepCounter, который отслеживает общее количество шагов, которые человек делает во время ходьбы. Этот класс можно использовать с входными данными от шагомера или другого счетчика шагов, чтобы отслеживать физические упражнения человека во время его повседневной жизни.

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()

stepCounter.totalSteps = 200

stepCounter.totalSteps = 360

stepCounter.totalSteps = 896


// 10. Property Wrappers (wrapper - обертка)


// 11. Setting Initial Values for Wrapped Properties


// 12. Projecting a Value From a Property Wrapper


// 13. Global and Local Variables


// 14. Type Properties

// Свойства экземпляра — это свойства, принадлежащие экземпляру определенного типа. Каждый раз, когда вы создаете новый экземпляр этого типа, он имеет собственный набор значений свойств, отдельный от любого другого экземпляра. Вы также можете определить свойства, принадлежащие самому типу, а не какому-то одному экземпляру этого типа. Всегда будет только одна копия этих свойств, независимо от того, сколько экземпляров этого типа вы создадите. Эти виды свойств называются Type Properties (свойствами типа).
// Type properties полезны для определения значений, универсальных для всех экземпляров определенного типа, таких как постоянное свойство, которое могут использовать все экземпляры, или переменное свойство, в котором хранится значение, глобальное для всех экземпляров этого типа.
// Stored type properties могут быть переменными или константами. Computed type properties всегда объявляются как переменные свойства, точно так же, как и computed properties экземпляра.
// ПРИМЕЧАНИЕ!!! В отличие от stored properties экземпляра, stored type properties всегда следует присваивать значение по умолчанию. Это связано с тем, что у самого типа нет инициализатора, который может присвоить значение stored type properties во время инициализации. Stored type properties лениво инициализируются при первом доступе. Они гарантированно будут инициализированы только один раз, даже если к ним одновременно обращаются несколько потоков, и их не нужно помечать модификатором lazy.


// 15. Type Property Syntax


struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

// Приведенные выше примеры computed type property относятся к read-only computed type properties, но вы также можете определить read-write computed type properties с тем же синтаксисом, что и для computed properties экземпляра.
