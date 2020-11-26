import Foundation
import UIKit

// protocolとは
// 議定書　=>  protocol

/*
公式和訳　（DeepL）

 プロトコルは、特定のタスクや機能の一部に適したメソッド、プロパティ、その他の要件の青写真を定義します。
 プロトコルは、クラス、構造体、または列挙によって採用され、これらの要件の実際の実装を提供することができます。
 プロトコルの要件を満たすすべての型は、そのプロトコルに準拠していると言われています。

 適合型が実装しなければならない要件を指定することに加えて、
 これらの要件の一部を実装するためにプロトコルを拡張したり、
 適合型が利用できる追加の機能を実装したりすることができます。

 */

/*
 プロトコルは、インスタンスプロパティまたはタイププロパティに特定の名前とタイプを提供するために、任意の適合タイプを要求できます。
 プロトコルは、プロパティを保存プロパティにするか計算プロパティにするかを指定しません。
 必要なプロパティ名とタイプのみを指定します。
 プロトコルは、各プロパティはgettable又はgettableなければならないかどうかを指定し、設定可能。
 */

protocol SomeProtocol {
    var mustBeSettable: Int { get }
    var doesNotNeedToBeSettable: Int { get }
}

/*
 staticプロトコルで定義する場合は、必ずタイププロパティ要件の前にキーワードを付けてください。
 このルールは、クラスによって実装されるときにタイププロパティ要件の前にclassorstaticキーワードを付けることができる場合でも関係します。
 */

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

extension FullyNamed {
    var name: String {
        return ""
    }
}

struct User: FullyNamed {
    var fullName: String = "koji aaa"
    var name: String = "koji"
}

let koji = Person(fullName: "koji Torishima")
print("フルネーム：\(koji.fullName)")

let kenta = Person(fullName: "kenta tanaka")
print("フルネーム：\(kenta.fullName)")

let name = User()
print(name.fullName)
print(name.name)

let name2 = User(fullName: "aaa", name: "kkkk")
print(name2.fullName)
print(name2.name)


///////////////////////////////////////////////////////////////

class Starship: FullyNamed {
    private var prefix: String?
    private var name: String

    init(prefix: String? = nil, name: String) {
        self.prefix = prefix
        self.name = name
    }

    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(prefix: "Enterprise", name: "USS")
print(ncc1701.fullName)


protocol SomeProtocol2 {
    static func someTypeMethod()
}

/*
 これは、RandomNumberGeneratorプロトコルを採用して準拠するクラスの実装です。
 このクラスは、線形合同法として知られる疑似乱数生成アルゴリズムを実装します。
 */

protocol RandomNumberGenerator {
    func random() -> Double
}

final class LinearCongruentialGenerator: RandomNumberGenerator {
    private var lastRandom = 42.0
    private let m = 139968.0
    private let a = 3877.0
    private let c = 29573.0

