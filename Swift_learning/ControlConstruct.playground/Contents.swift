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
