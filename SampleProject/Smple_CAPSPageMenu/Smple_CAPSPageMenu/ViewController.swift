//
//  ViewController.swift
//  Smple_CAPSPageMenu
//
//  Created by 鳥嶋 晃次 on 2021/04/05.
//

import UIKit

class ViewController: UIViewController {
    
    var pageMenu: CAPSPageMenu?
    var targetIndex:Int = 0
    var deeplinkTabId:String = Constants.Character.Blank

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    func initControllers(_ controllers: [UIViewController], _ targetTabId: String) {
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(Constants.Color.Base.Background),
            .viewBackgroundColor(UIColor.white),
            .selectionIndicatorColor(UIColor.booklogBlue()),
            .bottomMenuHairlineColor(Constants.Color.Base.Background),
            .selectedMenuItemLabelColor(UIColor.booklogBlue()),
            .unselectedMenuItemLabelColor(UIColor.withTrendTabUnselectedColor()),
            .selectionIndicatorHeight(4.0),
            .menuItemFont(UIFont(name: "HiraKakuProN-W6", size: 12.0)!),
            .menuHeight(40.0),
            .menuMargin(16.0),
            .menuItemWidthBasedOnTitleTextWidth(true),
            .menuItemSeparatorRoundEdges(true),
            .centerMenuItems(false)]
        pageMenu = CAPSPageMenu(viewControllers: controllers, frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        self.view.addSubview(pageMenu!.view)
        self.addChild(pageMenu!)
        pageMenu?.delegate = self
        pageMenu?.didMove(toParent: self)
    }
}

extension ViewController: CAPSPageMenuDelegate {
    
}
