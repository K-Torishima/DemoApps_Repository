import Foundation

// 処理を一まとまりにできる
// 関数はクロージャーの一種である
// 切り出して処理を書くことによって、メンテナンス性や可読性を高められる

// function

/*
func 関数名(引数名: Type, 引数名: Type ...) -> 戻り値の型 {
    関数呼び出し時に実行される文
    必要に応じてreturn文で戻り値を返却する
}

 */

func double(_ x: Int) -> Int {
    return x * 2
}

double(2) // 4

// 実行方法
// let 定数名　＝　関数名（引数名１：引数１、引数名２：引数２...）

func functionWithDiscardResult() -> String {
    return "Discardable"
}

_ = functionWithDiscardResult() // Discardable

// 引数

func printInt(_ int: Int) {
    print(int)
}

printInt(1) // 1

// 外部引数名と内部引数名
// 外部引数　＝　呼び出し時に使用
// 内部引数　＝　関数内で使用されるもの
/*
 func 関数名（内部引数：　型、　外部引数　内部引数：型）{}
 */


func invite(user: String, to group: String) {
    print("\(user) is invited to \(group)")
}

invite(user: "torishima", to: "kendo club")

// 外部引数の省略　_ これを使用

func sum(_ int1: Int, _ int2: Int) -> Int {
    return int1 + int2
}

sum(10, 10) // 20

// デフォルト引数
// なんでも入れられる

func greet(user: String = "Anonymos") {
    print("Hello \(user)")
}

greet() // Hello Anonymos
greet(user: "koji torishima") // Hello koji torishima

// 検索ワード、ソートキー、昇順かどうかを指定する３つの引数を持っているが、
// 必要なものは検索キーワードだけなので、必要ない引数にはデフォを設定できるため、
// 単に検索キーワードだけで検索したい場合、ソートキーなども指定して検索したい時も、一つの関数で対応できる
func search(byQuery query: String,
            sortKey: String = "id",
            ascending: Bool = false) -> [Int] {
    return [1, 2, 3]
}

search(byQuery: "query")

// インアウト引数
// 関数内での引数への再代入を関数外で行うときは　inout をつける　つけないとerror
// 仮値で入れられる
// inout引数を呼び出すには＆をつける
// つけない時のerror ：Passing value of type 'String' to an inout parameter requires explicit '&'
func greetA(user: inout String) {
    if user.isEmpty {
        user = "Anonymos"
    }
    print("Hello \(user)")
}
var user: String = ""
greetA(user: &user)

// 可変長引数　任意の個数の値を受け取る引数
// メリット　関数の呼び出し側に配列であることを意識させない
// 一つのfunctionに一つまで
//　Array型になる

func printA(strings: String...) {
    if strings.count == 0 {
        return
    }

    print("first: \(strings[0])")

    for str in strings {
        print("element: \(str)")
    }
}

printA(strings: "abc", "def","ghi")

//first: abc
//element: abc
//element: def
//element: ghi

// 引数チェック

func stringA(from: Int) -> String {
    return "\(int)"
}

let int = 1
let double = 1.0

let str1 = stringA(from: int)
// let str2 = stringA(from: double) // error
// Cannot convert value of type 'Double' to expected argument type 'Int'

// 戻り値
// return なし
func greetB(user: String) {
    print("Hello \(user)")
}

greetB(user: "tanaka")
// 上記と同じ

func greetC(user: String) -> Void {
    print("Hello \(user)")
}
greetC(user: "tanaka")

// 暗黙的　return
// 戻り値のみの場合　return 省略きる
func makeMassage(toUser user: String) -> String {
    "Hello, \(user)"
}

// これはerror
// Missing return in a function expected to return 'String'
/*
 戻り値以外もある場合　return は省略できない
func makeMassage1(toUser user: String) -> String {
    print(user)
    "Hello, \(user)"
}
 */

//　クロージャー
/*
 スコープ内の変数や定数の保持した一まとまりの処理
 
 */
