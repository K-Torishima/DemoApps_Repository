import Foundation

// Class 参照型のデータ構造
// 参照型、継承できる
// 構造体と列挙体と違うは　プロパティやメソッドの文法、初期化のフローなどが違う
//　上記は継承を考慮するため
//　CocoaフレームワークのほとんどはClassで定義されている

class SomeClass {
    let id: Int
    let name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }

    func printName() {
        print(name)
    }
}

let instane = SomeClass(id: 1, name: "name")
instane.printName()



// 継承
// 型の構成要素の引き継ぎ
// 継承とは、新たなクラスを定義する時、他のクラスのプロパティ、メソッド、イニシャライザなどの型を再利用する仕組み
//　継承先のクラスでは、継承元のクラスと共通する動作を改めて定義する必要がなく、継承元のクラスとの差分のみを定義知れば済みます
//　継承元のクラスのサブクラス、継承元のクラスはクラスのスーパークラスといいます
//　Swiftでは複数のクラスから継承する多重継承は禁止されている


//class ClassName: 継承　{
//    クラスの定義
//}


class User {
    let id: Int

    var massage: String {
        return "Hello"
    }

    init(id: Int) {
        self.id = id
    }

    func printProfile() {
        print("id: \(id)")
        print("massage: \(massage)")
    }
}

// Userを継承したクラス
class RegisteredUser: User {

    let name: String

    init(id: Int, name: String) {
        self.name = name
        super.init(id: id)
    }
}

let registeredUser = RegisteredUser(id: 1, name: "koji, torishima")

let id = registeredUser.id
let massage = registeredUser.massage // Userを継承しているのでmassageが呼べる
registeredUser.printProfile()

// オーバーライド
// 型の構成要素の再定義

// スーパークラスで定義されているプロパティやメソッドなどの定義は、サブクラスで再定義することもできます。
//　オーバーライド可能なプロパティはインスタンスプロパティと後述するクラスプロパティのみで、すタティックプロパティはオーバーライドできない
//　オーバーライドを行うには、overrideキーワードを使用してスーパークラスで定義されている要素を再定義します。

//class ClassMame: superClass {
//    override func methodName(引数) -> 戻り値 {
//        メソッド呼び出し時に実行される文
//    }
//}

//override var プロパティ名：型名　{
//    get {
//        return文によって値を返す処理
//        superキーワードでスーパークラスの実装に利用できる
//    }
//
//    set {
//        値を更新する処理
//        superキーワードでスーパークラスの実装を利用できる
//    }
//}


//　オーバーライドしたプロパティやメソッドの中でsuperキーワードを使用することで、スーパークラスの実装を呼び出すこともできる
// User1で定義されているmassageとprintProfileをRegisteredUser1でオーバーライドしている
//　printProfileではsuper.printProfileによって、スパークラスの実装を読んでいる

class User1 {
    let id: Int

    var massage: String {
        return "Hello"
    }

    init(id: Int) {
        self.id = id
    }

    func printProfile() {
        print("id: \(id)")
        print("massage: \(massage)")
    }
}

class RegisteredUser1: User1 {
    let name: String

    override var massage: String {
        return "Hello, my name is \(name)"
    }

    init(id: Int, name: String) {
        self.name = name
        super.init(id: id)
    }

    override func printProfile() {
        super.printProfile()
        print("name: \(name)")
    }
}

let user1 = User1(id: 1)
user1.printProfile()

print("--")

let registeredUser1 = RegisteredUser1(id: 2, name: "tanaka takuya")
registeredUser1.printProfile()

//　Userクラスのprofileではidとmessageのみを出力していましたが、ResisteredUser1ではこれに加えてnameの値も出力している

// final 継承とオーバーライドの禁止
//　オーバーライド可能な要素の前にfinalをつけることによって、その要素がオーバーライドされることを禁止できる

class SuperClass {
    func overrideMethod() {}

    final func finalMethod() {}
}

class SubClass: SuperClass {
    override func overrideMethod() {}

    // コンパイルerror
    // Instance method overrides a 'final' instance method
    // override func finalMethod() {}
}

// classにfinalをつけることによって、そのクラスを定義することを禁止する

class AAA {}

class BBB: AAA {}

final class CCC {}

// コンパイルerror
// nheritance from a final class 'CCC'
// class DDD: CCC {}

// ------------------------------------------------------------------------- //
//　クラスに紐づく要素
//　クラスのインスタンスではなく、クラス自身に紐ずく要素として、クラスプロパティとクラスメソッドがある
//　クラスプロパティとすタティックプロパティと、クラスメソッドはスタティックメソッドと、それぞれ似た性質を持っている
//　両者の違い
//　スタティックプロパティとスタティックメソッドはオーバーライドできない
//　クラスプロパティとクラスメソッドはオーバーライドできる


//　クラスプロパティ
// クラス自身に紐ずくプロパティ
//　クラスプロパティはクラスのインスタンスではなく、クラス自身に紐ずくプロパティで、インスタンスに依存しない値を扱う場合に利用する
//　クラスプロパティを定義するには、プロパティ宣言の先頭にclassをつける
//　アクセス方法は型名に　. とクラスプロパティ名をつけて、型名.クラスプロパティのように書く

class A {
    class var className: String {
        return "A"
    }
}

class B: A {
    override class var className: String {
        return "B"
    }
}

A.className // "A"
B.className // "B"

// クラスメソッド
//　クラスに紐ずくメソッド
//　クラスメソッドはクラスのインスタンスではなく、クラス自身に紐ずくメソッドで、インスタンスに依存しない処理を実装する際に利用します
//　使い方は上と同じ

class A1 {
    class func inheritanceHierarchy() -> String {
        return "A"
    }
}

class B1: A1 {
    override class func inheritanceHierarchy() -> String {
        return super.inheritanceHierarchy() + "<-B"
    }
}

class C1: B1 {
    override class func inheritanceHierarchy() -> String {
        return super.inheritanceHierarchy() + "<-C"
    }
}

A1.inheritanceHierarchy() // A
B1.inheritanceHierarchy() // A<-B
C1.inheritanceHierarchy() // A<-B<-C

// イニシャライザの種類と初期化のプロセス
//　イニシャライザの役割は型のインスタンス化の完了までに全てのプロパティを初期化し、型の生合成を保つことである
//　クラスには継承関係があるため、様々な階層で定義されたプロパティが初期化されることを保証する必要がある
//　上記を保証するためにクラスには二段階初期化の仕組みが導入されている
//　二段階初期化を実現するためにクラスのイニシャライザは指定イニシャライザとコンビニエンスイニシャライザの二種類がある


//　指定イニシャライザ 主となるイニシャライザ
//　クラスの主となるイニシャライザ
//　このイニシャライザの中で全てのストアドプロパティが初期化される必要がある

class Mail {
    let form: String
    let to: String
    let title: String

    // 指定イニシャライザ
    init(form: String, to: String, title: String) {
        self.form = form
        self.to = to
        self.title = title
    }
}

// コンビニエンスイニシャライザ
//　指定イニシャライザをラップするイニシャライザ
//　指定イニシャライザを中継するイニシャライザで、内部で引数を組み立てて指定イニシャライザを呼び出す必要がある

class Mail1 {
    let from: String
    let to: String
    let title: String

    init(from: String, to: String, title: String) {
        self.from = from
        self.to = to
        self.title = title
    }

    convenience init(from: String, to: String) {
        self.init(from: from, to: to, title: "Hello, \(from)")
    }
}


let aaa = Mail1(from: "aaa", to: "bbb")



































