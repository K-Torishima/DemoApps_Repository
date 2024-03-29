import Foundation

// Errorハンドリング

/*

 swiftの主なError処理
 - オプショナル
 - Result型
 - do-catch

 想定外の状況に陥った時のアプリケーションの強制終了
 - fatalError
 - アサーション
 */


//　オプショナル型によるerror処理
/*

 オプショナル型を用いたerror処理では、処理の結果をオプショナルで表し、
 値が存在すれば成功、存在しなければ失敗とみなす
 errorが発生しえる関数であればその戻り値をオプショナルにする


 下記例

 User IDを渡すと、対応するUserを返す　findUser関数を定義するとする
 戻り値の型をオプショナルにして、対応するユーザーが存在しない場合はnilを返却するようにすれば、
 結果の有無を処理の成否として扱える

 */

struct User {
    let id: Int
    let name: String
    let email: String
}

func findUser(byID id: Int) -> User? {
    let users = [
        User(id: 1,
             name: "koji",
             email: "koji@email.com"),
        User(id: 2,
             name: "taro",
             email: "taro@email.com")]


    for user in users {
        if user.id == id {
            return user
        }
    }
    return nil
}

let id = 1
if let user = findUser(byID: id) {
    print("Name: \(user.name)")
} else {
    print("Error: User not found")
}


/*

 オプショナル型の処理の成否に利用している例としては、他にも失敗可能イニシャライザがある
 次の例は
 Userは各プロパティの初期値を渡してインスタンス化できるが、
 引数のメールアドレスが文字＠によって2分割できなければ、
 不正なデータとみなしてインスタンス化を失敗させている
 */


struct UserA {

    let id: Int
    let name: String
    let email: String

    init?(id: Int, name: String, email: String) {
        let components = email.components(separatedBy: "@")

        guard components.count == 2 else {
            return nil
        }

        self.id = id
        self.name = name
        self.email = email
    }
}

if let user = UserA(id: 0, name: "koji", email: "koji@email.com") {
    print("UserName: \(user.name)")
} else {
    print("Error: Invalid data")
}


// 利用するべき時
// 値の有無だけで結果を十分に表せる
//　値の有無だけで処理の結果を十分に表せるときに利用すべき
//　errorを発生させる側もerrorを処理する側も実装を簡潔に書ける


//　Result型
/*

 Success  成功の値
 Failure　errorの型

 */


//　実装方法
//　SwiftにはErrorプロトコルがある
// Result<Success,Failure>型の型引数Failureはerrorを表すため、Errorプロトコルに準拠している


enum DatabaseError: Error {
    /// データが見つからないerror
    case entryNotFound
    /// 重複したデータによるerror
    case duplicatedEntry
    /// 不正なデータによるerror
    case invalidEntry(reason: String)
}


struct UserD {
    let id: Int
    let name: String
    let email: String
}


func findUserA(byID id: Int) -> Result<UserD, DatabaseError> {
    let users = [
        UserD(id: 1, name: "koji", email: "koji@email.com"),
        UserD(id: 2, name: "kenta", email: "kenta@email.com"),
    ]

    for user in users {
        if user.id == id {
            return .success(user)
        }
    }

    return .failure(.entryNotFound)
}


let idA = 1
let result = findUserA(byID: idA)

switch result {
case let .success(user):
    print(".success: \(user)")
case let .failure(error):
    switch error {
    case .entryNotFound:
        print(".failure: .entryNotFound")
    case .duplicatedEntry:
        print(".failure: .duplicatedEntry")
    case .invalidEntry(let reason):
        print(".faiure: .invalidEntry(\(reason))")
    }
}


// 利用すべき時
/*

 Result型によるError処理を利用すべき点はどこか
 - エラーの詳細を提供する
 - 成功か失敗のいずれかであることを証明する
 - 非同期処理のErrorを扱う

 */


//　do-catch

// 実装方法
//
//do {
//    throw文によるerror が発生する可能性のある処理
//} catch {
//    error 処理
//    定数errorrを通じてerror値にアクセスできる
//}
//


struct SomeError: Error {}

do {
    throw SomeError()
    print("success")
} catch {
    print("Faile\(error)")
}


enum SomeErrorA: Error {
    case error1
    case error2(reason: String)
}

do {
    throw SomeErrorA.error2(reason: "何かがおかしいようです")
} catch SomeErrorA.error1 {
    print("error1")
} catch SomeErrorA.error2(let reason) {
    print("error2: \(reason)")
} catch {
    print("Unknown error: \(error)")
}

// Errorプロトコル
// throw文のerror を表現する型は、Errorプロトコルに準拠している必要がある
// Errorプロトコルは準拠した型がerrorを表現する型として扱えることを示すためのプロトコルで、準拠するために必要な実装はない

