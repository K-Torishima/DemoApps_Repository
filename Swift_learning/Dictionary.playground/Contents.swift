import Foundation
import CoreLocation
import CoreMotion
import Photos

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

//  特定の機能を追加している where 型がwhere以下の条件を満たす場合のみ有効になる定義を追加するという構文になります。

extension Dictionary where Key == String, Value == String {
    // 制約をすべて満たす場合にのみ有効となる定義
    func addIfNew(key: String, value: String) {
        print("これはextentionです. key: \(key), val: \(value)")
    }
}

let dic: [String: String] = [:]
dic.addIfNew(key: "testKey", value: "testValue")


private extension Dictionary where Key == String, Value == Any {
    // 制約をすべて満たす場合にのみ有効となる定義
    init(coordinate: CLLocationCoordinate2D) {
        // 順番変えている
        self.init(dictionaryLiteral:
                    (kCGImagePropertyGPSLatitudeRef as String, "N"),
                  (kCGImagePropertyGPSLongitudeRef as String, "E"),
                  (kCGImagePropertyGPSLatitude as String, NSNumber(value: coordinate.latitude as Double)),
                  (kCGImagePropertyGPSLongitude as String, NSNumber(value: coordinate.longitude as Double))
        )
    }
}
