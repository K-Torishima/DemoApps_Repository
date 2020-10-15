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

extension Dictionary where Key == String, Value == String {
    func addIfNew(key: String, value: String) {
        print("これはextentionです. key: \(key), val: \(value)")
    }
}

let dic: [String: String] = [:]
dic.addIfNew(key: "testKey", value: "testValue")


private extension Dictionary where Key == String, Value == Any {
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

//private var locationManager: CLLocationManager!
//
////func gpsDictionary() -> NSDictionary? {
////    guard let location = locationManager.location, CLLocationManager.locationServicesEnabled() else { return nil }
////    let gps: NSMutableDictionary = NSMutableDictionary()
////    gps.setValue("N", forKey: kCGImagePropertyGPSLatitudeRef as String)
////    gps.setValue("E", forKey: kCGImagePropertyGPSLongitudeRef as String)
////    gps.setValue(NSNumber(value: location.coordinate.latitude as Double), forKey: kCGImagePropertyGPSLatitude as String)
////    gps.setValue(NSNumber(value: location.coordinate.longitude as Double), forKey: kCGImagePropertyGPSLongitude as String)
////    return gps
////}
//
//
/////　OS14以降では正確な位置情報がOFFの場合、写真情報にGpsDataを載せない
//func gpsDictionary() -> NSDictionary? {
//    let gps: NSMutableDictionary = NSMutableDictionary()
//    if #available(iOS 14.0, *) {
//        switch locationManager.accuracyAuthorization {
//        case .reducedAccuracy:
//            break
//        case .fullAccuracy:
//            getGps()
//        @unknown default:
//            assertionFailure("@unknown default")
//        }
//    } else {
//        getGps()
//    }
//    return gps
//}
//
//private func getGps() -> [String : Any ] {
//    //緯度:latitude
//    //経度:longtitude
////    guard let location = locationManager.location, CLLocationManager.locationServicesEnabled() else { return }
////    let n = kCGImagePropertyGPSLatitudeRef
////    let e = kCGImagePropertyGPSLongitudeRef
//    let coordinate = CLLocationCoordinate2D()
//    let dic = Dictionary(coordinate: coordinate)
//
//    return dic
//}
//
//
