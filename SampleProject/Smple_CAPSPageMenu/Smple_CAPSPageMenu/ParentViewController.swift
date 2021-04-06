//
//  ParentViewController.swift
//  Smple_CAPSPageMenu
//
//  Created by 鳥嶋 晃次 on 2021/04/05.
//

import UIKit

class ParentViewController: UIViewController {
    
    var pageMenu: CAPSPageMenu?
    let firstVC = FirstViewController()
    let secondVC = SecondViewContoroller()
    let thirdVC = ThirdViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        // - は半角スペースが何個あるか
        //  上と下は同じに見えるが違う
        // firstはこれでセンターになる
        // secondはセンターにならない
        // secondをセンターにするには、------漢字------ と書かなければならない
        firstVC.title = "漢字            "
        secondVC.title = "漢字------------"
        thirdVC.title = "--ここは任意のタイトルを入れる--"
        
        let controllers: [UIViewController] = [firstVC, secondVC, thirdVC]
        
        let paramerters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(Constants.Color.Base.Background),
            .viewBackgroundColor(UIColor.white),
            .selectionIndicatorColor(UIColor.booklogBlue()),
            .bottomMenuHairlineColor(Constants.Color.Base.Background),
            .selectedMenuItemLabelColor(UIColor.booklogBlue()),
            .unselectedMenuItemLabelColor(UIColor.withTrendTabUnselectedColor()),
            .selectionIndicatorHeight(4.0),
            .menuItemFont(UIFont(name: "HiraKakuProN-W6", size: 14.0)!),
            .menuHeight(40.0),
            .menuMargin(16),
            .menuItemWidthBasedOnTitleTextWidth(true), // タイトルのテキストに沿って可変するのをONにするかしないか
//            .menuItemWidth(140),
            .menuItemSeparatorRoundEdges(true),
            .centerMenuItems(true)
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllers,
                                frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height),
                                pageMenuOptions: paramerters)
        
        view.addSubview(pageMenu!.view)
        view.sendSubviewToBack(pageMenu!.view)
    }
}
