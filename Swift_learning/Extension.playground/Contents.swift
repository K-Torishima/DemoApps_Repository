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
