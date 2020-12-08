import Foundation

// webとの連携
/*

 データフォマットにはJson、通信はHTTPS

 Data型
 エンコード
 URLRecest

 */

//　Data型　バイト列を表す型
//　ファイルの読み書き、通信処理、外部システムとデータをやり取りする際に使用する


//　エンコード、デコード

//　エンコード　データを一定の規則に基づいて変換すること
//　デコード　エンコードしたデータを元に戻すこと

//　JsonEncoder JsonDecoder


let encoder = JSONEncoder()
let decoder = JSONDecoder()


let encoded = try encoder.encode(["key":"value"])
let jsonString = String(data: encoded, encoding: .utf8)!
print("エンコード結果: ", jsonString)

let deccoded = try decoder.decode([String: String].self, from: encoded)
print("デコード結果:", deccoded)


// Encodable, Decodable, Codable
// 別々でも使えるが、両方使いたい場合　Codable

struct SomeStruct: Codable {
    let value: Int
}

let some = SomeStruct(value: 1)

let jsonE = JSONEncoder()
let encodedJSONData = try! jsonE.encode(some)
let encodedJSONString = String(data: encodedJSONData, encoding: .utf8)!

print("Encoded:", encodedJSONString)

let jsonDecoder = JSONDecoder()
let decodedSomeStruct = try! jsonDecoder.decode(SomeStruct.self, from: encodedJSONData)

print("Decoded:", decodedSomeStruct)


//struct Not {}
//
//// Codableに準拠してないとerrorr
//struct Test: Codable {
//    let not: Not
//}


// HTTPによるwebサービスとの通信
/*

 URLSession
 - HTTPリクエストはURLRequest
 - HTTPレスポンスはHTTPURLResponse


 */



// URLRequest
//　通信のリクエストを表現する型、　HTTPリクエストのURL、ヘッダ、メソッド、ボディなどの情報を持つ

let url = URL(string: "https://api.github.com/search/repositories?q=swift")!
var reqest = URLRequest(url: url)

reqest.httpMethod = "GET"
// Acceptヘッダを設定し、呼び出し側が受け入れ可能なコンテンツの型式を指定する、Jsonを要求するので、application/jsonを指定する
reqest.addValue("application/json", forHTTPHeaderField: "Accept")

//　HTTPURKResponse

let session = URLSession.shared

let task = session.dataTask(with: reqest) { (data, response, error) in
    if let response = response as? HTTPURLResponse {
        response.statusCode // 200
        response.allHeaderFields["Date"]
        response.allHeaderFields["Content-Type"]
    }
}

task.resume()

// URLSesstionクラス

//　3種類のタスク
// SessionTaskには３つある

// dataTask
// uploadTask
// DownloadTask


// タスク実行
let urlA = URL(string: "https://api.github.com/search/repositories?q=swift")!
let sessionA = URLSession.shared
var reqestA = URLRequest(url: urlA)
let taskA = session.dataTask(with: reqestA) { (data, response, error) in
    // 通信処理を実行させる
}

taskA.resume() // これを呼ぶことによって実行される

