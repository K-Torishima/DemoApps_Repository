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

