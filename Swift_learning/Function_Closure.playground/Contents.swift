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
 { (引数1：型、引数２：型）->　戻り値　in
 　　クロージャーの実行時に実行される文
 必要に応じてreturn文で戻り値を返却する
}
 */

// Int型の引数を一つ取り、それを２倍したInt型の戻り値を返す（Int）→ Int型のクロージャーを実行している

let doubleA = {(x: Int) -> Int in
    return x * 2
}
doubleA(2) // 4

// クロージャーの型は通常の方と同じように扱えるので、変数や定数の型や、関数の引数の方としても利用することができる

let closure: (Int) -> Int
func someFunctionAA(x: (Int) -> Int) {}

closure = { int in
    return int * 2
}
closure(1)

//   型推論

var closureA: (String) -> Int

// 引数と戻り値を明示した場合
closureA = { (str: String) -> Int in
    return str.count
}
closureA("abc") // 3

//　省略した場合

closureA = { str in
    return str.count * 2
}
closureA("abc") // 6

// 型が決まってないとerror
// Unable to infer type of a closure parameter 'str' in the current context
//let butClosure = { str in
//    return str.count * 2
//}


// 実行方法
//　呼び出し方は関数と同じ
//　クロージャーが代入されている変数名や定数名の末尾に（）をつけて（）内に引数を　’,’ 区切りで並べる
//　戻り値は変数や定数に代入される
//　let 定数名　＝　変数名（引数１、引数２）

// クロージャーが代入された変数や定数の方は、クロージャーの型として型推論さる

// stringの数をカウントしている
// やってることは同じでも書き方が違う

let lengthOfString = { (string: String) -> Int in  // (String) -> Int
    return string.count
}
lengthOfString("abcdefghijklmnopqrstuvwxyz") // 26


func lengthOfStringA(_ string: String) -> Int {
    return string.count
}
lengthOfStringA("abcdefghijklmnopqrstuvwxyz") // 26

// 引数
//　クロージャーは、外部引数とデフォルト引数が使えない
// 引数省略しているのと同じ

let add = { (x: Int, y: Int) -> Int in
    print(x + y)
    return x + y
}
add(1,2) // 3

func addFunc(_ x: Int, _ y: Int) -> Int {
    print(x + y)
    return x + y
}

addFunc(1, 2) // 3

// 簡略引数 引数名の省略
// $0 とか　$1が使える

let isEqual: (Int, Int) -> Bool = {
    return $0 == $1
}

isEqual(1,1) // true
isEqual(2,1) // false

let keisan: (Int, Int) -> Int = {
    return $0 + $1
}
keisan(1,2) // 3

// 簡略引数を使う場合、クロージャーの定義内では引数の型を指定しないため、外部からの型推論できない場合はerrorになる

// むやみに使うと、引数が何を意味しているのかわからない可読性の低いCodeになりがちだが、
// 非常にシンプルにできるので、積極的に使う方が良い

let numbers = [10,20,30,40]
// 公式
// func filter(_ isIncluded: (Int) throws -> Bool) rethrows -> [Int]
// filter(isIncluded: (Int) throws -> Boo)

// 下記はやっていることは同じだけど、省略しているので読みやすい

let aaaaaa = numbers.filter { val -> Bool in
    val > 20
}
let bbbbbb = numbers.filter { val in
    val > 20
}
let moreThenTwenty = numbers.filter { $0 > 20 }

aaaaaa          // [30, 40]
bbbbbb          // [30, 40]
moreThenTwenty  // [30, 40]

// 戻り値
//　なし
let emptyReturnValueClosure: () -> Void = {}
// 一つあり
let singleReturnValueClosure: () -> Int = { return 1 }
// () とVoidは同じだが、クロージャーの場合戻り値がない場合はVoidを使う
// ❌ () -> ()
// ❌ Void -> Void
// ⭕️ () -> Void

// クロージャーによる変数と定数のキャプチャ

/*
通常ローカルスコープで定義された変数や定数はローカルスコープ外では使用できない、
 一歩クロージャーで参照している変数や定数は
 クロージャーが実行されるスコープが、変数や定数が定義されたローカルスコープ以外であっても
 クロージャーの実行時に利用できる
 これは、クロージャーが自身で定義されたスコープの変数や定数へ参照を保持しているため、
 これをキャプチャという

 */

let greeting: (String) -> String
/*-----------------------------*/
do {
    let symbol = "!"
    greeting = { user in
        return "Hello, \(user)\(symbol)"
    }
}

greeting("koji") // "Hello, koji!"
//　symbol ::: symbolは別スコープで定義されているためerror
//　Cannot find 'symbol' in scope

//　定数　greeting　はdoスコープ外で宣言されているためdoの外でも使用できるが、
//　定数　symbol　は do のスコープ内で宣言されているため外で使えない
//　しかし定数greetingに代入されたクロージャーは内部でsymbolを利用しているにもかかわらず、doの外で実行できる
//　これは、クロージャーがキャプチャによって、自分自身が定義されたスコープの変数や定数への参照を保持することで実現されている
//　キャプチャの対象は変数や定数に入っている値ではなく、その変数や、定数自信である
//　したがって、キャプチャされている変数への変更はクロージャーの実行にも反映される。
//　例
//　以下　定数　counterに代入されたクロージャ は、実行のたびに変数countの値を１増やす
//　変数countの初期値は０ですが、変数そのものをキャプチャしているため、変数に対する更新も保持されます
// そのため、実行するたびに異なる値となる

let counter: () -> Int

do {
    var count = 0
    counter  = {
        count += 1
        return count
    }
}

counter() // 1
counter() // 2
counter() // 3
counter() // 4
counter() // 5

// 引数としてのクロージャ
//　クロージャーを関数や別のクロージャ の引数として利用する場合のみ有効な仕様として、
//　属性とトレイリングクロージャ がある
//　属性はクロージャ に対して指定する追加情報
//　トレイリングクロージャ は引数にとる関数の可読性を高めるための仕様

//　属性の指定
/*
 属性は2つある

  - escaping
  - autoclosure

func 関数名(引数：＠属性名　クロージャ の型名）{
 関数呼び出し時に実行される文
 }

 */

//func or(_ lhs: Bool, _ rhs: @autoclosure () -> Bool) -> Bool {
//    if lhs {
//        return true
//    } else {
//        return rhs()
//    }
//}
//
//or(true, false) // true

//　escaping
// 非同期的に実行されるクロージャー
/*
 関数引数として渡されたクロージャーが、関数のスコープ外で保持される可能性があることを示す属性
 コンパイラはescaping属性の有無によってクロージャ がキャプチャを行う必要があるかを判別します
 クロージャ が関数のスコープ外で保持される可能性がある場合、つまり、escaping属性が必要な場合は、
 クロージャ の実行時までの関数のスコープ外で保持する必要があるため、キャプチャが必要となります。

 */

var queue = [() -> Void]()

//　引数として与えられたクロージャ を配列queueに追加します
//　つまり　この引数のクロージャ はスコープ外で保持される
//　そのためenqueue関数の引数には　escaping属性を指定する必要があります
//　指定しない場合はコンパイルエラーになる
func enqueue(operation: @escaping () -> Void) {
    queue.append(operation)
}

enqueue {
    print("executed")
}
enqueue {
    print("executed")
}
queue.forEach { $0() }

//escaping属性がされていないクロージャ は関数のスコープ外で保持できない
//　クロージャの実行は関数スコープ内で行わなければならない
//　executeTwice関数に渡されたクロージャ は　escaping属性がしていませんが関数のスコープ内のみで実行されるため、コンパイルerrorにならない
func executeTwice(operation: () -> Void) {
//　ここで実行されている
    operation()
    operation()
}

executeTwice {
    print(("executed"))
}


//　autocloseure　クロージャを用いた遅延評価
//　引数をクロージャで包むことで、遅延評価を実現するための属性

// Bool型の引数を２つ取り、その論理和を返すor関数
//　論理和を求める　｜｜演算子と同じ挙動をする関数


func or(_ lhs: Bool, _ rhs: Bool) -> Bool {
    if lhs {
        print("true")
        return true
    } else {
        print(rhs)
        return rhs
    }
}

or(true, false)

//　第一引数にはlhs()
// 第二引数にはrhsを戻り値にする
//　lhsとrhsの関数の内部ではprintを実行して、それぞれの関数が実行されたかどうかが確認できるようにしています


func orA(_ lhs: Bool, _ rhs: Bool) -> Bool {
    if lhs {
        print("true")
        return true
    } else {
        print(rhs)
        return rhs
    }
}

func lhs() -> Bool {
    print("lhs()が実行されました")
    return true
}

func rhs() -> Bool {
    print("rhs()が実行されました")
    return false
}

orA(lhs(), rhs())

// トレイリングクロージャ  引数のクロージャを（）のそとに記述する記法

/*
 トレイリングクロージャとは関数の最後の引数がクロージャの場合にクロージャを（）のそとに書くことでできる記法です
 */

func execute(parameter: Int, handler: (String) -> Void) {
    handler("parameter is \(parameter)")
}

// トレイリングクロージャを使用しない場合
execute(parameter: 1, handler: { string in
    print(string)
})

//　トレイリングクロージャを使った場合
execute(parameter: 2) { print($0) }

//　引数が一つの場合関数呼び出しの（）も省略できる

func executeA(handler: (String) -> Void) {
    handler("executed")
}

//　同じ
executeA { valure in
    print(valure)
}
//　同じ
executeA { print($0) }

// クロージャとしての関数
/*
関数はクロージャの一種であるため、クロージャとして扱えます、関数をクロージャとして利用するには、関数名だけのしきで関数を参照する
関数をクロージャとして扱うことで、関数や変数や定数に代入したり、別の関数の引数を渡したりすることができる

 let 定数名　=  関数名
 式には引数まで含まれることができ、次のようにかける

 let 定数名　= 関数名(引数名１:引数名２:)
 */

func doubleA(_ x: Int) -> Int {
    return x * 2
}

let function = doubleA
function(43)

// 関数の引数となるクロージャを関数として定義しておくことで、重複したクロージャを一つまとめたり、
//　クロージャに対して意味のある名前をつけたりすることができます

//　関数の引数となるクロージャを関数として定義しない場合について考えてみる
//　Array<Element>型のmapを使って、　{ $0 * 2 } というクロージャを二回使用している
//　map メゾッドはクロージャで指定した処理によってそれぞれが変換された新しいコレクションを返す

let array1 = [1,2,3]
let doubleArray1 = array1.map { $0 * 2 }

let array2 = [4,5,6]
let doubleArray2 = array2.map { $0 * 2 }

doubleArray1
doubleArray2

// 関数をクロージャとして扱うことで、上記の例を次のように書き換えられる

func doubleB(_ x: Int) -> Int {
    return x * 2
}

let array1B = [1,2,3]
let doubleArray1A = array1B.map(doubleB)

let array2B = [4,5,6]
let doubleArray2A = array2B.map(doubleB)

// 関数としてクロージャを定義することで、重複した　{ $0 * 2 } という処理を１箇所にまとめる
//　doubleBという処理の内容を与えることもで切るので、より可読性のたかいコードになる


//　クロージャ式を利用した変数や定数の初期化
//　クロージャ式を利用すると、複雑な値の初期化を把握しやすくできるケースがある

//　３x３のマス目を表現する型の実装をするとする
//　2次元配列でマスをモデル化し、各ますの値をリテラルで直接定義しています。

var board = [ [1,1,1], [1,1,1], [1,1,1] ]
board

// この二次元配列直接定義する代わりに、二次元配列を生成する手続きを記載することを考える
//　１が３つ入った行を３つ生成することで、３X３のマス目を生成する
//　Array<Element>型のイニシャライザinit(reqwationg:count) は、repeatingの引数をcountの数だけ追加した値を生成します

var boardA = Array(repeating: Array(repeating: 1, count: 3), count: 3)
boardA // [[1, 1, 1], [1, 1, 1], [1, 1, 1]]
//　これで配列の要素一つ、一つを明記する必要がなくなりました。
//　変数の初期化の式を一つにまとめるためにArray<Element>型の生成の式を入れ子にしたため、構造を把握するのが難しくなりました。
//　また。３という固定値を２箇所で管理する必要が出てきてしまう

//　クロージャ式を用いると、一連の初期化の手続きの実装を一つの式とすることができます、次の例では、入れ子になっていた式それぞれを用いると、一連の初期化の手続きの実装を一つの式とすることができる、
//　次の例では、入れ子になった式をそれぞれ定数rowと boardに代入しており、それぞれがどのように生成されるのかが把握しやすくなります
//　また、一辺のマス目の数も定数として、宣言してから使用しているため、管理を一元化できる

var boardB: [[Int]] = {
    let sideLength = 3
    let row = Array(repeating: 1, count: sideLength)
    let board = Array(repeating: row, count: sideLength)
    return board
}()

boardB  // [[1, 1, 1], [1, 1, 1], [1, 1, 1]]


// 上記のようにすれば、変数や定数の初期化処理が複雑でも、その初期値がどのように生成されるのか把握しやすくなる

