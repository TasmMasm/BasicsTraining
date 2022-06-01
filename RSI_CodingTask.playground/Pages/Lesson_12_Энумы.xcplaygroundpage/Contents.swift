// Enumerations (Перечисления)

// создаем свой тип значения (аналогично Int, String и т.д.)
/*
enum Action {
    case Wolk(meters: Int)
    case Run
    case Stop
    case Turn
}

var action = Action.Run
// теперь переменная action имеет свой тип значения (value type) Action - Action.Run и этой переменной можно присваивать другие типы значений Action:

action = Action.Stop
// может тип находится в типе (многоуровневый)
// можно так сократить запись:
action = .Wolk
*/

// Associated Values (Связанные/ассоциированные значения)
// Иногда полезно иметь возможность хранить значения других типов вместе с этими значениями case - case Run(meters: Int, speed: Int). Эта дополнительная информация: (meters: Int, speed: Int) называется ассоциированным значением и меняется каждый раз, когда вы используете этот регистр в качестве значения в своем коде:

/*
enum Action {
    case Wolk(meters: Int)
    case Run(meters: Int, speed: Int)
    case Stop
    case Turn
}

var action = Action.Run(meters: 20, speed: 15)

//action = .Stop
//action = .Wolk(meters: 50)


switch action {
case .Stop: print("Stop")
//case .Wolk(let meters): print("walk \(meters) meters")
// так как забайдили ассоциативное значение .Wolk - (let meters), чтобы добраться до его значения можно дальше использовать условие, например where:
case .Wolk(let meters) where meters < 100:
    print("short walk")
case .Wolk(let meters):
    print("long walk")
case .Run(let m, let s):
    print("run \(m) meters with speed \(s)")
default: break
}
*/


/*
enum Direction {
    case Left
    case Right
}

enum Action {
    case Turn(direction: Direction)
    case Run(meters: Int, speed: Int)
}

var action = Action.Run(meters: 100, speed: 20)

action = .Turn(direction: .Left)

switch action {
case .Turn(let dir) where dir == .Left:
    print("Turn left")
case .Turn(let dir) where dir == .Right:
    print("Turn right")
default: break
}
*/

// выше был пример двохуравневого enum, а можно было сделать так:
/*
enum Action {
    case Run(meters: Int, speed: Int)
    case Turn(direction: Direction)
    enum Direction {
        case Left
        case Right
    }
}

var action = Action.Run(meters: 100, speed: 20)
// action = .Turn(direction: Action.Direction.Left) или так:
action = .Turn(direction: .Left)
*/

// Raw Values (Сырые/необработанные значения), это не просто enum, а он от чего-то наследуется, например от String:


enum Direction: String {
    case Left = "Left!"
    case Right = "Right!"
}

enum Action {
    case Run(meters: Int, speed: Int)
    case Turn(direction: Direction)
}

var action = Action.Run(meters: 100, speed: 20)

print(Direction.Left)
// а здесь уже выводит "настоящее" значение:
print(Direction.Left.rawValue)

var direction = Direction(rawValue: "Right!")!
// ! необходимо обязательно анрапнуть (см. выше)
action = .Turn(direction: direction)

// ДЗ
// Задание №1 сделать энум с шахматными фигурами (все) и каждый энум должен иметь Associated Values - цвет (белый/черный), буква/цифра по размещению и иницилизировать несколько фигур (переместили по доске) и черному королю был мат
// Задание №2 положить все фигуры в массив и каждая фигура должна иметь тип Raw Values и тип String (слон, королева и т.д.), должна быть одна функция, которая принимает одну фигуру (тип фигуры, цвет и позицию) и функция, которая принимает массив фигур и для каждой фигуры вызывает ту функцию. Нужно в консоле вывесть логи: белый король e1, белая пешка a2
// Задание №3 создать функцию, которая будет рисовать доску, функция, которая принимала массив и рисовала доску в принте, если на клетке ничего не стоит, то рисовала клетку (белую или черную), а где стоят фигуры, там черный король или т.д. (мат из Задание №1 показалась в принте)
// Задание №4 функция, которая прнимает шахматную фигуру, как один параметр, а второй параметр она должна принимать тюпл (буква и цифра - это новая позиция на шахматной доске), т.е. функия, которая будет двигать фигуру (и не двигать, если фигура не может двигаться на какую-нибудь координату за пределами доски и внутри) и вызвать функцию для несколько фигур и передвинули на другое место и распечатать доску (ситуация до мата с выводом позиций в мате)



