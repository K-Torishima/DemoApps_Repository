//
//  ViewController.swift
//  Language
//
//  Created by koji torishima on 2020/11/11.
//

import UIKit


//  端末の言語設定を取得
//　取得した設定をきLangType と比較
//　比較した文言をLangに載せてパラメータに送る

enum LangType: String {
    case ja = "ja"
    case en = "en"
    case vi = "vi"
    case id = "id"
    case zhHans = "zh-Hans"
    case zhHant = "zh-Hant"
}

class ViewController: UIViewController {


//    端末のLangを取得
    let locale = Locale.current

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Locale.autoupdatingCurrent.languageCode)
        
//       取得したLangを表示
//        print("現在のlocale言語: \(locale[0])")
//        print(locale[0])
        let aaaa = Locale.current.acceptLnguage
            print("return val \(aaaa)")


    }


//    言語比較
//    端末の言語を比較しprintを指定
//    printを値としてパラメータに指定させる
//    func changeLanguages() -> String {
//        let val = locale[0]
//
//        if val.contains("ja") {
//            print("ja")
//        } else if val.contains("en") {
//            print("en")
//        } else if val.contains("vi") {
//            print("vi")
//        } else if val.contains("id") {
//            print("id")
//        } else if val.contains("zh-Hans") {
//            print("zh-Hans") // 簡単な方
//        } else if val.contains("zh-Hant") {
//            print("zh-Hant") // 難しい方
//        } else {
//            print("上記以外")
//        }
//
//        return val
//    }

    // この処理で動く
    // languageCode 先頭
    // scriptCode Hant とか
    // 5言語の場合はそれぞれの言語を返す
    // それ以外の場合はjaを返す
    // 中国語の場合はscriptCodeを見て判定をかける



//    func changeLanguages() -> String {
//        let array = ["ja", "vi", "id", "en", "zh"]
//        let languageCode = locale.languageCode ?? ""
//        print("languageCode: \(languageCode)")
//        let scriptCode = locale.scriptCode
//        print("scriptCode: \(String(describing: scriptCode))")
//
//        if array.contains(languageCode) {
//            switch scriptCode {
//            case "Hans":
//                return "zh-cn"
//            case "Hant":
//                return "zh-tw"
//            default:
//                return languageCode
//            }
//        } else {
//            return "ja"
//        }
//    }
//}

}



// コンピューテットで良い
extension Locale {
    var acceptLnguage: String {
        switch scriptCode {
        case "Hans":
            return "zh-cn"
        case "Hant":
            return "zh-tw"
        default:
            return languageCode ?? ""
        }
    }
}

