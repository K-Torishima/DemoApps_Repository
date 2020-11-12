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
    let locale = Locale.preferredLanguages

    override func viewDidLoad() {
        super.viewDidLoad()
//       取得したLangを表示
        print("locale: \(locale)")
//        print("現在のlocale言語: \(locale[0])")
//        print(locale[0])
         let aaaa = changeLanguages()
         print("return val \(aaaa)")


    }


//    言語比較
//    端末の言語を比較しprintを指定
//    printを値としてパラメータに指定させる
    func changeLanguages() -> String {
        let val = locale[0]
        
        if val.contains("ja") {
            print("ja")
        } else if val.contains("en") {
            print("en")
        } else if val.contains("vi") {
            print("vi")
        } else if val.contains("id") {
            print("id")
        } else if val.contains("zh-Hans") {
            print("zh-Hans") // 簡単な方
        } else if val.contains("zh-Hant") {
            print("zh-Hant") // 難しい方
        } else {
            print("上記以外")
        }

        return val
    }
}

