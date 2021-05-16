import Foundation


/* Swiftのプロパティ名と、JSONのキー名が完全には一致しない場合は、キーマッピングの指定が可能
   CodingKeysというenum型を追加して、case名にプロパティ名を、「= "キー"」でJSONのキー名を指定します。
   キー名が無い場合は、同名で変換されます。
   caseが無いプロパティは変換の対象外になりますが、decodeで使う場合はデフォルト値の設定が必要です。
*/
struct Section: Codable {
    var name: String
    var menber: [Employee]
}

struct Employee: Codable {
    var code: String
    var name: String
    var age: Int
    var absence: Bool = false// 休暇中フラグ
    var position: String?
    var date: Date = Date()
    
    
    // CodingKeysに登録しない場合、初期値が入って変更されなくなる
    private enum CodingKeys: String, CodingKey {
        case code = "id"
        case name
        case age
        case absence
        case position
        case date
    }
}

//let originalObject = Employee(code: "001", name: "田中", age:  23, absence: true)

//let originalObjects:[Employee] = [Employee(code: "001", name: "田中", age:  23, absence: true),
//                                  Employee(code: "002", name: "山田", age:  43, absence: true),
//                                  Employee(code: "003", name: "河岸", age:  54, absence: true)]
//

let originalObjects = Section(name: "営業部",
                              menber: [Employee(code: "001", name: "田中", age:  54, absence: true, position: "部長", date: Date()),
                                        Employee(code: "002", name: "山田", age:  23, absence: false, date: Date()),
                                        Employee(code: "003", name: "河岸", age:  31, absence: false, date: Date())
                              ])

let encoder = JSONEncoder()
let decoder = JSONDecoder()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy年M月d日"


// -------------------------------------- //
encoder.outputFormatting = .prettyPrinted
encoder.dateEncodingStrategy = .formatted(dateFormatter)
guard let jsonValue = try? encoder.encode(originalObjects) else {
    fatalError("Failed to encode to JSON.")
}
print("***** JSONデータ *****")
print(String(bytes: jsonValue, encoding: .utf8)!)

// -------------------------------------- //
decoder.dateDecodingStrategy = .formatted(dateFormatter)
guard let section = try? decoder.decode(Section.self, from: jsonValue) else {
    fatalError("Failed to decode from JSON.")
}

print("***** Decode *****")
print(section.name)
section.menber.forEach {
    print($0)
}
//print(decodeEmployee)


