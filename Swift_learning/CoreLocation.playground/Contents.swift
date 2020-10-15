import UIKit
import CoreLocation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


class LocationSample: NSObject, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let accuracy = manager.accuracyAuthorization
        let status = manager.authorizationStatus
        switch accuracy {
        case .fullAccuracy:
            print("正確")
        case .reducedAccuracy:
            print("曖昧")
        default:
            break
        }

        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            break
        case .notDetermined, .denied, .restricted:
            break
        default:
            break
        }
    }
}

LocationSample()

