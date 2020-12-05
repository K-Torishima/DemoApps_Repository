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



