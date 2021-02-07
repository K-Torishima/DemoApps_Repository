//
//  ViewController.swift
//  Map
//
//  Created by 鳥嶋 晃次 on 2021/02/07.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        mapView.delegate = self
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        getNawLoc()
        createPin()
        mapViewTapedEditPin()
       
    }
    
    @IBAction func getAddres(_ sender: Any) {
        geoCording()
    }
    
    @IBAction func TapReverseGeoCording(_ sender: Any) {
        reverseGeoCording()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = locationManager.authorizationStatus
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            //  現在地の取得を開始する
            locationManager.startUpdatingLocation()
            print("現在地を取得する")
        case .notDetermined, .denied, .restricted:
             print("許可されてないので専用処理をする")
        default:
            break
        }
        
        switch locationManager.accuracyAuthorization {
        case .fullAccuracy:
            print("正確な位置情報")
        case .reducedAccuracy:
            print("曖昧な位置情報")
        @unknown default:
            print("unknown def")
        }
    }
}

extension ViewController {
    // 現在地に照準を合わせる
    
    func getNawLoc() {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        // 初期の照準位置を変更したい場合はcenterを変えれば良い
        // 任意の場所にできる
        let tokyoStation = CLLocationCoordinate2DMake(35.681236, 139.767125)
//        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: span)
        let region = MKCoordinateRegion(center: tokyoStation, span: span)
        
        mapView.region = region
    }
}


extension ViewController {
    // Pinの立て方
    
    func createPin() {
        let tokyoStation = CLLocationCoordinate2DMake(35.681236, 139.767125)
        let coordinate = tokyoStation
        let pin = MKPointAnnotation()
        pin.title = "ピンのタイトルです"
        pin.subtitle = "これはサブタイトルです"
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
}

extension ViewController: MKMapViewDelegate {
    // Pinがtapされた時の処理
    // MKMapViewDelegateを使う
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // タップされたpinの位置情報
        print(view.annotation?.coordinate as Any)
        // タップされたpinのタイトルとサブタイト
        print(view.annotation?.title as Any)
        print(view.annotation?.subtitle as Any)
    }
}

extension ViewController {
     // タップしたところにpinを立てる方法
    
    func mapViewTapedEditPin() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(tapMapEditPin(sender:)))
        self.mapView.addGestureRecognizer(longPress)
    }
    
    @objc private func tapMapEditPin(sender: UILongPressGestureRecognizer) {
        
        if sender.state != UIGestureRecognizer.State.began {
            return
        }
        
        let location = sender.location(in: self.mapView)
        let coordinate = self.mapView.convert(location, toCoordinateFrom: self.mapView)
        
        print(coordinate.latitude)
        print(coordinate.longitude)
        
        // タップしたところに照準を合わせる
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        self.mapView.region = region
    
        // pinを生成
        let pin = MKPointAnnotation()
        pin.title = "緯度: \(coordinate.latitude) \n 経度: \(coordinate.longitude)"
        pin.subtitle = "詳細です"
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
}

extension ViewController {
    // 住所検索
    
    // ジオコーディング(住所から緯度・経度)
    func geoCording() {
        // 検索で入力した値を代入(今回は固定で有楽町駅)
        let address = "東京都千代田区有楽町２丁目"
        var resultlat: CLLocationDegrees!
        var resultlng: CLLocationDegrees!
        // 住所から位置情報に変換
        CLGeocoder().geocodeAddressString(address) { placemarks, error in
            if let lat = placemarks?.first?.location?.coordinate.latitude {
                // 問題なく変換できたら代入
                print("緯度 : \(lat)")
                resultlat = lat
                
            }
            if let lng = placemarks?.first?.location?.coordinate.longitude {
                // 問題なく変換できたら代入
                print("経度 : \(lng)")
                resultlng = lng
            }
            // 値が入ってれば
            if (resultlng != nil && resultlat != nil) {
                // 位置情報データを作成
                let cordinate = CLLocationCoordinate2DMake(resultlat, resultlng)
                let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                // 照準を合わせる
                let region = MKCoordinateRegion(center: cordinate, span: span)
                self.mapView.region = region
                
                // 同時に取得した位置にピンを立てる
                let pin = MKPointAnnotation()
                pin.title = "有楽町駅"
                pin.subtitle = "ここは有楽町駅です"
                
                pin.coordinate = cordinate
                self.mapView.addAnnotation(pin)
            }
        }
    }
}

extension ViewController {
    
    //    緯度・経度から住所を取得する(逆ジオコーディング)
    
    func reverseGeoCording() {
        // 住所を取得したい位置情報を宣言(今回は東京駅にセット)
        let location = CLLocation(latitude: 35.681236, longitude: 139.767125)
        // 位置情報から住所を取得
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first, error == nil else { return }
            // 市区町村より下の階層が出力
            print(placemark.name!)
            // 都道府県
            print(placemark.administrativeArea!)
            // なんとか郡とかがあれば(ない場合もあるのでnull回避)
            print(placemark.subAdministrativeArea ?? "")
            // 市区町村
            print(placemark.locality!)
            // これで日本語の住所はいい感じにでる
            print(placemark.administrativeArea! + placemark.locality! + placemark.name!)
        }
    }
}
