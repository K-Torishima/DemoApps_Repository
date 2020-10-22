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