// Errorプロトコルに準拠する型は、列挙型として定義することが一般的である
//　これは、発生するerrorを網羅的に記述できるというメリットがある
//　errorの種類ごとに別の型を定義することが一般的である


// ローカルDBにアクセスする際に発生するerrorはこちらに定義
enum DatabaseErrorA: Error {
    case entryNotFound
    case duplicatedEntry
    case invalidEntry(reason: String) // 連想値を利用することで、エラーに付随する情報を表現することもできる
}

//　通信を行う際に発生するerrorはこちらに定義
enum NetworkError: Error {
    case timedOut
    case cancelled
}

//　throws
//　関数、イニシャライザ、クロージャの定義にthowsを追加すると、それらの処理のなかでdo-catch文を用いずにthows文によるerrorを発生させることができる

//func 関数名(引数) throws -> 戻り値の型 {
//    throw文によるerrorが発生する可能性のある処理
//}
//

enum OperationError: Error {
    case overCapacity
}


func triple(of int: Int) throws -> Int {
    guard int <= Int.max / 3 else {
        throw OperationError.overCapacity
    }

    return int * 3
}

//　定数にthrowsキーワードを指定していない場合,do-catch文で囲まれていないthrow文によるエラーはコンパイルエラーとなる
// 上記のtriple関数にthrowsキーワードが指定されてない場合コンパイルerrorになる

/*
func tripleError(of int: Int) -> Int {
    guard int <= Int.max / 3 else {
        // 関数にthrowsが指定されてないため
        // do catchで囲まれてないthrow文によるerrorはコンパイルerror
        throw OperationError.overCapacity
    }
    return int * 3
}

 */

/*

 throwsはイニシャライザにも使用できる
 インスタンス化の途中に発生したerrorを呼び出し元に伝えることができる
 */

enum AgeError: Error {
    case outOfRange
}

struct Teenager {
    let age: Int

    init(age: Int) throws {
        guard case 13...19 = age else { throw AgeError.outOfRange

        }

        self.age = age
    }
}

//　rethrows 引数のクロージャが発生させるerrorの呼び出し元への伝播
//  クロージャが発生させるerror の処理を関数の呼び出し元に任せることができる


struct SomeErrorC: Error {}

func rethorwingFunction(_ throwingClosure: () throws -> Void) rethrows {
    try throwingClosure()
}

do {
    try rethorwingFunction {
        throw SomeErrorC()
    }
} catch {
    // 引数のクロージャが発生させるerrorを、関数の呼び出し元で処理
    error // SomeError
}


//　関数内で、引数のクロージャが発生させるerror を処理し、別のerror を発生させることもできる
//　例：引数throwingClosureが発生させるerror SomeError.originalErrorを処理し、catch節内で別の errorを発生させている

enum SomeErrorD: Error {
    case origialError
    case convertedError
}



func rethorwingFunctionA(_ throwingClosure: () throws -> Void) rethrows {
    do {
        try throwingClosure()
    } catch {
        throw SomeErrorD.convertedError
    }
}

do {
    try rethorwingFunctionA {
        throw SomeErrorD.origialError
    }
} catch {
    error // ConvertedError
}


//　try エラーを発生させる可能性のある処理の実行

/*

 throwsを呼びたすには、それらの処理の呼び出しの前にtryを追加してtry関数名（引数）のように記述する
 tryキーワードを用いた処理の呼び出しは、throwと同様に、do-catch文のdo節とtheowsキーワードが指定された処理の内部のみで使用する

*/

enum OperationErrorA: Error {
    case overCapacity
}


func tripleA(of int: Int) throws -> Int {
    guard int <= Int.max / 3 else {
        throw OperationErrorA.overCapacity
    }

    return int * 3
}

let int = Int.max

do {
    let tripleOfInt = try tripleA(of: int)
    print("Success: \(tripleOfInt)")
} catch {
    print("Error: \(error)")
}

// try! errorを無視できる

// Int.maxだったら error は出る超えてしまっているのでだめ
// 初めからerrorが出ないような値ならerrorは出ないので
// do catch いらない

let intA = 10
let tripleOfIntA = try! tripleA(of: intA)
print(tripleOfIntA)

// try?
// Errorをオプショナル型で表す処理の実行

if let triple = try? tripleA(of: 9) {
    print(triple)
}

// 失敗可能イニシャライザにも使える

//deferによるerrorの有無にかかわらない処理の実行

do {
    defer {
        print("second")
    }
    print("first")
}


//　利用するとき
//　do catchを利用するとき

// Errorの詳細を提供する

enum DatabaseErrorE: Error {
    case entryNotFound
    case duplicatedEntry
    case invalidEntry(reason: String)
}

struct UserE {
    let id: Int
    let name: String
    let email: String
}

