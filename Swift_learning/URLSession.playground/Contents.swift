import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

public struct NasaImageApiSuccessResponse: Codable {
    let collection: NasaImageApiCollection
}

public struct NasaImageApiCollection : Codable {
    let items: [NasaImageApiItem]
}

public struct NasaImageApiItem : Codable {
    let data: [NasaImageApiItemData]
}

public struct NasaImageApiItemData : Codable {
    let nasaId: String

    /// APIの結果はsnake_caseだがそれをcamelCaseにマッピングする
    private enum CodingKeys: String, CodingKey {
        case nasaId = "nasa_id"
    }
}


class Client {
    let url = URL(string: "https://qiita.com/api/v2/items")!

    // GET
    internal func getTask() {
        let task = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            guard let data = data, let urlResponse = urlResponse as? HTTPURLResponse else {
                return
            }
            self.printJson(data)
//            self.dacoder(data: data)
//            print("statusCode: \(urlResponse.statusCode)")
//            print("url: \(urlResponse.url)")
//            print("mimeType: \(urlResponse.mimeType)")
//            print("expectedContentLength: \(urlResponse.expectedContentLength)")
//            print("textEncodingName: \(urlResponse.textEncodingName)")
//            print("suggestedFilename: \(urlResponse.suggestedFilename)")
//            print("allHeaderFields: \(urlResponse.allHeaderFields["Content-Type"] ?? "")")
        }
        task.resume()
    }

    // POST
    internal func postTask() {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = "".data(using: .utf8)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse else { return }
                print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
                print("statusCode: \(response.statusCode)")
                print(String(data: data, encoding: .utf8) ?? "")

        }
        session.resume()
    }

    private func printJson(_ data: Data) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(json)
        } catch {
            print("error")
        }
    }

    private func dacoder(data: Data) {
        do {
            let decoder = JSONDecoder()
            let res = try decoder.decode(NasaImageApiSuccessResponse.self, from: data)
            print(res.collection.items[3].data[0].nasaId)
        } catch {
            return
        }
    }
}

let client = Client()
client.getTask()
client.postTask()





// QittaのAPIでテストする



//struct Qiita: Codable {
//    var title: String
//    var user: String
//
//    struct User: Codable {
//        var name: String
//    }
//}
//
//class Client {
//    let url = URL(string: "https://qiita.com/api/v2/items")!
//
//    func get() {
//        let request = URLRequest(url: url)
//        var qiitaArray: [Qiita] = []
//
//        let session = URLSession.shared.dataTask(with: request) { (data, res, error) in
//            guard let jsonData = data else { return }
//            self.printJson(jsonData)
//
//            do {
//                let articles = try JSONDecoder().decode([Qiita].self, from: jsonData)
//                qiitaArray.append(contentsOf: articles)
//                print(articles)
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        session.resume()
//    }
//
//        private func printJson(_ data: Data) {
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                print(json)
//            } catch {
//                print("error")
//            }
//        }
//}
//
//let client = Client()
//client.get
