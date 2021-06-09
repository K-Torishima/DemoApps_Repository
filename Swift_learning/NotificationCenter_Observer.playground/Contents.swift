import UIKit

var str = "Hello, playground"

// 忘れたのでメモ

// 通知を送る人
class Poster {
    // someという名前のイベント
    static let notificationName = Notification.Name("some")
    // NotificationCenterに通知を投稿する
    // "some"という名前の通知を投稿している
    
    func post() {
        NotificationCenter.default.post(name: Poster.notificationName, // ここで"some" をpost
                                        object: nil)
    }
    // NotificationCenter.default.post()を使って、通知の名前（イベント名）、通知を送る側の、オブジェクトを渡す
    // nilの場合は通知を送る側のオブジェクトは指定しない
}

// 通知を受け取る人
class Observer {
    init() {
        addNotification()
    }
    
    deinit {
        removeNotification()
    }
    
    private func addNotification() {
        // NotificationCenterに通知を受け取るオブジェクトを登録する
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleNotification), // 通知を受け取った際に実行されるメソッド
            name: Poster.notificationName, // 受け取りたい通知のイベント名 someを受信
            object: nil)
    }
    
    private func removeNotification() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func handleNotification(notification: Notification) {
        print("通知を受け取りました。")
    }
}

var observer: Observer = Observer()
let poster: Poster = Poster()
//poster.post()

// someというイベント名をオブザーバーで受け取り、handleNotificationを実行している

/*
 posterとobserverをインスタンス化し、Posterクラスのpostメソッドを呼び出すとサブジェクトであるNotificationCenterクラスを通じて
 "some"を実行している
 
 Observerはこのクラスを受け取り、handleNotificationを実行している

 */



// 複数の場合
//　Observer2を作る

final class Observer2 {
    init() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleNotification),
                                               name: Poster.notificationName,
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @objc private func handleNotification(notification: Notification) {
        print("通知を受け取りました2")
    }
}

var observer2: Observer2 = Observer2()
poster.post()
