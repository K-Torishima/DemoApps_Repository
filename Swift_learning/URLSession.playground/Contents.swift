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
    func someTask() {
        let url = URL(string: "https://images-api.nasa.gov/search?media_type=image")!
        let task = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            guard let data = data, let urlResponse = urlResponse as? HTTPURLResponse else {
                return
            }
            self.dacoder(data: data)
            print("statusCode: \(urlResponse.statusCode)")
        }
        task.resume()
    }

    func printJson(_ data: Data) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(json)
        } catch {
            print("error")
        }
    }

    func dacoder(data: Data) {
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
client.someTask()
