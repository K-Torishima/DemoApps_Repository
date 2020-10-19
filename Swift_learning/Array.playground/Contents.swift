import Foundation

// Array<Element>
/*
 - 配列
 − Elementはプレスフォルダー型
*/


// リテラル
let a = [1, 2, 3]
let b = ["a","b", "c"]

// 型推論
let strings = ["a", "b", "C"] // [string]型
let numbers = [1, 2, 3] // [Int]型

// 空配列
let array: [Int] = []
let array1: [Any] = [1, "a"]

// 要素にできる型
let integers = [1, 2, 3]// [Int]
let strings1 = ["a", "b", "c"] // [string]

// 二次元配列
let array2 = [[1, 2, 3], [4, 5, 6]]

// 型の操作

let stringsA = ["abc", "def", "ghi"] // index of 0, 1, 2
let stringsB = stringsA[0]
let stringsC = stringsA[1]
let stringsD = stringsA[2]
// index out is error

//　要素の更新、追加、　結合、　削除

// update　対象のインデックスを指定して上書きさせる
var str = ["abc", "def", "ghi"]
str[1] = "xyz"
print(str)

// append
var intAry = [1, 2, 3]
intAry.append(4)

// insert 任意の要素追加
var intAry1 = [1, 3, 4]
intAry1.insert(2, at: 1) // 1 と 3 の間に　2 を追加

// 結合
let aaa = [1, 2, 3]
let bbb = [4, 5, 6]
aaa + bbb // [1, 2, 3, 4, 5, 6]

// 削除
var intAry2 = [1, 2, 3, 4, 5, 6]
intAry2.remove(at: 1) // index 1 delete
intAry2.removeFirst() // 一番初めをdelete
intAry2.removeLast()  // 一番後ろをdelete
intAry2.removeAll()   // 全部削除


