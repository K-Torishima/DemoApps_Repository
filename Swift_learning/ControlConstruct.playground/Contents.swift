import Foundation

// 条件分岐
// if
// guard
// switch

// if - 条件の成否による分岐
/*
if 条件式　{
    条件式がtrueの時に実行される
}
*/

let val = 2

if val <= 3 {
    print(val)
}

let val2 = 1

if val > 0 {
    print(val)
}

// else

/*
if 条件式　{
 条件式がtrueの場合実行される
 } else {
 条件式がfalseの場合実行される
 }
 */
let value = 4

if value <= 3 {
    print("valueは3以下です")
} else {
    print("valueは3より大きいです")
}

/*
 if joken1 {

 joken1 true

 } else if joken2 {

 joken false

 } else {
 joken1 to joken2 false
 }
*/

let valA = 2

if valA < 0 {
    print("val is under the 0")
} else if valA <= 3 {
    print("val is 0 ~ 3")
} else {
    print("valは３より大きい")
}

// if let
/*
 基本的にはオプショナルバインディングの時に使う
 値の取り出しもできる
if let aaa = Optional<Wrapped>型の値　{
    値が存在する場合に実行される文
}　else {
    値が存在しない場合に実行される文
}
 */

let optionalA = Optional(1)
if let a = optionalA {
    print("値は\(a)です")
} else {
    print("値が存在しません")
}

// if let は複数のOptional<Wrapped>型の値を同時に取り出すことができます
// Optional<Wrapped>型の値を右辺に持つ定数定義を　, で区ぎって並べると全ての右辺が値を持っていたのみ　if文の実行文が実行されます

let optional1 = Optional("a")
let optional2 = Optional("b")

if let a = optional1, let b = optional2 {
    print("値は\(a)と\(b)です")
} else {
    print("どちらの値が存在しません")
}

// ダウンんキャストができる

let a: Any = 1

if let int = a as? Int {
    print("値はInt型の\(int)です")
}

// if letはで宣言された定数は　{} の中のみで使用できる
// スコープの外でアクセスはできない

// guard
/*
 guard 条件式　else {
 条件式がfalseの場合に実行される文
 guard文が記述されているスコープの外に退出する必要がある
 }

 */

func someFunction() {
    let value = -1

    guard value >= 0 else {
        print("0未満です")
        return
    }
}
someFunction()

//　スコープ外への退出の強制
// guard 文のelse 節ではguard文が含まれるスコープから退出しなければならない
// スコープからの退出はコンパイラによってチェックされているためguard文のelse節以降ではguard文の条件式が必ず成り立っていることがコンパイル時に保証される
// Int型の引数が０よりも大きくなければguardから退出する
//　必ず０以上でなければならない
func printIfPositve(_ a: Int) {
    guard a > 0 else {
        return
    }
    print(a)
}
printIfPositve(0)

// guard文で宣言された変数や定数へのアクセス

func some() {
    let a: Any = 1

    guard let int = a as? Int else {
        print("aはInt型ではありません")
        return
    }

    // int はguard文以降でも仕様可能
    print("値はInt型の\(int)です")
}

// if文との使い分け
// if文の場合
func add(_ optionalA: Int?, _ optionalB: Int?) -> Int? {
    let a: Int
    let b: Int

    if let unwappedA = optionalA {
        a = unwappedA
    } else {
        print("第一引数に値が入っていせん")
        return nil
    }

    if let unwappedB = optionalB {
        b = unwappedB
    } else {
        print("第二引数に値が入っていません")
        return nil
    }
    return a + b
}
add(Optional(1), Optional(2))


// guardの場合
func add2(_ optionalA: Int?, _ optionalB: Int?) -> Int? {

    guard let a = optionalA else {
        print("第1引数に値が入っていせん")
        return nil
    }

    guard let b = optionalB else {
        print("第2引数に値が入っていせん")
        return nil
    }

    return a + b
}

// switch

let num = 1

switch num {
case Int.min ..< 0:
    print("aは負の値です")
case 1 ..< Int.max:
    print("aは正の数です")
default:
    print("aは0です")
}

