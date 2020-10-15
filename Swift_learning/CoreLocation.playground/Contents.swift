import UIKit
import CoreLocation
import PlaygroundSupport

let locationManager = CLLocationManager()
PlaygroundPage.current.needsIndefiniteExecution = true

class GeoCoordinateDelegate: NSObject, CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        print("Most Recent Location: " + location.description)
        print(location.coordinate.latitude)
        print(location.coordinate.longitude)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while updating " + error.localizedDescription)
    }

}

let geoCoordinateDelegate = GeoCoordinateDelegate()
locationManager.delegate = geoCoordinateDelegate
locationManager.desiredAccuracy = kCLLocationAccuracyBest
locationManager.startUpdatingLocation()
