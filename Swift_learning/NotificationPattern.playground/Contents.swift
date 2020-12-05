import Foundation

// UI要素のタップや、プロパティの値変更など、アプリケーション内で発生するあらゆる事象のことをイベントという
//　また、イベントの発生箇所となるオブジェクトが、他のオブジェクトにイベントの発生を伝えることをイベント通知という
//　イベント通知を行う方法は複数ある、用途によって適切な方法が異なる

//　Swiftにおけるイベント通知パターン
/*

 - 複数のオブジェクトが互いにイベント通知を行い合う場合、やみくもにオブジェクト同士を参照させ合えば良いわけではない
 - 闇雲に実装すると、依存関係が複雑になり過ぎて、メンテナンスが不可能になってしまう
 - メモリーリークが発生してしまったりする可能性がある
 - 用途ごとに適切な方法がある

 - デリゲートパターン
 - クロージャ
 - オブザーバーパターン

 */


/// デリゲートパターン
//　別オブジェクトへの処理の委譲
/*

 デリゲートパターンは、あるオブジェクトの処理を別のオブジェクトに代替えさせるパターン、
 デリゲート元のオブジェクトは適切なタイミングで、デリゲート先のオブジェクトにメッセージを送る
 デリゲート先のオブジェクトはメッセージを受けて、自分自身や別のオブジェクトの状態を変更したり、
 何かしらの結果をデリゲート元のオブジェクトに返したりする
 デリゲートパターンを用いると、デリゲート先のオブジェクトを切り替えることで、デリゲート元のオブジェクトを切り替えることで
 デリゲートものと振る舞いを柔軟に変更できる
 一方で必要な処理はプロトコルとして自前に宣言されている必要がある
 記述するCodeは長くなりがちである

 */


//　実装方法

/*

 委譲する処理をプロトコルのメソッドとして宣言する
 デリゲート先のオブジェクトはそのプロトコルに準拠し、
 デリゲート元のオブジェクトからの処理の委譲に応えられるようにする
 デリゲート元のオブジェクトはデリゲート先のオブジェクトをプロパティとして持ち、デリゲート先のメソッドを実行して処理を委譲する



 */


//　インターフェース
protocol GameDelegate: class {
    var numberOfPlayers: Int { get }
    func gameDidStart(_ game: Game)
    func gameDidEnd(_ game: Game)
}

// GameDelegateに準拠している
class TwoPersonsGameDelegate: GameDelegate {
    var numberOfPlayers: Int {
        return 2
    }

    func gameDidStart(_ game: Game) {
        print("Game start")
    }

    func gameDidEnd(_ game: Game) {
        print("Game end")
    }
}


class Game {
    // delegateを、持っている
    weak var delegate: GameDelegate?

    func start() {
        print("Number of players is \(delegate?.numberOfPlayers ?? 1)")
        delegate?.gameDidStart(self)
        print("Playing")
        delegate?.gameDidEnd(self)
    }
}


let delegate = TwoPersonsGameDelegate()
let twoPersonsGame = Game()
twoPersonsGame.delegate = delegate
twoPersonsGame.start()


//　命名規則
/*
 デリゲートパターンでは、デリゲート先にデリゲート元から呼び出されるメソッド群を実装する必要がある。
 どのようなメソッド群を実装する必要があるかはプロトコルとして宣言する

 - メソッド名はデリゲート元のオブジェクト名から初め、続いてイベントを説明する
 - did,willなどの、助動詞を用いてイベントのタイミングを示す
 - 第一引数には、デリゲート元のオブジェクトを渡す


 こうした命名規則があることによって、
 - 誰が、
 - いつ
 - どういう場合に呼ぶのかが明確になる

 これらの命名規則は、自分自身で定義したデリゲートメソッドにも適用すべきである
 名前の衝突を回避できる実用上の効果がある
 既存のフレームワークと違和感なく強調させることができるので、利用する側が扱いやすいというメリットがある
 */


// 弱参照による、循環参照への対処
// weakをつけてね


// デリゲートパターンを利用するとき
/*

 ２つのオブジェクト間で多くの種類のイベント通知を行う
 外部からのカスタマイズを前提としたオブジェクトを設計する
 APIの一部をカスタマイズ可能にしたい場合、軽症ではなくデリゲートパターンを選択すべきである

 */


//　クロージャ
//　別オブジェクトへのコールバック時の処理の登録

//　例

class GameA {
    private var result = 0

    func start(completion: (Int) -> Void) {
        print("Playng")
        result = 42
        completion(result)
    }
}


let game = GameA()
game.start { result in
    print("Result is \(result)")
}


// キャプチャリスト　キャプチャ時の参照方法の制御

/*

 クロージャーのキャプチャとは、スコープに依存する変数や定数への参照を、クロージャでも保持することを言う
 デフォルトでは、キャプチャはクラスのインスタンスへの今日参照となる
 クロージャが解放されない限りはキャプチャされたクラスのインスタンスは解放されない

 */


import PlaygroundSupport
import Dispatch

PlaygroundPage.current.needsIndefiniteExecution = true


class SomeClass {
    let id: Int

    init(id: Int) {
        self.id = id
    }

    deinit {
        print("deinit")
    }
}

do {
    let object = SomeClass(id: 42)

    let queue = DispatchQueue.main

    queue.asyncAfter(deadline: .now() + 3) {
        print(object.id)
    }
}


// キャプチャリストを用いることで、弱参照を持つことができる
//　クロージャの開放状況に依存せずにクラスのインスタンスの解放が行われる
//　キャプチャを弱参照にすることは、クロージャとキャプチャされたクラスのインスタンスの循環参照の解消にも役立つ
//　weak 、unowed　を[] の中に書く


print("_____________________________________")


class SomeClassA {
    let id: Int

