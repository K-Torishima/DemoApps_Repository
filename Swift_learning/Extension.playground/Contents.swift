import Foundation
// Extention
// 既存機能の拡張
// クラス、構造体、列挙体に新しいメソッドやプロパティを追加する

class Student {
    var name = "koji"

    func printName() {
        print(name)
    }
}

extension Student {
    func updateName(newName: String) {
        name = newName // 引数で受け取った新しい名前で上書き
        print(newName)
    }
}

var student = Student()
student.printName()
student.updateName(newName: "tanaka")

extension Student {
    var nameCount: Int {
        get {
            return name.count
        }
    }
}
print(student.nameCount)

struct Size {
    var width = 0.0
    var height = 0.0
}
struct Point {
    var x = 0.0
    var y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let menberwireRect = Rect(origin: Point(x: 2.0, y: 2.0),
                          size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
