//
//  ParentViewController.swift
//  Smple_CAPSPageMenu
//
//  Created by 鳥嶋 晃次 on 2021/04/05.
//

import UIKit

class ParentViewController: UIViewController {
    
    private var pageMenu: CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "menu"
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

// 同じVCでVCのタイトルだけ変更したい
extension ParentViewController {
    
    func setItem(pageIndex: Int) {
        var controllers: [UIViewController] = []
        let items: [Item] = [Item(title: "title1", color: .red),
                             Item(title: "title2", color: .blue),
                             Item(title: "title3", color: .gray),
                             Item(title: "title4", color: .green)]
        
        
        items.forEach { item in
            let controller = FirstViewController()
            controller.title = item.title
//            controller.collectionView.backgroundColor = item.color
            controllers.append(controller)
        }
        setup(controllers: controllers, pageIndex: pageIndex)
    }
    
    private func setup(controllers: [UIViewController], pageIndex: Int) {
        let paramerters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(.white),
            .viewBackgroundColor(.white),
            .selectionIndicatorColor(.black),
            .bottomMenuHairlineColor(.white),
            .selectedMenuItemLabelColor(.black),
            .unselectedMenuItemLabelColor(UIColor.withTrendTabUnselectedColor()),
            .selectionIndicatorHeight(2.0),
            .menuItemFont(UIFont(name: "HiraKakuProN-W6", size: 14.0)!),
            .menuHeight(40.0),
            .menuMargin(16),
            .menuItemWidthBasedOnTitleTextWidth(false), // タイトルのテキストに沿って可変するのをONにするかしないか
            //            .menuItemWidth(140),
            .menuItemSeparatorRoundEdges(true),
            .centerMenuItems(true)
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllers,
                                frame: CGRect(x: 0, y: 90, width: view.frame.width, height: view.frame.height),
                                pageMenuOptions: paramerters)
        pageMenu?.moveToPage(pageIndex)
        view.addSubview(pageMenu!.view)
        view.sendSubviewToBack(pageMenu!.view)
    }
}

//-------------------------------------------------------------------------------------//

struct Item {
    
    var title: String
    var color: UIColor
    
    init(title: String, color: UIColor) {
        self.title = title
        self.color = color
    }
}

//// 複数VCがある状態
//extension ParentViewController {
////    private func setTitle() {
////        var controllers: [UIViewController] = []
////        let feedArray: [ Dictionary<String, String?> ] =
////            [
////                [
////                    "link" : "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.dailynews.yahoo.co.jp/fc/computer/rss.xml&num=10" ,
////                    "title" : "コンピュータ"
////                ],
////                [
////                    "link" : "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.dailynews.yahoo.co.jp/fc/world/rss.xml&num=10" ,
////                    "title" : "海外"
////                ],
////                [
////                    "link" : "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.dailynews.yahoo.co.jp/fc/local/rss.xml&num=10" ,
////                    "title" : "地域"
////                ]
////            ]
////
////        // for 文の中でインスタンスかすると、インスタンス化もループするので複製できる
////        for feed in feedArray {
////            let firstController = FirstViewController()
////            firstController.title = feed["title"]!
////            controllers.append(firstController)
////        }
////        setup(controllers: controllers, pageIndex: 0)
////    }
////    let secondVC = SecondViewContoroller()
////    let thirdVC = ThirdViewController()
//
//
////    private func setup() {
////        // - は半角スペースが何個あるか
////        //  上と下は同じに見えるが違う
////        // firstはこれでセンターになる
////        // secondはセンターにならない
////        // secondをセンターにするには、------漢字------ と書かなければならない
////        let space12 = String(repeating: " ", count: 12) // スペースを12とる　表現は左右均等になるので、　６sp title 6sp になる
////        let spaseHyphen = String(repeating: "-", count: 12)
////        let space4 = String(repeating: " ", count: 4)
////        firstVC.title = "漢字" + space12
////        secondVC.title = "漢字" + spaseHyphen
////        thirdVC.title = "ここは任意のタイトルを入れる" + space4
////
////        let controllers: [UIViewController] = [firstVC, secondVC, thirdVC]
////
////        let paramerters: [CAPSPageMenuOption] = [
////            .scrollMenuBackgroundColor(Constants.Color.Base.Background),
////            .viewBackgroundColor(UIColor.white),
////            .selectionIndicatorColor(UIColor.booklogBlue()),
////            .bottomMenuHairlineColor(Constants.Color.Base.Background),
////            .selectedMenuItemLabelColor(UIColor.booklogBlue()),
////            .unselectedMenuItemLabelColor(UIColor.withTrendTabUnselectedColor()),
////            .selectionIndicatorHeight(4.0),
////            .menuItemFont(UIFont(name: "HiraKakuProN-W6", size: 14.0)!),
////            .menuHeight(40.0),
////            .menuMargin(16),
////            .menuItemWidthBasedOnTitleTextWidth(true), // タイトルのテキストに沿って可変するのをONにするかしないか
//////            .menuItemWidth(140),
////            .menuItemSeparatorRoundEdges(true),
////            .centerMenuItems(true)
////        ]
////
////        pageMenu = CAPSPageMenu(viewControllers: controllers,
////                                frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height),
////                                pageMenuOptions: paramerters)
////
////        view.addSubview(pageMenu!.view)
////        view.sendSubviewToBack(pageMenu!.view)
////    }
//}