    init(id: Int) {
        self.id = id
    }
}

let object1 = SomeClassA(id: 42)
let object2 = SomeClassA(id: 43)

let closure = { [weak object1, unowned object2] () -> Void in
    print(type(of: object1))
    print(type(of: object2))
}

closure()

//weakキーワード
//　メモリ解放を想定した弱参照

class SomeClassB {

    let id: Int

    init(id: Int) {
        self.id = id
    }
}

do {
    let obj = SomeClassB(id: 42)

    let closure = { [weak obj] () -> Void in
        if let o = obj {
            print("objはまだ解放されていない: id => \(o.id)")
        } else {
            print("objは既に解放されました")
        }
    }

    print("ローカルスコープ内で実行: ", terminator: "")
    closure()

    let q = DispatchQueue.main

    q.asyncAfter(deadline: .now() + 1) {
        print("ローカルスコープ外で実行: ", terminator: "")
        closure()
    }
}


//　ローカルスコープ実行中は、定数objectの値はまだ解放されていない
//　しかし、スコープから抜けた1秒後では、定数objectの値はnilとなる


//　unowned
// weak同様に指定した場合、と同じような動きをするが、
// 参照先のインスタンスが既に解放された場合も、unowedキーワードを指定してキャプチャした変数や定数の値はnilにならない
// 参照先のインスタンスが解放された後にunownedキーワードが指定された変数や、定数へアクセスすると、不正アクセスになり、実行時errorを招く



class SomeClassC {

    let id: Int

    init(id: Int) {
        self.id = id
    }
}

do {
    let obj = SomeClassC(id: 42)

    let closure = { [unowned obj] () -> Void in
        print("objはまだ解放されていない: id => \(obj.id)")
    }

    print("ローカルスコープ内で実行: ", terminator: "")
    closure()

    let q = DispatchQueue.main

    q.asyncAfter(deadline: .now() + 1) {
        print("ローカルスコープ外で実行: ")
        closure() //　ここの時点で実行時Errorになる
    }
}


//　キャプチャリストの使い分け、

/*
循環参照を招かない参照
 - クロージャの実行時に参照するインスタンスが必ず存在すべき場合は、キャプチャリストを使用しない
 - クロージャの実行時に参照するインスタンスが存在しなくても良い場合は、weakキーワードを使用する

循環参照を招く参照
 - 参照するインスタンスが先に解放される可能性がある場合は、weakをつける
 - 参照するインスタンスが先に解放される可能性がない場合は、weak or unownedをつける
 　（実行時にnilになることがない場合unownedをつけることで使用が明確になる）

 */



// escaping属性によるselfキーワードの必須化
/*

 escapingがある場合はselfを省略できない
 selfをつけることで循環参照に気付きやすくなる
 */

class Executor {
    let int = 0

    var lastExecutedClosure: (() -> Void)? = nil

    func execute(_ closure: @escaping () -> Void) {
        closure()
        lastExecutedClosure = closure
    }

    func executePrintInt() {
        execute {
            print(self.int)
        }
    }
}

/*

 上記CodeはexecutePrintInt()メソッド内のexecute(_:)メソッドの呼び出しでselfのキャプチャが行われ、
 execute(_:)メソッド内ではキャプチャを行ったクロージャをストアドプロパティlastExecutedClosureに保存している
 selfはストアドプロパティに保存されているため循環参照が発生している
 上記の例のクロージャ内では、selfを使用してintプロパティにアクセスしているため
 selfがキャプチャされ、循環参照の可能性があることに気づきやすくなる
 逆に、もしselfを使用せずにintにアクセス可能だった場合、selfがキャプチャされていることに気づきにくい

 */


//　typealiasによる複雑なクロージャ型絵のアクセス
//　型エイリアスを設定できる
//　読みにくい引数の時はまとめたりできる

func some(completion: (Int?, Error?, Array<String>?) -> Void) {}
//　これは大変読みにくい

typealias CompletionHandler = (Int?, Error?, Array<String>?) -> Void

func method(completion: CompletionHandler) {}

// 上記のようにすれば、何度も同じクロージャの方が出てくる場合もコードが煩雑（はんざつ）にならない
//　また、クロージャが何を意味しているのかも型エイリアスで明確にわかる

//　クロージャを利用すべき時
// 処理の実行とコールバックを同じ箇所に記述する
// デリゲートと比べると処理の流れが追いやすい
//　完了イベントのみ受け取りたい時はコールバックで良い
//　コールバックの種類がいくつもある場合はデリゲートを使った方が良い



// オブザーバーパターン

/*
//　デリゲートパターンとクロージャーパターンは１対１のイベント通知でしか有効ではない
//　1対多の場合はオブザーバーパターンが有効
//　Notification型　NotificationCenter

 主なプロパティ

 - name
 - object
 - userInfo

 イベント通知は次のような手順で実装する

 通知を受け取るオブジェクトにNotification型の値を引数に持つメソッドを実装する
 NotificationCenterクラスに通知を受け取るオブジェクトを登録する
 NotificationCenterクラスに通知を投稿する

*/


//　通知を発生させるもの
class Poster {

    static let notificationName = Notification.Name("SomeNotification")

    // 投稿
    func post() {
        NotificationCenter.default.post(
            name: Poster.notificationName,
            object: nil)
    }
}

//　通知を受け取るもの
class Observer {

    // 登録
    init() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleNotification(_:)),
                                               name: Poster.notificationName,
                                               object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // これで通知を受け取っている
    @objc func handleNotification(_ notification: Notification) {
        print("通知を受け取りました")
    }
}

var observer = Observer()
let poster = Poster()
poster.post()

//　ここは今後コンバインで良くなるのであまり深掘りしなくても良い
//　Rxだったらこれは出てこない

