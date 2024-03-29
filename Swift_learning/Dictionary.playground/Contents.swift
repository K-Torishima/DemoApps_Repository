import Foundation

// Dictionary<key, Value>

/*
 Key と　Valueをもつ
 キーはアクセス対象の識別に使用されるため一意でなければならない
 値は他のものと重複しても構わない
 */


// 辞書リテラル
let dictionary = ["a": 1, "b": 2]

// 型推論

let dic = ["a": 1, "b" : 2]

// 空
let dic2: [String: Int] = [:]

// キーと値でできる型
/*
Dictionary型は　正式には
 Dictionary<key, Hashable, Value>
 Key型に指定できる型には制限がある
 Hashableの部分は型制約といいkey型をHashableに準拠し型に制限している
 Hashableに準拠した型は、その値をもとにハッシュ値を計算んできる
 ハッシュ値とは
 元の値からアルゴリズムで算出されるInt型の値
 key型がHashableに準拠している必要があるのはハッシュ値がキーの一意性の保証や探索などに必要あるため

 Valueには型制限がない
 [key: [key: type]]とかもできる
 */

let dic3 = ["even":[2, 4, 6, 8], "odd": [1, 3, 5, 7, 9]]
print(dic3["even"]!)

// 値のアクセス

let dic4 = ["key": 1]
let val = dic["key"]

// nil比較

let dic5 = ["key1": "val1"]
let valForKey1 = dic5["key1"] != nil // true
let valForkey2 = dic5["key2"] != nil // false

// 値の更新　追加　削除

// 更新
var dic6 = ["key" : 1]
dic6["key"] = 2
dic6 // 1 から 2に更新されている

// 追加
var dic7 = ["key1" : 1]
dic7["key2"] = 2
dic7 // ["key1" : 1, "key2": 2]

// 削除
var dic8 = ["key" : 1]
dic8["key"] = nil
dic8 // [:]