    func random() -> Double {
        lastRandom = ((lastRandom * a + c))
        .truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print(generator.random())
print(generator.random())
print(generator.random())
print(generator.random())
print(generator.random())
print(generator.random())


protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off
    case on

    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

private var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

/*
 プロトコルでは、タイプに準拠することにより、
 特定の初期化子を実装する必要があります。
 これらの初期化子は、通常の初期化子の場合とまったく同じ方法でプロトコルの定義の一部として記述しますが、
 中括弧や初期化子本体は使用しません。
 */


protocol SomeProtocol3 {
    init(someParameter: Int)
}

/*
 プロトコル初期化要件のクラス実装
 プロトコル初期化子要件は、
 指定された初期化子または便利な初期化子として、適合クラスに実装できます。
 どちらの場合も、初期化子の実装にrequired修飾子を付ける必要があります。
 */

class Someclass: SomeProtocol3 {
    required init(someParameter: Int) {}
}

protocol Some {
    init()
}

class SomeSperClass {
    init() {}
}

class SubClass: SomeSperClass, Some {
    required override init() {}
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }

    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1...5 {
    print("ランダムダイス　ロール\(d6.roll())")
}

//protocol DiceGame {
//    var dice: Dice { get }
//    func play()
//}
//
//protocol DiceGameDelegate: AnyObject {
//    func gameDidStart(_ game: DiceGame)
//    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
//    func gemeDidEnd(_ game: DiceGame)
//}
//
//class SnakesAndLadders: DiceGame {
//    let finalSquare = 25
//    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
//    var square = 0
//    var board: [Int]
//    init() {
//        board = Array(repeating: 0, count: finalSquare + 1)
//        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02    }
//
//    func play() {
//        <#code#>
//    }
//
//
//}


protocol Calculation {
    var num1: Int { set get }
    var num2: Int { set get }
    func calc() -> Int
}

struct Add: Calculation {
    var num1: Int
    var num2: Int
    func calc() -> Int {
        return num1 + num2
    }
}

let add = Add(num1: 1, num2: 2)
print(add.calc())

// デフォルト実装
extension Calculation {
    func calc() -> Int {
        return 0
    }
}
// 値型
struct NoCalc: Calculation {
    var num1: Int
    var num2: Int
}

let not = NoCalc(num1: 1, num2: 3)
//print(not.calc())


print("/////////////////////////")
// protocol-oriented-Programming
// https://heart-of-swift.github.io/protocol-oriented-programming/

protocol Animal {
    func foo() -> Int
}


// return 省略
struct Cat: Animal {
    func foo() -> Int {
        2
    }
}

struct Dog: Animal {
    func foo() -> Int {
        1
    }
}

let animal: Animal = Bool.random() ? Cat() : Dog()
print(animal.foo())
// オブジェクト指向プログラミング でよく見られるポリモーフィズムです。
// しかし、 Swiftにおいてこのようなプロトコルの使い方は必ずしも適切ではありません。
// なぜ適切でないのか、どのようにプロトコルを使えば良いのかというのが本節のテーマです。

// Existential Type と Existential Container


struct Cat2: Animal {
    var value: UInt8 = 2 // 1bit
    func foo() -> Int { 2 }
}

struct Dog2: Animal {
    var value: Int32 = 4 // 4bit
    func foo() -> Int { 1 }
}

// Cat と Dog は 値型 なので、変数・定数にはそれらのインスタンスが直接格納されます。
// そのため、 Cat 型変数は 1 バイトの、 Dog 型変数は 4 バイトの領域を必要とします。

let cat2: Cat2 = Cat2() // 1bit
let dog2: Dog2 = Dog2() // 4bit

let animal2: Animal = Bool.random() ? cat2 : dog2 // 何バイト?
print(MemoryLayout.size(ofValue: animal2))


// https://matsuokah.hateblo.jp/entry/2017/08/22/070000

// Class からProtocolにリファクタ

/*
 - オブジェクト指向の利点
 　- カプセル化
 　- アクセスコントロール
 　- 抽象化
 　- 名前空間
 　- Expressive Syntax
 　- 拡張性
 これらは型の特徴であり、オブジェクト指向ではclassによって上記を実現している。
 また、classでは継承を用いることで親クラスのメソッドを共有したり、オーバーライドによって振る舞いを変えるということ実現している。
 しかし、これらの特徴はstructとenumで実現することが可能。
*/

// Classの問題点

/*
 - 暗黙的オブジェクトの共有
 classは参照であるため、プロパティの中身が書き換わると参照しているすべての箇所に影響が及ぶ。即ち、
 その変更を考慮した実装による複雑性が生まれているということ。

 - 継承関係
 Swiftを含め、多くの言語ではスーパークラスを１つしか持てないため、
 親を慎重に選ぶという作業が発生している。
 また、継承した後はそのクラスの継承先にも影響が及ぶので後から継承元を変えるという作業が非常に困難になる。

 - 型関係の消失
 オブジェクト指向をSwiftで実現しようとすると、ワークアラウンドが必要になる
 */

/// データクラスをキャッシュするクラスをCacheとし、更新のためにmergePropertyというメソッドを用意

class Cache {
    func key() -> String {
        fatalError("Please override this function")
    }

    func margeProperty(other: Cache) {
        fatalError("Please override this function")
    }
}

class FuelCar: Cache {

    var fuel: Int = 0
    var id: String

    init(id: String) {
        self.id = id
    }

    override func key() -> String {
        return String(describing: FuelCar.self) + self.id
    }

    override func margeProperty(other: Cache) {
        guard let car = other as? FuelCar else { return }
        fuel = car.fuel
    }
}

var memoryCache = [String: Cache]()
/*発生しているワークアラウンド
抽象関数を実現するためにスーパークラスでfatalErrorを使っている
各クラスの実装でランタイムのキャストを行っている
もし、FuelCar,BatteryCarで共通処理を実装するCarというスーパークラスを定義したくなったら、
CacheFuelCarなどとデータクラスを分けるような実装が必要になる
*/


typealias CacheKey = String

class Cacheable {
    func key() -> CacheKey {
        fatalError("Please override this function")
    }

    func marge(other: Cacheable) {
        fatalError("Please override this function")
    }
}

class CacheStore<CachableValue: Cacheable> {
    var cache = [CacheKey: CachableValue]()

    func save(value: CachableValue) {
        if let exist = cache[value.key()] {
            exist.marge(other: value)
            cache[value.key()] = exist
            return
        }
        cache[value.key()] = value
    }

    func load(cacheable: CachableValue) -> CachableValue? {
        return cache[cacheable.key()]
    }
}

class Car: Cacheable {
    var id: String
    init(id: String) {
        self.id = id
    }
}

class FuelCar2: Car {
    var fuelGallon: Int
    init(id: String, fuelGallon: Int = 0) {
        self.fuelGallon = fuelGallon
        super.init(id: id)
    }

    override func key() -> CacheKey {
        return id
    }

    override func marge(other: Cacheable) {
        guard let fuelCar = other as? FuelCar2 else { return }
        self.fuelGallon = fuelCar.fuelGallon
    }
}

func print(cacheable: FuelCar2,store: CacheStore<FuelCar2>) {
    print("fuelGallon: \(store.load(cacheable: cacheable)!.fuelGallon)")
}

var fuelCarCache = CacheStore<FuelCar2>()
var car1 = FuelCar2(id: "car1", fuelGallon: 0)
fuelCarCache.save(value: car1)

print(cacheable: car1, store: fuelCarCache)
// print: 0

car1.fuelGallon = 10

print(cacheable: car1, store: fuelCarCache)
// print: 10

fuelCarCache.save(value: car1)

print(cacheable: car1, store: fuelCarCache)
// print: 10

print("-----------------------------------Swift実践入門-------------------------------------- ")


// --------------------------------------------------------------------------- //
// Swift実践入門では

// protocolとは、型のインターフェースを定義するものである
// インターフェースは型がどのようなプロパティやメソッドを持っているかを示します。
// この本ではプロトコルによるインターフェースの定義方法、プロトコルへの準拠方法、デフォルト実装の定義方法を説明します。

// 型のインターフェースを定義する目的
// プロトコルは型が特定の性質は機能を持つために、必要なインターフェースを定義するためのものです。
//　また、プロトコルが要求するインターフェースを型が満たすことを準拠する
//　プロトコルを利用することで、複数の型である性質を抽象化できる、例えば、2つの値が同じであるかどうかを同値性といい、
//　同値性が検証可能であるという性質は標準ライブラリのEqutable プロトコルとして表現されている
//　Equtableプロトコルには　＝＝演算子が定義されており、このプロトコルに準拠するには　==演算子に対する実装を用意する必要がある
//　このようなプロトコルが存在しているおかげで、具体的には問わないが、同値性が検証可能な型だけを扱うことが可能となる、
//　プロトコルを利用すれば、型のインターフェースのみに着目したプログラムを実現できます

func printfEqual<T:Equatable>(_ arg1: T, _ arg2: T) {
    if arg1 == arg2 {
        print("Both are \(arg1)")
    } else {
        print("not equal arg1 to arg2")
    }
}
// Value of protocol type 'Any' cannot conform to 'RawRepresentable'; only struct/enum/class types can conform to protocols
//func printE(arg1: Any, arg2: Any) {
//    if arg1 == arg2 {
//        print("Both are \(arg1)")
//    } else {
//        print("not equal arg1 to arg2")
//    }
//}

printfEqual(123, 123)
printfEqual("str", "str")


// プロトコルの基本
//　型はプロトコルに準拠することにより、プロトコルで定義されたインターフェースを通じて扱うことが可能となっている
//　型は複数のprotocolを準拠できる
//　protocolに準拠するにはprotocolが要求する全てのインターフェースに対応する実装を用意する必要がある

protocol SomeProtocolA {
    func someMethod()
}

struct SomeStructA: SomeProtocolA {
    func someMethod() {}
}

// someMethod が実装されてないのでError
//　struct SomeStructB: SomeProtocolA {}

// class継承

class SomeSuperClass {}

class SomeClassA: SomeSperClass, SomeProtocolA {
    func someMethod() {}
}

// extention
/*
 一つのextentionで複数のプロトコルに準拠することもできるが、一つのプロトコルに対して、
 extentionを定義することによって、プロパティ、メソッドとプロトコルの対応が明確になる
 複数のプロトコルに準拠するときなどは特に、どのプロトコルやメソッドがどのプロトコルで宣言されているものなのかわかりにくくなりがち
 エクステンションを利用することによってCodeの可読性を高めることができる
 */

protocol SomeB {
    func someBM()
}

protocol SomeC {
    func someCM()
}


struct SomeStructAA {
    let someP: Int
}

// 使いたいものを分けている
extension SomeStructAA: SomeB {
    func someBM() {}
}

//　そのときに応じたプロトコルに準拠できる
extension SomeStructAA: SomeC {
    func someCM() {}
}

// 利用方法
//　構造体、クラス、列挙型、クロージャと同様に、変数、定数、引数の方として利用可能、
//　プロトコルに準拠している型は、プロトコルにアップキャスト可能
//　型がプロトコルの変数や定数に代入できる
//　型がプロトコルの変数と定数ではプロトコルが定義されているプロパティやメソッドを使用できる

protocol SomeProtocolAA {
    var variable: Int { get }
}

func someMethodAA(x: SomeProtocolAA) {
    // 引数xのプロパティや、メソッドのうち
    // SomeProtocolで定義しているものが使用可能
    x.variable
}

// 連想型を持つプロトコルは変数、定数や引数の型として使用することができず、ジェネリティクスの型制約の記述のみに利用できる

//　protocolコンポジション
// 複数のプロトコルの組み合わせ

protocol SomeProtocolAAA {
    var variable1: Int { get }
}

protocol SomeProtocolBBB {
    var variable2: Int { get }
}

struct SomeStructAAA: SomeProtocolAAA, SomeProtocolBBB {
    var variable1: Int
    var variable2: Int
}

func someFunction(x: SomeProtocolAAA & SomeProtocolBBB) {
    x.variable1 + x.variable2
}

let a = SomeStructAAA(variable1: 1, variable2: 2)
someFunction(x: a) // 3



// プロトコルを構成する要素

//　プロパティ
//　ゲッタとセッタの有無のみを定義し、プロトコルに準拠する型で要求に応じてプロパティを実装する
//　常に　var
//　letは使用できない
//　ストアド、コンピューテッドと言った区別がないから


protocol SomeProtocolAAAA {
    var someProperty: Int { get set }
}

//　ゲッタ

protocol SomeProtocolBBBB {
    var id: Int { get }
}

// 変数のストアド
struct SomeStructBBBB: SomeProtocolBBBB {
    var id: Int
}

// 定数のストアド
struct SomeStructCCCC: SomeProtocolBBBB {
    let id: Int
}

// コンピューテット
struct SomeStructDDDD: SomeProtocolBBBB {
    var id: Int {
        return 1
    }

}

// セッタ
// let　は要件を満たせないのでError

protocol SomeProtocolCCCC {
    var title: String { get set }
}

// 変数のストアド
struct SomeStructEEEE: SomeProtocolCCCC {
    var title: String
}

// コンピューテッド
struct SomeStructFFFF: SomeProtocolCCCC {
    var title: String {
        get {
            return "title"
        }

        set {}
    }
}

// メソッド
// purotocolのメソッドは　メソッド名、引数の型、戻り値のみを実装できる
protocol SomeProtocolDDDD {
    func someMethod() -> Void
    static func someStaticMethod() -> Void
}
















