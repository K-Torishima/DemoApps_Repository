import Foundation

// 範囲型
// Renge<Bound>
// 他にもある

/*
範囲型の種類
 # ..<
 - Range<Bound>
 - CountableRange<Bound>
 - ParitalRangeUpTo<Bound>
 # ...
 - ClosedRange<Bound>
 - CountableClosedRange<Bound>
 - PartialRangeThrough<Bound>
 - PartialRangeFrom<Bound>
 - CountablePartialRangeFrom<Bound>
 */

// 範囲演算子
// ..<
/*
 末尾の値を含まない範囲を表す型には
 Range<Bound>型、
 CountableRange<Bound>型
 ParitalRangeUpTo<Bound>型
 ..<は上記を表す
 IntならCountableRange
 */
let range = 1 ..< 4 // CountableRange (1..<4)
// 基本的にはfor ループでアクセス

for val in range {
    print(val) // 1, 2, 3
}

// ...
/*
 末尾を含む
 ClosedRange<Bound>
 CountableClosedRange<Bound>
 PartialRangeThrough<Bound>
 PartialRangeFrom<Bound>
 CountablePartialRangeFrom<Bound>
*/

let range1 = 1...4

for val in range1 {
    print(val)  // 1, 2, 3, 4
}

// 型推論
let intRange = 1 ..< 3 // Countable
let doubleRange = 1.0 ..< 3.0 // Range
// 型アノテーションを使って型指定できる

let floatRange: Range<Float> = 1 ..< 3 // Range<Float>

// 境界に使用可能な型
let range2 = 1 ..< 4 // OK
// let range3 = 1 ..< "a" // error

// 範囲型の操作

/*
 境界の値のアクセス
 - lower 範囲の先頭の値
 - upper　範囲の末尾の値
 それぞれBound型の値として返却す
 */

let range3 = 1.0 ..< 4.0
range3.lowerBound // 1
range3.upperBound // 4

let countableRange = 1 ..< 4
countableRange.lowerBound // 1
countableRange.upperBound // 4


// 片側範囲の場合　片方の境界のみアクセスできます

let rangeThrough = ...3.0
rangeThrough.upperBound // 3
// lowerBound はこの場合存在しないのでError

// 値が範囲に含まれているかどうかの判定

let range4 = 1...4
range4.contains(2) // true
range4.contains(5) // false

// コレクションとしてのString型

// Character 単一の文字として扱う
let string = "a"
let character: Character = "a" // CharacterType

// let aaa: Character = "akjhgfdsshhgfds"
// Error: Cannot convert value of type 'String' to specified type 'Character'

// string.index

let str = "abc"
let startIndex = str.startIndex
print(startIndex) // Index(_rawBits: 1)
let endIndex = str.endIndex
print(endIndex)   // Index(_rawBits: 196609)

// 値を取る場合　サブスクリプトを使用する
// インデックスにString.Indexを指定する
let str2 = "abc"
// startIndex 先頭を取得
let charcStart = str[str.startIndex] // "a"
// endIndexは最後のIndexではなくその次のIndexを指定するのでErrorになる
// let charcEnd = str[str.endIndex] // 実行時Error
// Fatal error: String index is out of bounds: file Swift/StringRangeReplaceableCollection.swift, line 302

// 最後の文字のIndexやn番目のインデックスを取得するには　index(_:offsetBy:)を使う

// index2
let bIndex = str2.index(str2.startIndex, offsetBy: 1)
let b = str2[bIndex]

// 最後の文字を取得
let cIndex = str2.index(str2.endIndex, offsetBy: -1)
let c = str2[cIndex]

str2.count // 3

// 要素アクセス
for i in str2 {
    print(i)
}


