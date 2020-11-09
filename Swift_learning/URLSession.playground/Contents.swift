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
    let url = URL(string: "https://qiita.com/api/v2/items/a53b0b3f7e1bc7c06106/likes")!

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
