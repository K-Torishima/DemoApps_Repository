import Foundation

// value Type
// インスタンスが値への参照ではなく、値そのものを表す型
//　struct enum は値型
// 変数や定数への値のインスタンスの代入はインスタンスが表すそのものの代入を意味するため、
//　複数の変数や定数で一つの値型のインスタンスを共有することはできない
//　そのため、一度代入したインスタンスは再代入を行わない限り、その値が予測不可能になるというメリットがある

var a = 4.0 // a に4.0が入る
var b = a   // bに4.0が入る（aがもつ4.0への参照ではなく値である4.0が入る）
a.formSquareRoot() // a の平方根をとる
a           // a is 2.0
b           // b is not change a 4.0

// 変数と定数への代入とコピー
// 値型のインスタンスが値そのものを表すという仕様は変数、定数への代入や関数への受け渡しのたびにコピーを行い、元のインスタンスが表す値を不変することによって実現されます
//　構造体と列挙体は独自に定義したものも値型となる
//　変数aに赤を表すColorを代入し、変数bにaを代入する　変数bへのaの代入が意味することはbにaがもつ赤への参照を代入することではなく、aが示す赤という色そのものをbに代入する
//　bへ代入を行うときにaに入っているColorがコピーされ、aとbがそれぞれ独立して赤という値を持っているということ
//　aを変更してもbには影響がない
// ここ理解しておかないと値ないぜってなるかもしれないので注意

struct Color {
    var red: Int
    var green: Int
    var blue: Int
}

var a1 = Color(red: 255, green: 0, blue: 0)
var b1 = a1
a1.red = 0

a1.red   // 0
a1.green // 0
a1.blue  // 0

b1.red   // 255
b1.green // 0
b1.blue  // 0


// mutating　自身の変数を宣言するキーワード
//　値型にはmutatingを宣言することで、自身の値を変更する処理を実行できる
//　インスタンスが格納されている変数への暗黙的な再代入ができる
//　mutatingが指定されているメソッドの呼び出しは再代入として扱われるので、定数に格納された値型のインスタンスに対しては実行できない

//mutating func methodName(引数) -> 戻り値の型 {
//    // メソッドよびたし時に実行される文
//}


extension Int {
    mutating func increment() {
        self += 1
    }
}


var a2 = 1
a2.increment()

// 定数代入不可
//let b2 = 1
//b2.increment()
// Cannot use mutating member on immutable value: 'b2' is a 'let' constant

// 定数に対しては実行できない仕様はインスタンスが保持する値の変更を防ぐときに役立つ

var mutableArray = [1, 2, 3]
mutableArray.append(4)
//  @inlinable public mutating func append(_ newElement: Element)
// append には　mutatingがついているため　let 宣言できない　再代入だから

