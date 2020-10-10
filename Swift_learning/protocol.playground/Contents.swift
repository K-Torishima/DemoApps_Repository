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


