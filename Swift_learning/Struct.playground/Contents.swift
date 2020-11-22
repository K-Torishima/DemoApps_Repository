import Foundation

// Struct 構造体
// 構造体は値型
//　ストアドプロパティ の組み合わせによって、一つの値を表す
//　標準ライブラリで提供されている多くは構造体である
//　Bool String Int Array Dictionary

//　オプショナルは列挙型　タプルは型の組み合わせ　Anyはプロトコル

// 定義
//    struct 構造体名　{
//        構造体の定義
//    }

struct Article {
    let id: Int
    let title: String
    let body: String

    init(id: Int, title: String, body: String) {
        self.id = id
        self.title = title
        self.body = body
    }

    func printBody() {
        print(body)
    }
}

let article = Article(id: 1, title: "title", body: "body")
article.printBody() // body

// ストアドプロパティ の変更による値の変更
// 構造体はストアドプロパティの組み合わせで一つの値を表す値型
// 構造体のストアドプロパティを変更することは、構造体を別の値に変更することであり、構造体が入っている変数や、定数への再代入を必要とします
// 値型の変更に関する仕様は構造体のストアドプロパティ の変更にも適用されます


//　定数のストアドプロパティは変更できない
// 構造体のストアドプロパティの変更は再代入を必要とするため、定数に代入された構造体のストアドプロパティは変更できない


struct SomeStruct {
    var id: Int

    init(id: Int) {
        self.id = id
    }
}

var variable = SomeStruct(id: 1)
variable.id = 2
let constant = SomeStruct(id: 1)
// constant.id = 2 // error

// メソッド内のストアドプロパティの変更にはmutatingが必要
// 構造体のストアドプロパティの変更は再代入が必要なので、ストアドプロパティを含むメソッドにはmutatingが必要

struct SomeStruct2 {
    var id: Int

    init(id: Int) {
        self.id = id
    }
//  mutating をつけないとerror
//　Cannot assign to property: 'self' is immutable
//　自動でつけてくれるようになる
    mutating func someMethod() {
        id = 4
    }
}

var some2 = SomeStruct2(id: 1)
some2.someMethod()
some2.id // 4 変更されている


// メンバーワイズイニシャライザ デフォルトで用意されているイニシャライザ
// 型のインスタンスは初期化後に全てのプロパティ が初期化される必要がある
//　独自にイニシャライザを定義して初期化の処理を行うこともできます、
//　構造体では自動的に定義される　メンバーワイズイニシャライザというイニシャライザがある
//　型が持っている各ストアドプロパティと同名の引数をとるイニシャライザである


struct Article2 {
    var id: Int
    var title: String
    var boby: String

// 以下と同等のイニシャライザが自動的に定義される
//    init(id: Int, title: String, body: String) {
//        self.id = id
//        self.title = title
//        self.boby = body
//    }
}

let article2 = Article2(id: 1, title: "Hello", boby: "this is body")
article2.id      // 1
article2.title   // Hello
article2.boby    // this is body


//　メンバーワイズイニシャライザのデフォルト引数
//　ストアドプロパティ が初期化式とともに定義されている場合
//　そのプロパティに対するメンバーワイズイニシャライザの引数はデフォで引数を持ち、呼び出し時の引数の指定の省略ができる

struct Mail {
    var subject: String = "(No Subject)"
    var body: String

// 以下と同等のイニシャライザが自動的に定義される
//    init(subject: String = "(No Subject)", body: String ) {
//        self.subject = subject
//        self.body = body
//    }

}

let noSubject = Mail(body: "Hello")
noSubject.subject // "(No Subject)"
noSubject.body    // Hello

let greeting = Mail(subject: "Greeting", body: "Hello!")
greeting.subject // Greeting
greeting.body    // Hello!


