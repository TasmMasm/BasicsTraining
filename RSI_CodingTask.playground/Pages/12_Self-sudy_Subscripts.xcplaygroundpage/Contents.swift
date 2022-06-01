// Subscripts (Индексы)

// Classes, structures, and enumerations могут определять subscripts, которые являются ярлыками для доступа к элементам-членам коллекции, списка или последовательности. Вы используете subscripts для установки и извлечения значений по индексу, не требуя отдельных методов для установки и извлечения. Например, вы получаете доступ к элементам Array instance как someArray[index], а к элементам Dictionary instance — как someDictionary[key].
// Вы можете определить несколько subscripts для одного типа, и соответствующая перегрузка subscripts для использования выбирается на основе типа значения индекса, которое вы передаете в subscripts. Subscripts не ограничены одним измерением, и вы можете определить subscripts с несколькими входными параметрами в соответствии с потребностями вашего пользовательского типа.


// 1. Subscript Syntax

// Subscripts позволяют запрашивать экземпляры типа, записывая одно или несколько значений в квадратных скобках после имени экземпляра. Их синтаксис похож как на синтаксис instance method, так и на синтаксис computed property. Вы пишете определения subscripts с помощью ключевого слова subscript и указываете один или несколько входных параметров и тип возвращаемого значения так же, как и instance methods. В отличие от instance methods subscripts могут быть доступны для чтения и записи или только для чтения. Это поведение передается геттером и сеттером так же, как и для computed properties:

/*
subscript(index: Int) -> Int {
    get {
        // Return необходимое значение subscript value.
    }
    set(newValue) {
        // Выполните подходящее действие настройки здесь.
    }
}
*/

// Тип newValue совпадает с возвращаемым значением subscript. Как и в случае с computed properties, вы можете не указывать параметр setter’s (newValue). Default parameter с именем newValue предоставляется вашему setter, если вы не предоставили его самостоятельно.
// Как и в случае с read-only computed properties, вы можете упростить объявление subscript только для чтения, удалив ключевое слово get и его фигурные скобки:
/*
subscript(index: Int) -> Int {
    // Return an appropriate subscript value here.
}
*/

// Вот пример реализации subscript только для чтения, который определяет structure TimesTable для представления n-кратной таблицы integers:

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
// Prints "six times three is 18"

// В этом примере создается новый экземпляр TimesTable для представления таблицы умножения на три. На это указывает передача значения 3 в инициализатор structure’s в качестве значения, используемого для параметра множителя экземпляра.
// Вы можете запросить экземпляр threeTimesTable, вызвав его subscript, как показано в вызове threeTimesTable[6]. Это запрашивает шестую запись в таблице умножения на три, которая возвращает значение 18, или 3 умножить на 6.
// ПРИМЕЧАНИЕ!!! Таблица n-раз основана на фиксированном математическом правиле. Неуместно устанавливать для threeTimesTable[someIndex] новое значение, поэтому subscript для TimesTable определяется как subscript только для чтения.


// 2. Subscript Usage

// Точное значение слова «subscript» зависит от контекста, в котором оно используется. Subscripts обычно используются в качестве ярлыка для доступа к элементам-членам коллекции, списка или последовательности. Вы можете реализовать subscripts наиболее подходящим образом для функциональности вашего class or structure.
// Например, Swift’s Dictionary type реализует subscript для установки и извлечения значений, хранящихся в Dictionary instance. Вы можете установить значение в dictionary, указав ключ dictionary’s key type в скобках нижнего индекса и назначив значение dictionary’s value type для subscript:

var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2

// В приведенном выше примере определяется переменная с именем numberOfLegs и инициализируется литералом словаря, содержащим три пары ключ-значение. Предполагается, что тип словаря numberOfLegs — [String: Int]. После создания словаря в этом примере используется присваивание subscript для добавления в словарь String ключа «bird» и значения Int, равного 2.

// ПРИМЕЧАНИЕ!!! Swift’s Dictionary type реализует подписку «ключ-значение» как subscript, который принимает и возвращает optional type. Для приведенного выше dictionary numberOfLegs subscript «ключ-значение» принимает и возвращает значение типа Int? или «optional int». Dictionary type использует optional subscript type, чтобы смоделировать тот факт, что не каждый ключ будет иметь значение, и дать возможность удалить значение для ключа, назначив значение nil для этого ключа.


// 3.Subscript Options

// Subscripts могут принимать любое количество входных параметров, и эти входные параметры могут быть любого типа. Subscripts также могут возвращать значение любого типа.
// Подобно функциям, subscripts могут принимать различное количество параметров и предоставлять default values для своих параметров. Однако, в отличие от функций, subscripts не могут использовать входные параметры.
// Class или structure может предоставить столько реализаций subscript, сколько ему нужно, и соответствующий subscript, который будет использоваться, будет выведен на основе типов значения или значений, содержащихся в квадратных скобках subscript в точке, где используется subscript. Это определение нескольких индексов известно как subscript overloading (перегрузка индексов).

// Хотя subscript чаще всего принимает один параметр, вы также можете определить subscript с несколькими параметрами, если это подходит для вашего типа. В следующем примере определяется структура Matrix, представляющая двумерную матрицу значений Double. Matrix structure’s subscript принимает два целочисленных параметра:

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

// Matrix предоставляет инициализатор, который принимает два параметра, называемых rows (строками) и columns (столбцами), и создает массив, достаточно большой для хранения значений rows * columns типа Double. Каждой позиции в матрице присваивается начальное значение 0,0. Для этого размер массива и начальное значение ячейки 0,0 передаются инициализатору массива, который создает и инициализирует новый массив правильного размера.

var matrix = Matrix(rows: 2, columns: 2)

// В приведенном выше примере создается новый экземпляр Matrix с двумя rows (строками) и двумя columns (столбцами). Массив сетки для этого экземпляра Matrix фактически представляет собой сплющенную версию matrix, читаемую сверху слева вниз справа.

// Значения в matrix можно задать, передав значения row и column в subscript, разделенные запятой:

matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

// Эти два оператора вызывают subscript’s setter, чтобы установить значение 1,5 в верхней правой позиции матрицы (где row равно 0 и column равен 1) и 3,2 в нижней левой позиции (где row равна 1, а column равен 0):

// Matrix subscript’s getter и setter содержат утверждение для проверки правильности значений subscript’s row  и column. Чтобы помочь с этими утверждениями, Matrix включает удобный метод indexIsValid(row:column:), который проверяет, находятся ли запрошенные строка и столбец в границах матрицы:
/*
func indexIsValid(row: Int, column: Int) -> Bool {
    return row >= 0 && row < rows && column >= 0 && column < columns
}
*/
// Утверждение срабатывает, если вы пытаетесь получить доступ к subscript, находящемуся за пределами матрицы:

// let someValue = matrix[2, 2]
// This triggers an assert, because [2, 2] is outside of the matrix bounds.


// 4. Type Subscripts

// Instance subscripts, как описано выше, — это subscripts, которые вы вызываете для экземпляра определенного типа. Вы также можете определить subscripts, которые вызываются для самого типа. Этот вид subscript называется type subscript. Вы указываете type subscript, написав ключевое слово static перед subscript keyword (ключевое слово). Вместо этого classes могут использовать ключевое слово class, чтобы позволить subclasses переопределять реализацию этого subscript в superclass’s. В приведенном ниже примере показано, как вы определяете и вызываете type subscript:

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)
let saturn = Planet[6]
print(saturn)