// ケースの網羅チェック
enum SomeEnum {
    case foo
    case bar
    case baz
}

let someEnum = SomeEnum.foo
// somEnumを網羅すること
switch someEnum {
case .foo:
    print("foo")
case .bar:
    print("bar")
case .baz:
    print("baz")
}

let aA = true

switch aA {
case true:
    print("true")
case false:
    print("false")

}

// デフォルトは極力使わない
//　新たに追加された時網羅できなくなってしまうから

// where ケースにマッチする条件の追加

let numA: Int? = 1

switch numA {
case .some(let a) where a > 10:
    print("10より大きい値\(a)が存在する")
default:
    print("値が存在しない、もしくは10以下です")
}

// break ケースの実行の中断

let numB = 1

switch numB {
case 1:
    print("実行される")
    break
    // print("実行されない")
default:
    break
}


// breakの制御対象の指定  ラベル
// break文の制御対象をしてするための仕組みです

// 例
// Any型の値が１から１０までのInt型の値であれば、その値が奇数か偶数かを出力するプリグラム

let valueA = 0 as Any

// Label: switch
outerSwitch: switch valueA {
case let int as Int:
    let description: String
    switch int {
    case 1,3,5,7,9:
        description = "奇数"
    case 2,4,6,8,10:
        description = "偶数"
    default:
        print("対象外の値です")
        break outerSwitch
    }
    print("値は\(description)です")
default:
    print("対象外の方の値です")
}

// fallthrough文
// switch文のケースの実行を終了し、次のケースを実行する制御構文。　fallthrough文は fallthroughキーワードのみで構成されている

let mumAA = 1

switch mumAA {
case 1:
    print("case 1")
    fallthrough
case 2:
    print("case 2")
default:
    print("default")
}

// 繰り返し
// for in while

// for in シーケンスの要素の列挙

let array = [1,2,3]

for element in array {
    print(element)
}

let dic = ["a": 1, "b": 2]

for (key, value) in dic {
    print("key: \(key), value\(value)")
}

// while 継続条件の繰り返し
// bool で判定　trueで繰り返しを継続する　falseで繰り返しを停止　while全体の処理を終了

//var aaa = 1

//while aaa < 4 {
//    print(aaa)
//    aaa + 1
//}

// repeat - while　初回実行を保証する繰り返し

/*
repeat {
 一回は必ず実行される、それ以降は条件式が成立する限り繰り返し実行される文
 } while 条件式
 */


var aaaa = 1

// こっちはじっこされない
//while aaaa < 1 {
//    print(aaaa)
//    aaaa + 1
//}

// こっちは実行される
//repeat {
//    print(aaaa)
//    aaaa + 1
//} while aaaa < 1

// 実行中断
// break
// 配列に　”２”が存在するか検証するプログラム
// ”２”があった時点で、後続の繰り返しを行う必要はないので、breakし繰り返しを終了する

var containsTwo = false
let arrayA = [1,2,3]

for element in arrayA {
    if element == 2 {
        containsTwo = true
        break
    }
    print("element: \(element)")
}

print("containsTwo: \(containsTwo)")

// continue　繰り返しの継続
// 実行中断した後、継続の繰り返しを継続する
// 特定の場合だけ処理をスキップする

var odds = [Int]()
let arrayB = [1,2,3]

for element in arrayB {
    if element % 2 == 1 {
        odds.append(element)
        continue
    }
    print("even: \(element)")
}

print("odds: \(odds)")

// breakとは違い後続の繰り返しは継続され、全ての要素に対して、処理が行われる

// breakとcontineにもLabelをつけれる
// break: label
// contine: label

label: for elem in [1,2,3] {
    for nestElm in [1,2,3] {
        print("elem: \(elem), nestElm\(nestElm)")
        break label
    }
}

// 実行結果が１つしか表示されていない、初回実行で外側の繰り返しが終了している

// 遅延実行
// defer

var count = 0

func someFunc() -> Int {
    defer {
        count += 1
    }
    return count
}

someFunc()
count
