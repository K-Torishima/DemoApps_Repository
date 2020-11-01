import Foundation

/*
 swiftの型はクラス、構造体、列挙型、として定義してある、
 標準ライブラリの型の多くは構造体として定義しており、Cocoaのほとんどは型のクラスとして定義してある
 クラス、構造体、列挙型の３つには、メソッド、、プロパテなどの、共通要素が用意されている

 - 型に共通するもの
 代表的な型を構成する要素は、方が持つ値を保持するプロパテと型の振る舞いを表すメソッドの２つ
 プロパテは型に紐付いた変数や、定数と言い換えることができ、メソッドは型に紐付いた関数と言い換えることができる
 この二つにくあえ、型を構成する要素には、初期化を行うイニシャライザ、コレクションの要素を取得するサブスクリプト
 型内に型を定義する、ネスト型がある

 */


//　型の基本
// インスタンス　→ 型を実体化したものであり、型に定義されているプロパティやメソッドを持つ


//　構造体
/*
　struct 構造体名　{
    構造体の定義
}

// class
class 　クラス名　{
    クラスの定義
}

// enum

enum 列挙型名　{
    列挙型の定義
}

*/

//　例
struct SomeStruct {}

class SomeClass {}

enum SomeEnum {}

//　インスタンス化
// 型をインスタンス化するには、次のように（）をつけて、イニジャライザを呼ぶ
//　（）内には、必要に大じてイニシャライザの引数を渡します
//　型名()

//　前項で定義したSomeStructとSomeClassはそれぞれ、構造体とクラスであるため、デフォで引数なしのイニシャライザが用意されている

// インスタンス化
let someStruct = SomeStruct()
let someClass = SomeClass()

// 型の内部でのインスタンスへのアクセス
//　selfを使って、インスタンス自身にアクセスできる

struct SomeStructA {
    let value = 123

    func printValue() {
        print(self.value)
    }
}

// インスタンスではなくインスタンスのプロパテやメソッドにアクセスする場合、selfはいらない

struct SomeStructB {
    let value = 456

    func printValue() {
        // self　はいらない
        print(value)
    }
}

//　インスタンスのプロパティと、同名の変数や、定数がスコープ内に存在する場合は、それらを区別するためにselfを使う

struct SomeStructC {
    let value: Int

    init(value: Int) {
        // self.value はプロパティ をさし、　value　initの引数をさす
        self.value = value
    }
}

// 型内部での型自身のアクセス
// 型の内部のプロパテやメソッドなどの値の中では、大文字のSelfキーワードを通じて、型自身にアクセスできます。
//　Selfキーワードを使うと、型自身に紐ずくメンバーである、スタティックプロパティやスタティックメソッドへのアクセスが簡単になる

struct SomeStructD {
    static let sharedValue: Int = 73

    func printShardValue() {
        print(Self.sharedValue)
    }
}

// プロパティ

