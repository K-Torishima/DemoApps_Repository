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
