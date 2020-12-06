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


