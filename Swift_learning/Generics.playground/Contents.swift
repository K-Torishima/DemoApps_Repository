import Foundation

// Generics
// ジェネリクスとは、型をパラメータとして受け取ることで、汎用的なプログラムを記述するための、機能である
//　Swiftではジェネリクス関数とジェネリクス型として提供されており、これらを活用すれば、関数や、型を汎用的かつ型安全に記述できる
//　汎用的なプログラム

//　ジェネリクスの利便性を理解する
//　特定の処理を汎用化するには、その処理に対して任意の入力値を与えられるようにする
//　「１＝＝１の結果を返す関数」が行っているのは、特定の値同士の比較ですが、
// 「xとyという任意の引数をとり、x＝＝yを返す関数」を作れば、任意の整数どうしを比較する汎用的な処理を行える

func isEqual() -> Bool {
    return 1 == 1
}

func isEqual(x: Int, y: Int) -> Bool {
    return x == y
}

isEqual() // true
isEqual(x: 1, y: 1) // true

//　しかし、このisEqual(x: y:)が汎用的であるのは、あくまで整数動詞の比較においてのみ、
//　他の型同士の比較を行うには、型ごとに同様の関数をオーバーロードする必要がある

func isEqual(_ x: Float, _ y: Float) -> Bool {
    return x == y
}

isEqual(1.1, 1.1) // true

// ジェネリクスを使用することによって、複数間の間においても汎用的な処理を実装できる、ジェネリクスの基本的なコンセプトは入力の型も任意にすることによって、
// プログラムの汎用性をさらに高めるというものです

//　ジェネリクスを利用して先程のisEqual()を書き換えると次のようになる

func isEqual<T: Equatable>(x: T, y: T) -> Bool {
    return x == y
}

isEqual(x: "abc", y: "def")  // false
isEqual(x: 123, y: 123)      // true
isEqual(x: false, y: false)  // true
isEqual(x: 1.3, y: 0.4)      // false

// 上記＜T：Equatable＞は「Equatableプロトコルに準拠したあらゆる型」
// String Bool Int Float 全てEquatableに準拠しているので、この関数で比較できる


// ジェネリクスの基本

// 定義方法

//func 関数名<型引数>(引数名: 型引数) -> 戻り値の型　{
//    関数呼び出し時に実行される処理
//}
//
//

//　型引数として宣言された型は、ジェネリック関数や、ジェネリック型の内部で、通常の型と同等に扱える
// またジェネリック関数の型としても利用できる

func someFunction<T,U>(x: T, y: U) -> U {
    let _: T = x     //型アノテーションとして使用
    let _ = x        // 型推論に対応
    let _ = 1 as? T  // 型のキャストに使用
    return y
}

// Optional<Wrapped> Array＜Element＞　プレースホルダ型を持つものはジェネリック型である、プレースホルダ型という呼称は引数の別名

//　特殊化方法
//　ジェネリック関数やジェネリック型の内部では、型引数として型を抽象的に表現できるが、実際にジェネリック関数を呼び出したり、ジェネリック型をインスタンス化したりする時は、型引数に具体的な型を指定する必要がある
//　ジェネリクスを使用して、汎用的に定義されたものに対して、具体的な型引数を与えて型を確定させることを特殊化という
//　特殊化の方法は２つ
//　<>内に型引数を明示する方法
//　型推論によって型引数を推論する方法

// Contentは型引数

struct Container<Content> {
    let content: Content
}

// 型引数がstringであることを明示する
let stringContainer = Container<String>(content: "abc") // content<String>
//　型引数を型推論している
let intContainer = Container(content: 1) // content<Int>

//　仮型引数　実型引数
//　関数の仮引数と日引数と同じ

//　汎用性と、型安全性の両立
//　ジェネリクスは単なる汎用化ではなく、静的型付けによる、型安全性を保った上での汎用化、
//　型引数はジェネリック関数や、ジェネリック型に保持され続けるため、型引数として与えられた型は通常の型と同等の型安全を持っている

func identity<T>(_ aragument: T) -> T {
    return aragument
}

let int =  identity(1)
let string = identity("abc")

// 引数をそのまま戻り値とするジェネリティクス関数identityは引数の型を型引数Tとして受け取り、戻り値を同じ型Tで返却する
//　つまり、型引数として、Int型を渡せば、Int、Stringを渡せば、Stringが戻り値となる、
//　同じTとして表現された引数の型と戻り値の型が同じであることが証明される


//　Any型との比較

