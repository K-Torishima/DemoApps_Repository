import Foundation

// イニシャライザとは
// 型（クラス、構造体、列挙体）のインスタンスを初期化（initialize）する特殊なメソッドのこと

class User {
    let name: String
    // func 不要
    init(name: String) {
        // すべてのプロパティを初期化する前にインスタンスメソッドを実行することはできない
        // printName() ここはerror
        self.name = name
        printName()
    }
    func printName() {
        print(name)
    }
}

let user1 = User.init(name: "hoge")
let user2 = User(name: "fuga")

// なぜ必要なのか
/*
プロパティが正しく初期化できない場合
 - 型の生合成が取れない
 - メモリ安全ではない
 */

// 下記Codeは不整合なのでerror
// 整合が取れないとerrorになる

//class Book {
//    let name: String
//
//    init(name: String) {
//        // Return from initializer without initializing all stored properties
//        // self.name = name
//    }
//}

