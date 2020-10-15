import Foundation

let fruits = ["りんご": 100, "オレンジ": 80, "メロン": 700, "バナナ": 150, "パイナップル": 450]

for (key, value) in fruits {
    print("key: \(key),value: \(value)")
}


func test()  -> [String: Any] {
    let sum = fruits
    print(sum)
    return sum
}

test()


var personInfo: Dictionary<String, Any> = ["name" :"torishima", "age" : 28]

personInfo["sex"] = "man"
print(personInfo)
print(personInfo.keys)
print(personInfo.values)

//for (key, val) in personInfo {
//    print(key, val)
//}

personInfo.forEach { key, val in
    print(key, val)
}

personInfo.map {
    print($0.value)
}

extension Dictionary where Key == String, Value == String {
    func addIfNew(key: String, value: String) {
        print("これはextentionです. key: \(key), val: \(value)")
    }
}

let dic: [String: String] = [:]
dic.addIfNew(key: "testKey", value: "testValue")