//　ジェネリクス
func identityWithGenericValue<T>(_ argment: T) -> T {
    return argment
}

let genericInt = identityWithGenericValue(1)        // Int
let genericString = identityWithGenericValue("abc") // String

// Anyの場合
func identityWithAnyValue(_ argment: Any) -> Any {
    return argment
}

let anyInt = identityWithAnyValue(1)          // Any
let anyString = identityWithAnyValue("abc")   // Any

if let int = anyInt as? Int {
    // ここでようやくInt型として扱えるようになる
    print("anyInt is \(int) ")
} else {
    // Int型へダウンキャスト失敗した場合を考慮する必要がある
    print("The type anyInt is not Int")
}

//　Anyを使った関数の戻り値は全てAnyになる、実際の型の情報は失われる



//　ジェネリック関数
//　ジェネリック関数とは、型引数を持つ関数のこと、

func identity<T>(x: T) -> T {
    return x
}

identity(x: 1)
identity(x: "abc")

//　特殊化方法
//　ジェネリック関数の実行には、特殊化が必要となります。
//　ジェネリック関数を特殊化するには、
//　２つある
//　引数から型推論によって型引数を決定する方法
//　戻り値から型推論によって型引数を決定する方法

//　引数から型推論による特殊化
//　引数からの型推論によって、特殊化を行うには、ジェネリック関数の引数のうちの少なくとも一つの型が型引数となっているう必要がある

func someFunction<T>(_ argument: T) -> T {
    return argument
}

let intA = someFunction(1)
let stringA = someFunction("abc")

// 上記は下記のCodeとおなじ

func someFunction(_ argment: Int) -> Int {
    return argment
}

func someFunction(_ argment: String) -> String {
    return argment
}

//　型引数が複数の引数や、戻り値で使用される場合、それらの実際の型は一致する必要がる
//　someFnction関数では、第一引数と第二引数の型は同じ型引数Tで表されているため、２つの引数のかたは一致する必要がある
//　someFunctionの引数に１と"abc"のような異なる型を与えた場合はこんぱいるErrorになる

func someFunction<T>(_ argment: T, _ aragment: T) {}

someFunction(1,2)
someFunction("abc", "def")
// someFunction(1, "abc")  // error
//　Cannot convert value of type 'String' to expected argument type 'Int'


//　戻り値からの型推論による特殊変化
//　戻り値からの型推論によって特殊化を行うには、ジェネリック関数の戻り値の型が型引数となっていて、かつ、戻り値の代入先の型が決まっている必要がある

// someFunctionでは、String？型の変数や定数へ戻り値を代入する場合はT型をStringと決定でき、Int？型の変数や定数へ戻り値を代入する場合は、T型をInt型と決定できる
//　しかし、戻り値の代入先がない場合や、戻り値の代入先の型が決まっていない場合はT型を決定する要因がないため、コンパイルerrorとなる

func someFunction<T>(any: Any) -> T? {
    return any as? T
}

let a: String? = someFunction(any: "abc")
let b: Int? = someFunction(any: 1)
// let c = someFunction(any: "abc") // Tが決定できずコンパイルerror
// Generic parameter 'T' could not be inferred

//　型制約　型引数に対する制約
//　準拠すべきプロトコルやスーパークラスなど、型引数には様々な制約を設けることができる
//　型制約を利用することで、ジェネリック関数やジェネリック型をより細かくコントロールできる
//　型制約がない型引数ではどのような型でも受け入れるため、型の性質を利用した記述ができていませんでした。型引数を設けることで、型の性質を利用できる
//　型引数に必要十分な型制約を与えると、汎用性と型の性質を利用した具体的な処理とを両立できる

//　型制約の種類は、スーパークラスや準拠するプロトコルに対する制約、連想型のスーパークラスや準拠するプロトコルに対する制約、型同士の一致を要求する制約の3つがある

//　スーパークラスや準拠するプロトコルに対する制約
//　型引数のスーパークラスや準拠するプロトコルに対する制約を指定するには、型引数のあと：に続けてプロトコル名や、スーパークラス名を指定する


//func 関数名<型引数: プロトコル名やスーパークラス名>(引数)　{
//    関数呼び出し時に実行される文
//}


//　引数に使用される型引数TをEqutableプロトコルに準拠したものに限定しています。
//　この型制約を設けることにより、isEqual()関数内のT型に対して、Equtableプロトコルで定義されている演算子　== が利用できる

func isEqualA<T: Equatable>(x: T, y: T) -> Bool {
    return x == y
}

