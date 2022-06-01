struct Famaly {
    
    var father = "Father"
    var mother = "Mother"
    var kids = ["Kid1", "Kid2", "Kid3",]
    
    var count: Int {
        return 2 + kids.count
    }
    
    subscript(index: Int) -> String? {
        get {
            switch(index) {
            case 0: return father
            case 1: return mother
            case 2..<(2 + kids.count): return kids[index - 2]
            default: return nil
            }
        }
        // get {} можно сдесь убрать
        
        set {
            
            let value = newValue ?? ""
            
            switch(index) {
            case 0: return father = value
            case 1: return mother = value
            case 2..<(2 + kids.count): return kids[index - 2] = value
            default: break
            }
        }
    }
    subscript(index: Int, suffix: String) -> String? {
        var name = self[index] ?? ""
        name += " " + suffix
        return name
    }
}

var famaly = Famaly()
famaly.father
famaly.mother
famaly.kids[0]
famaly.count

famaly[0]
famaly[1]
famaly[2]
famaly[3]
famaly[4]
famaly[5]

famaly[0] = "Daddy"
famaly.father

famaly[3] = "Buddy"
famaly.kids[0]
famaly.kids[1]
famaly.kids[2]
famaly

famaly[3, "the great"]!

// subscript - не Stored Properties, а идентичен Computed Properties
// в следующем примере (в какое-нибудь поле, как в шахматной доске, вставить значение) для хранения данных будем использовать var dict = [String: String]()

struct Field {
    
    var dict = [String: String]()
    
    func keyForColumn(column: String, andRow row: Int) -> String {
        return column + String(row)
    }
    
    subscript(column: String, row: Int) -> String? {
        get {
            return dict[keyForColumn(column: column, andRow: row)]
        }
        set {
            dict[keyForColumn(column: column, andRow: row)] = newValue
        }
    }
}

var field = Field()
field["a", 5]
field["a", 5] = "X"
field["a", 5]
field["a", 6]




