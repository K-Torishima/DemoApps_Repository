import Foundation

struct Employee: Codable {
    var code: String
    var name: String
    var age: Int
    var absence: Bool // 休暇中フラグ
}

//let originalObject = Employee(code: "001", name: "田中", age:  23, absence: true)

let originalObjects:[Employee] = [Employee(code: "001", name: "田中", age:  23, absence: true),
                                  Employee(code: "002", name: "山田", age:  43, absence: true),
                                  Employee(code: "003", name: "河岸", age:  54, absence: true)]
                                  




let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
guard let jsonValue = try? encoder.encode(originalObjects) else {
    fatalError("Failed to encode to JSON.")
}

//  json 出力
print("***** JSONデータ *****")
print(String(bytes: jsonValue, encoding: .utf8)!)

 
let decoder = JSONDecoder()
guard let decodeEmployee = try? decoder.decode([Employee].self, from: jsonValue) else {
    fatalError("Failed to decode from JSON.")
}

// Jsonをデコードした値
print("***** Decode *****")
decodeEmployee.forEach { print($0) }
//print(decodeEmployee)