isEqualA(x: "abc", y: "def") // false

// 連想型のスーパークラスや準拠するプロトコルに対する制約
// 型引数にはwhere節を追加でき、where節では、型引数の連想型についての型制約を定義できる
//　連想型の型制約では、連想型のスーパークラスや準拠すべきプロトコルについての制約と、型同士の一致を要求する制約を設けることもできる
//　連想型のスーパークラスや準拠すべきプロトコルについての制約を指定するには、where節内で、連想型のあと：に続けてプロトコルやスーパークラス名をしてする

//func 関数名<型名: プロトコル>(引数) -> 戻り値の型　where 連想型: プロトコルやスーパークラス {
//    関数呼び出し時に実行される文
//}


//　次のジェネリック関数sorted()の例では型引数TがCollectionプロトコルに準拠していることを要求しているのに加えて、where節でT.Element型がComparableプロトコルに準拠していること要求している
//　このような型制約を設けることで、sorted()関数の引数は比較可能な要素を持ったコレクションに限定されるため、ソート処理を実装できる

func sorted<T: Collection>(_ argument: T) -> [T.Element] where T.Element: Comparable {
    return argument.sorted()
}

sorted([3,2,1])

//　どうしの一致を要求する制約
//　型引数と連想型の一致や連想型どうしの一致を要求する型制約を設けるには、where節内で一致すべき型どうしを　＝＝　演算子でむずぶ

//func 関数名<型引数1: Protocol1, 型引数2: Protocol2>(引数) -> 戻り値の型 where Protocol1の連想型 == Protocol2の連想型　{
//    関数呼び出し時に実行される文
//}

// ジェネリック関数concat()は2つのCollection型の値を連結します。
//　concat()関数はCollectionプロトコルに準拠した別々の型引数TとUを受けとしますが、これらの連想型T.ElementとU.Elrmentが一致することを要求している
// 例に登場するSet<Element>型は数学における集合を表すジェネリック型であり、Collectionプロトコルに準拠している、
//　Set([1,2,3])はSet<Element>型をIntで特殊化したSet<Int>型となる
//　concat()の引数に対し、「配列や集合といったコレクションの種類は問わないものの、その要素の型は一致してないといけない」という限定的な制限を設けることができる
//　したがって、異なる型でありながらも要素の型は一致している[Int]型とSet＜Int>型を引数に撮ることができる

func concat<T: Collection, U: Collection>(_ argment1: T, _ argment2: U) -> [T.Element] where T.Element == U.Element {
    return Array(argment1) + Array(argment2)
}

let array = [1,2,3]
let set = Set([1,2,3])
let result = concat(array, set) // 1,2,3,2,3,1

//　ジェネリック型
//　汎用的な型
//　型引数を持つクラス、構造体、列挙型のこと、

//　定義方法

struct StructName<T> {
    // 構造体の定義
}

class ClassName<T> {
    // クラスの定義
}

enum EnumName<T> {
    // Enumの名前
}


//　型引数は型の内部で通常の型と同じように使用できる

struct GenericStruct<T> {
    var property: T
}

class GenericClass<T> {
    func someFunction(x: T) {}
}

enum GenericEnum<T> {
    case SomeCase(T)
}


// 特殊化方法

// 明示的に型引数を指定する方法
//　型推論によって、型引数を決定する方法

//　型引数の指定による特殊化
// ジェネリック型では、型引数の直接指定による特殊化を行える
//　異なる型を与えた場合はerror

struct ContainerA<Content> {
    var content: Content
}

let intContainerA = ContainerA<Int>(content: 1)
let stringContainerA = ContainerA<String>(content: "abc")
//let someContainerA = ContainerA<Int>(content: "aaa") // 型が違うためerror
//　Cannot convert value of type 'String' to expected argument type 'Int'

// 型推論による特殊化
//　ジェネリック型では、明示的に型引数を指定しなくても、
//　イニシャライザやスタティックメソッドの引数からの型推論によって特殊化を行える。型推論によるジェネリック型の特殊化は、ジェネリック関数での特殊化と同様に引数型が型引数となる

//　型推論による特殊化を利用すると、前述のContainer<Int>型のインスタンス化は次のように書き直せる
//　この場合での特殊化はContainer<Content>型のイニシャライザの引数が、(content: Content)となっており、この引数に与えられる値の型が型引数として扱われる

struct ContainerB<Content> {
    var content: Content
}

let intContainerB = ContainerB(content: 1)
let stringContainerB = ContainerB(content: "abc")

// 型制約　






























