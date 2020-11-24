import Foundation

// Class 参照型のデータ構造
// 参照型、継承できる
// 構造体と列挙体と違うは　プロパティやメソッドの文法、初期化のフローなどが違う
//　上記は継承を考慮するため
//　CocoaフレームワークのほとんどはClassで定義されている

class SomeClass {
    let id: Int
    let name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }

    func printName() {
        print(name)
    }
}

let instane = SomeClass(id: 1, name: "name")
instane.printName()