func findUserB(byID id: Int) -> Result<UserE, DatabaseErrorE> {
    let users = [
        UserE(id: 1, name: "koji", email: "koji@gmail.com"),
        UserE(id: 2, name: "kenta", email: "kenta@gmail.com"),

    ]


    for user in users {
        if user.id == id {
            return .success(user)
        }
    }

    return .failure(.entryNotFound)
}

func localPart(fromEmail email: String) -> Result<String, DatabaseErrorE> {
    let components = email.components(separatedBy: "@")

    guard components.count == 2 else {
        return .failure(.invalidEntry(reason: "Invalid email address"))
    }

    return .success(components[0])
}

let userID = 1

switch findUserB(byID: userID) {
case .success(let user):
    switch localPart(fromEmail: user.email) {
    case .success(let localPart):
        print("Local part: \(localPart)")
    case .failure(let error):
        print("Error: \(error)")
    }
case .failure(let error):
    print("Error: \(error)")
}

//　上記のCodeをdo catchでリファクタ


func findUserC(byID id: Int) throws -> UserE  {
    let users = [
        UserE(id: 1, name: "koji", email: "koji@gmail.com"),
        UserE(id: 2, name: "kenta", email: "kenta@gmail.com"),

    ]


    for user in users {
        if user.id == id {
            return user
        }
    }

    throw DatabaseErrorE.entryNotFound
}


func localPartA(fromEmail email: String) throws -> String {
    let components = email.components(separatedBy: "@")

    guard components.count == 2 else {
        throw DatabaseErrorE.invalidEntry(reason: "Invalid email address")
    }
    return components[0]
}

let userIDA = 1

do {
    let user = try findUserC(byID: userIDA)
    let localPartOfEmail = try localPartA(fromEmail: user.email)
    print("Local part: \(localPartOfEmail)")
} catch {
    print("Error: \(error)")
}


// 上記の方がより命令的、直感的なCodeと言える

//　error処理を強制する
//　なんかいろいろあるが実践でいろいろ見ていくと良さそう



// fatalError関数によるプログラムの終了
//　fatelError
//　実行されること自体が、想定外であることを宣言するための関数
//　これが呼ばれると、プログラムは終了する


//　実装方法
//　fatelError("想定しないerrorが発生したため、プログラムを終了します")

//　Never型　値を返さないことを示す型

func aaa() -> Int {
    fatalError("まだ実装されてない")
    // Never型なので戻り値書かなくて良い
}

//　よくある実装

//enum Index: Int {
//    case red = 0
//    case blue = 1
//    case yellow = 2
//}


func title(forButtonAt index: Int) -> String {
    switch index {
    case 0:
        return "赤"
    case 1:
        return "青"
    case 2:
        return "黄色"
    default:
        fatalError("想定外のボタンインデックス\(index)を受け取りました")
    }
}

let aaaa = title(forButtonAt: 0)

// アサーション

//　assert() 条件を満たさない場合に終了する
//　実装される際に満たされるべき条件を宣言するための関数
//　この関数の実行時に条件が満たされない場合プログラムを実行する

//　条件式がtrue の時は、通常通り後続の処理が実行されるが、falseの時は実行errorが発生してプログラムを実行する
//　リリースビルドの時は効果がないので、Never型ではない

func format(minute: Int, second: Int) -> String {
    assert(second < 60, "secondは60未満に設定してください")
    return "\(minute) 分 \(second)秒"
}

format(minute: 24, second: 48)
// format(minute: 24, second: 90) // 実行時errorr
//　error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).


// assertionFailure()　必ず終了する
//　条件を持たない常に失敗するもの
//　実行されること自体が条件を満たしてないので、第一引数にfalseをとるassertと等価
//　fatelErrorと同様に、その箇所が実行されること自体が想定外となる

func printSeason(forMonth month: Int) {
    switch month {
    case 1...2, 12:
        print("冬")
    case 3...5:
        print("春")
    case 6...8:
        print("夏")
    case 9...11:
        print("秋")
    default:
        assertionFailure("monthには1から12までの値を設定してください")
    }
}

// これは条件網羅すればいらなそう

printSeason(forMonth: 11)
printSeason(forMonth: 12)
printSeason(forMonth: 13)
// Assertion failed: secondは60未満に設定してください: file __lldb_expr_31/ErrorHandling.playground, line 565


// コンパイルの最適化ラベル
// デバック時、アサーションは有効で、リリース時には無効


//　使う時
// リリース時には想定外の状況でも、プログラムの実行を継続する
//　fatalErrorとの使い分けが必要


// 今までのものの使い分け

/*
 - optional:
    エラーの詳細情報が不要で結果の成否によってエラーを扱える場合
 - Result:
    非同期の場合
 - do catch:
    同期処理の場合
 - fatalError:
    エラー発生時にプログラムの実行を終了したい場合
 - アサーション:
    デバック時のみ、エラー発生時にプログラムの実行を終了したい時

 */



