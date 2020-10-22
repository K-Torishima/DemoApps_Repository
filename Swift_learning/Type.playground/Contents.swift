import UIKit

// Bool

let a: Bool = true
let b: Bool = false
let c: Bool = !a // false

// 理論積

let d = false && false // false
let e = false && true  // false
let f = true  && false // false
let g = true  && true  // true

// 理論和

let h = false || false // false
let i = false || true  // true
let j = true  || false // true
let k = true  || true  // true

// Int

let l = 123 // Int
let m = 1.0 // Double

// 数値型
/*
 - Int8
 - Int16
 - Int32
 - Int64
 */

// 浮動小数点

let n: Double = 123456789.1 // 123456789.1
let o: Float = 123456789.1  // 123456789e+08

// 無限大
let p: Double = 1.0 / 0.0
p.isInfinite // true

let q: Double = Double.infinity
q.isInfinite // true

// 非数

let r: Double = 0.0 / 0.0
r.isNaN // true

let s: Double = Double.nan
s.isNaN // true

// 数値であっても型が違おうとCompileError
// 他の型に変換する場合イニシャライザを使う

let t: Int = 123
let u: Int64 = Int64(t) // Int64に変換

let v: Float = 1.0
let w: Double = Double(v) // Doubleに変換

let x: Float = 1.99
let y: Int = Int(x) // 単数処理　1

let z: Double = 1.23456789
let aa: Float = Float(z) // 1.234568

// 他必要なものはあるが、比較系、演算子とかなので飛ばす

// String

let bb = "1\n2\n3" // 改行
print(bb)
let result = 7 + 9
print("結果: \(result)")
let string: String = "優勝"
print("結果: \(string)")

// 複数行の文字列リテラル

let haiku = """
五月雨を
  集めて早し // ここに目も書けたりする インデントも入れられる
最上川
"""
print(haiku)

// 相互変換

let cc = 123
let dd = String(cc)
 // dd は stringになる

let ee = "123"
let ff = Int(ee) // 123
let gg = "abc"
// print(Int(gg)) // 変換できないのでnil

// 比較
let str1 = "abc"
let str2 = "def"
str1 == str2 // false
str1 != str2 // true

// 結合
let 結合 = str1 + str2
print(結合)
var str3 = "ghi"
str3.append(str2) // これも結合  足させれるものは変数でなければならない

// Foundationによる高度な操作
// 二つの文字列間の順序の比較

let options = String.CompareOptions.caseInsensitive
let oder = "abc".compare("ABC", options: options)
oder == ComparisonResult.orderedSame

"abc".range(of: "bc")

// Any
// 任意の型を表す型

let int: Any = 123
// ＊＊＊＊＊＊　Anyの注意点　＊＊＊＊＊＊
/*
 Anyに変数や、定数を代入してしまうと元の型の情報が失われてしまうため、もとの方では可能だった操作ができなくなってしまう
 Anyへの代入は値にたいする操作の幅を狭めてしまうため、可能な限りAny型への代入は避け、型の情報を保つことが望ましいでしょう。
 */

// タプル型
// 複数の型をまとめて一つの型として扱う
//
var tuple: (Int, String)
// 代入方法
tuple = (1, "a")

// 要素アクセス
// - インデックスによるアクセス
// - 要素名によるアクセス
// - 代入によるアクセス

// インデックスによるアクセス

let tuple2 = (1, "a")
let num = tuple2.0
let str = tuple2.1

// 要素名アクセス

let tuple3 = (int: 1, string: "a")
let numA = tuple3.int
let strA = tuple3.string

// 代入によるアクセス

let numB: Int
let strB: String

(numB, strB) = (1, "a")

numB
strB

// タプルで定数もかける、あまり使わなさそう
let (intA, stringA) = (1, "a")
intA
stringA

// Void型
// 空　()
// 関数の戻り値がないとか、クロージャーの戻り値なしとかに使う

// キャスト
// アップキャスト

let any = "abc" as Any // Any型にアップキャスト

// 右辺が左辺の型の上位ではない場合Errorになる
// let int = "abc" as Int これはerrorになる

// 暗黙的キャスト
let abc: Any = "abc" // Stringから　Anyへの暗黙的なキャスト

// ダウンキャスト
/*
 階層関係のある型同士において、階層の上位となる抽象的な型を下位の具体的な方として扱う
 ダウンキャストはコンパイル失敗する可能性もある
 as? as!を使う

 as! はフォースドキャストという
 */

let any1 = 1 as Any
let int2 = any as? Int
let str4 = any as? String

let any2 = 1 as Any
//let int3 = any as! Int
//let str5 = any as! String // これは実行時errorになる

// 基本的には　as?を使う　as!は失敗しないケースなどで使うと良いが、使わない方が良い

// 値比較のためのプロトコル

// Equatable
// Comparable

// Equatable
/*
同値性を検証するためのプロトコルである
Equatableプロトコルに準拠(じゅんきょ)している型は
 ==　で値の一致を確認
 !=  で値の不一致を確認
 Bool、Int、Float、Double、StringはすべてEquatableに準拠している

 */
let boolLeft = true
let boolRight = true

boolLeft == boolRight // true
boolLeft != boolRight // false

let intLeft = 12
let intRight = 13

intLeft == intRight // false
intLeft != intRight // true

// 他にもいろいろあるが省略

// Comparable
// < > <= とか使う
// 値の大小とかを使って検証するプロトコルである
//

