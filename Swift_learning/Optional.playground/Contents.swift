import Foundation
// Optional<Wrapped>型
/*
 - 値があるか空かいずれかを表す型
 - 基本的にはnilは許容しないが許容する場合はOptionalを使う
 - Wrappedはプレースホルダー型という
 - Wrappedを具体的な型に置き換えて使用
 - <> これはジェネリティクス
 */


//enum Optional<Wrapped> {
//    case uone
//    case some(Wrapped)
//}


let none = Optional<Int>.none
print(".none: \(String(describing: none))")
let some = Optional<Int>.some(1)
print(".some: \(String(describing: some))")

// 型推論

let some2 = Optional.some(1) // Optional<Int>
let none2: Int? = Optional.none // Optional<Int> nil

// .someは型推論できる　.noneは型指定しないとダメ Error

var a: Int?
a = nil         // nilリテラル代入による.noneの生成
a = Optional(1) // イニシャライザによる.someの生成
a = 1           // 値代入による.someの生成

let opInt: Int? = nil
let opString: String? = nil

print(type(of: opInt), String(describing: opInt))
print(type(of: opString), String(describing: opString))
// Optional<Int> nil
// Optional<String> nil

// イニシャライザによる.someの生成
let opInt2 = Optional(1)
let opString2 = Optional("a")
print(type(of: opInt2), String(describing: opInt2))
print(type(of: opString2), String(describing: opString2))
// Optional<Int> Optional(1)
// Optional<String> Optional("a")

// 値代入による.someの生成
let opInt3: Int? = 1
print(type(of: opInt3), String(describing: opInt3))
// Optional<Int> Optional(1)

// アンラップ
// Optional<Wrapped>型は値を持っていない可能性があるため
// Wrapped型の変数や定数と同じように扱うことができない
// Int?型どうしの演算はerrorになる
let aa: Int? = 1
let bb: Int? = 1
// aa + bb これだとerror

/*
 Optional<Wrapped>型の値が持つWrapped型の値に対する操作を行うには、
 Optional<Wrapped>型の値からWrapped型に取り出す必要がある
 Wrapped型の値を取り出す操作をアンラップと言う
 */
// オプショナルバインディング
// ??演算子
// 強制アンラップ

/*
 - オプショナルバインディング
 条件分岐や繰り返し文の条件にOptional<Wrapped>型の値をしていする
 値の存在が保証させている分岐内では、Wrapped型の値に直接アクセスすることができる
 if-let文

 if let 定数名　Optional<Wrapped>型の値　{
 　値が存在する場合に実行される文
 }
 */

let optionalA = Optional("a") // String?型

if let a = optionalA {
    print(type(of: a)) // optionalAに値があるときのみ実行される
}
// String

// ??演算子
// 値が存在しない場合 defaultの値を表示
let optionalInt: Int? = 1
// let optionalInt: Int? = nil この場合　3が表示させる
let int = optionalInt ?? 3 // 1

// 強制アンラップ
/*
 Optional<Wrapped>型からWrapped型の値を強制的に取り出す方法
 強制的というのは、値が存在しない場合実行Errorになることを意味する
 !演算子を使用
 */

let num1: Int? = 1
let num2: Int? = 1
// 強制アンラップのやりかた
num1! + num2! // 2

/*
 強制アンラップは値がないケースを無視しているので、errorの危険性がある
 多用は避ける
 値の存在がよほど明らかな場合や、
 値が存在しない時はプログラムを終了させたい箇所以外は基本的に使用を避ける
 */

// オプショナルチェイン
// Optional<Double>型からDouble型の isInfiniteプロパティにアクセスするために
// オプショナルバインディングをしている
let optionalDouble = Optional(1.0)
let optionalIsInfinite: Bool?


if let double = optionalDouble {
    optionalIsInfinite = double.isInfinite
} else {
    optionalIsInfinite = nil
}

print(String(describing: optionalIsInfinite))

/*
 オプショナルチェインを使えばアンラップをしないでもWrapped型のプロパティやメソッドにアクセスできます。
 オプショナルチェインを利用する場合はOptional<Wrapped>の四季の後に？に続けて
 Wrapped型のプロパティやメソッド名を記述する
 Optional<Wrapped>の型の変数や定数がnilだった場合?以降に記述されたプロパティやメソッドへのアクセスは行わずに　nilが返却される
 元のOptional<Wrapped>型の式が値を持ってないということは
 アクセス対象のプロパティやメソッドも存在しないということであり返すべき値も存在しないためです
 下記例では上のCodeをオプショナルチェインを使って書き換えたもの　結果はBool?型

 */

let opDouble = Optional(1.0)
let opIsInfinite = opDouble?.isInfinite
print(String(describing: opIsInfinite))

// 下記例はcontainsを呼び出し
// CountableRange<Int>?型の定数optionalRangeの範囲に指定した値が含まれているかどうかを
// 判定しています　結果はBool?値です

let optionalRange = Optional(0..<10)
let containsSeven = optionalRange?.contains(7)
print(String(describing: containsSeven))

// map flatMap

/*
 アンラップしないで値変換するメソッド
 */

// Int?型の定数num3に対して値を2倍にするクロージャーを実行して、
// 結果としてInt?型の値Optinal(34)を受け取っている
let num3 = Optional(17)
let num4 = num3.map { value in
    value * 2
} // 34

type(of: num4) // Optional<Int>.Type

/*
また map を使って別の型に変換できる
 Int?型　num5に対してIntをStringに変換するクロージャーを実行して、結果としてString?の17を受け取る
 */

let num5 = Optional(17)
let num6 = num5.map { val in
    String(val)
} // "17"
type(of: num6)

// flat(Map
// クロージャーの戻り値はOptionalになる

let num7 = Optional("17")
let num8 = num7.flatMap { val in
    Int(val)
}
type(of: num8) // Optional<Int>.Type
// ポイント
/*
 値の有無が不確かな定数に対し、さらに値を返すか定かではない操作を行なっている点です
 ここがflatMapではなくMapの場合
 最終結果は二重にラップ型になってしまいInt??となる
 */

let num9 = Optional("17")
let num10 = num9.map { val in
    Int(val)
}

type(of: num10) // Optional<Optional<Int>>.Type

// この　二重に　不確かな状態を一つにまとめてくれるのがFlatMapである

// 暗黙的アンラップ
// Wrapped!に関して

var aaa: String? = "aaa"
var bbb: String! = "bbb"

print(type(of: aaa))
print(type(of: bbb))
// Optional<String>
// Optional<String>

var ccc: String! = aaa
var ddd: String? = bbb

// 暗黙的アンラップはnilの場合errorになる

let eee: Int! = 1
eee + 1 // Int型ど同様に演算が可能

// var fff: Int! = nil
// fff + 1 // 値が入っていないため実行時Errorが起きる

/*
 Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value: file __lldb_expr_84/Optional.playground, line 224
 Playground execution failed:

 error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).
 The process has been left at the point where it was interrupted, use "thread return -x" to return to the state before expression evaluation.

 */


/*
 まとめ

 - 通常は　バインディング、?? map flatMap を組み合わせて使うのがベター
 - 強制アンラップや暗黙的アンラップは実行時にErrorになるので避ける
 - !を多用しない
 - 常に考える
 
 */
