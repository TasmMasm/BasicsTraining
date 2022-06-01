// Methods


// mutating - метод, который меняет property
struct Point {
    var x: Int
    var y: Int
    /*
    mutating func movebyX(x: Int, andY y: Int) {
        self.x += x
        self.y += y
    }
     
     */
    mutating func movebyX(x: Int, andY y: Int) {
        self = Point(x: self.x + x, y: self.y + y)
    }
}
/*
enum Color {
    case White
    case Black
    
    mutating func invert() -> Color {
        if self == White {
            self = Black
        } else {
            self = White
        }
    //    self = self == White ? Black : White
        return self
    }
    func invert() {
        if self == White {
            print("White")
        } else {
            print("Black")
}
*/



func move(point: inout Point, byX x: Int, andY y: Int) -> Point {
    point.x += x
    point.y += y
    return point
}

var p1 = Point(x: 1, y: 1)
var p2 = Point(x: 2, y: 2)

// p = move(point: &p, byX: 2, andY: 4)

p1.movebyX(x: 5, andY: 7)
// в методе первый параметр идет внутренний, а остальные - внешний

p1
p2

// существует метод самого типа

