import Foundation

//　列挙型
//　複数の識別子をまとめる型

//　列挙型は値型、複数の識別子をまとめる型である
//　列挙型の一つ一つの識別子はケースという
//　ケース同士は排他的

//enum 列挙型名　{
//    case ケース１
//    case ケース２
//
//    その他の列挙型の定義
//}

//　列挙型は列挙名ケース名のようにケース名を指定して、インスタンス化する

enum Weekday {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

// インスタンス化
let sunday = Weekday.sunday
let monday = Weekday.monday

//　イニシャライザを定義してインスタンス化することもできる

enum WeekdayA {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday

    init?(japaneseName: String) {
        switch japaneseName {
        case "日":
            self = .sunday
        case "月":
            self = .monday
        case "火":
            self = .tuesday
        case "水":
            self = .wednesday
        case "木":
            self = .thursday
        case "金":
            self = .friday
        case "土":
            self = .saturday
        default:
        return nil
        }
    }
}

let sundayA = WeekdayA(japaneseName: "日")
let mondayA = WeekdayA(japaneseName: "月")

//　イニシャライザの他にも　型を構成する要素は列挙型でも利用可能
//　ただしプロパティには制限があり、ストアドプロパティを持つことはできない
//　したがってコンピューテットプロパティしか持てない


enum WeekdayB {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday


    var name: String {
        switch self {
        case .sunday:
            return "日"
        case .monday:
            return "月"
        case .tuesday:
            return "火"
        case .wednesday:
            return "水"
        case .thursday:
            return "木"
        case .friday:
            return "金"
        case .saturday:
            return "土"
        }
    }
}

let weekday = WeekdayB.sunday
let name = weekday.name // 日

// ローバリュー　実体の定義
//　列挙体のケースにはそれぞれに対応する値を設定できます
//　この値をrow valueと言い、全てのケースのローバリューの方はお同じである必要がある
//　型指定は　Int、Double, String、　Character

//enum EnumName: rowValueType {
//    case case1 = rowValue1
//    case case2 = rowValue2
//}


enum Symbol: Character {
    case sharp = "#"
    case dollar = "$"
    case percent = "%"
}

let symbol = Symbol(rawValue: "#")
let character = symbol?.rawValue // "sharp"

// ローバリューのデフォルト値

enum Option: Int {
    case none
    case one
    case two
    case undefind = 999
}

Option.none.rawValue // 0
Option.one.rawValue  // 1
Option.two.rawValue  // 2
Option.undefind.rawValue // 999

// String型のローバリューのデフォは、ケースをそのまま文字列にした値

enum Direction: String {
    case north
    case east
    case south
    case west
}

Direction.north.rawValue // north
Direction.east.rawValue  // east
/// ...

// 連想値 付加情報の付与
// 列挙型のインスタンスはどのケースかということに加えて、連想値という付加情報を持つこともできる
// 連想値に指定できる型には制限がない

enum Color {
    case rgb(Float, Float, Float)
    case cmyk(Float, Float, Float, Float)
}

let rgb = Color.rgb(0.0, 0.33, 0.66)
let cmyk = Color.cmyk(0.0, 0.33, 0.66, 0.99)

//let color = Color.rgb(0.0, 0.33, 0.66)
let color = Color.cmyk(0.0, 0.33, 0.66, 0.99)

switch color {
case .rgb(let r, let g, let b):
    print("\(r), \(g), \(b)")
case .cmyk(let c, let m, let y, let k):
    print("\(c), \(m), \(y), \(k)")
}

// 連想値は列挙型のインスタンスごとに違う値を持たせたいときに役立つ

// CaseIterable protocol
// 要素列挙のプロトコル
//　列挙型を使用していると全てのケースを配列として取得したい場合がる、その要件を満たすためにCaseIterableがある
// CaseIterableプロトコルへの準拠を宣言した列挙型は自動的にallCases staticプロパティが追加され、このプロパティが列挙型の全てを返します。

enum Fruit: CaseIterable {
    case peach, apple, grape
}

// 配列で返される
Fruit.allCases // [peach, apple, grape]

// コンパイラによるallCasesプロパティのCode自動生成
//　通常プロトコルに準拠するためには、プロトコルが定義しているプロパティやメソッドをプログラマが実装しなければならない
// 上記の例（Fruit）では定義していないにもかかわらずallCasesが使用できた
//　これは、連想値を持たない列挙型がCaseIterableプロトコルへの準拠を宣言した場合、そのCodeがコンパイラによって自動生成されるため
//　自分で実装も可能

enum FruitA: CaseIterable {
    case peach, apple, grape

    static var allCases: [FruitA] {
        return [.peach, .apple, .grape]
    }
}

FruitA.allCases // [peach, apple, grape]

// 上記は自明であるため、わざわざ自分で行う必要はない
//　これ以外には
// Equatable
// Hashable

// がある

// allCasesプロパティコードが自動生成されない条件
//　列挙型が連想値を持つ場合、allCasesの実装が自動生成されない
//　そのような場合でも列挙型でも全てのケースを列挙したい場合　自分で実装する必要がある

enum Car: CaseIterable {
    case toyota, nissan, honda(type: CarType)

    static var allCases: [Car] {
        return [
            .toyota,
            .nissan,
            .honda(type: .ban),
            .honda(type: .kei)
        ]
    }
}

enum CarType {
    case ban, kei
}

Car.allCases




