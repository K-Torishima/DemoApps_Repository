//
//  Color.swift
//  Smple_CAPSPageMenu
//
//  Created by 鳥嶋 晃次 on 2021/04/05.
//

import UIKit

extension UIColor {

    static func shelfBookCreatedAtColor() -> UIColor {
        return UIColor(red: 158/255, green: 158/255, blue: 158/255, alpha: 1)
    }

    static func shelfSectionBackgroundColor() -> UIColor {
        return UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
    }

    func favoriteOffWithZeroColor() -> UIColor {
        return UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
    }

    func favoriteOffTextColor() -> UIColor {
        return UIColor(red: 204/255, green: 196/255, blue: 191/255, alpha: 1)
    }

    func favoriteOnTextColor() -> UIColor {
        return UIColor(red: 244/255, green: 127/255, blue: 141/255, alpha: 1)
    }

    static func itemSnackBarBackgroundColor() -> UIColor {
        return UIColor(red: 211/255, green: 229/255, blue: 232/255, alpha: 1)
    }

    static func emptyReviewCommentBackgroundColor() -> UIColor {
        return UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
    }

    static func archiveReviewNetabareTextColor() -> UIColor {
        return UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 0.05)
    }
    static func archiveReviewTextColor() -> UIColor {
        return UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
    }

    static func booklogBlack() -> UIColor {
        return UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
    }

    static func booklogRed() -> UIColor {
        return UIColor(red: 218/255, green: 71/255, blue: 64/255, alpha: 1)
    }

    static func booklogBlue() -> UIColor {
        return UIColor(red: 78/255, green: 166/255, blue: 204/255, alpha: 1)
    }

    static func booklogGreen() -> UIColor {
        return UIColor(red: 137/255, green: 198/255, blue: 0/255, alpha: 1)
    }

    static func loginToolbarColor() -> UIColor {
        return UIColor(red: 82/255, green: 184/255, blue: 219/255, alpha: 1)
    }

    static func transparentColor() -> UIColor {
        return  UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8)
    }

    static func withDrawalOnColor() -> UIColor {
        return  UIColor(red: 218/255, green: 71/255, blue: 64/255, alpha: 1)

    }

    static func withDrawalOffColor() -> UIColor {
        return  UIColor(red: 158/255, green: 158/255, blue: 158/255, alpha: 1)
    }

    static func shelfSeparataorColor() -> UIColor {
        return  UIColor(red: 221/255, green: 218/255, blue: 220/255, alpha: 1)
    }
    static func lisetSeparatorColor() -> UIColor {
        return  UIColor(red: 200/255, green: 199/255, blue: 204/255, alpha: 1)
    }

    static func imageViewerBackgroundColor() -> UIColor {
        return UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 0)
    }

    static func withTrendTabUnselectedColor() -> UIColor {
        return UIColor(red: 96/255, green: 125/255, blue: 139/255, alpha: 1)
    }

    static func selectedSegmentBackgroundColor() -> UIColor {
        return UIColor(red: 229/255, green: 241/255, blue: 245/255, alpha: 1)
    }

    static func booklogLightGray() -> UIColor {
        return UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
    }

    static func rankColor(rank: Int) -> UIColor {
        let rankColors:[UIColor] = [
            UIColor(red: 231/255, green: 180/255, blue: 64/255, alpha: 1),
            UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 1),
            UIColor(red: 210/255, green: 135/255, blue: 90/255, alpha: 1)
        ]

        if case 1...3 = rank {
            return rankColors[rank - 1]
        }

        return UIColor(red: 78/255, green: 166/255, blue: 204/255, alpha: 1)
    }

    func darkenedColor() -> UIColor {
        let color = CIColor(cgColor: self.cgColor)
        return UIColor(red: max(color.red - 10/255, 0.0),
                       green: max(color.green - 10/255, 0.0),
                       blue: max(color.blue - 10/255, 0.0),
                       alpha: color.alpha)
    }

    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0

        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

struct  Constants {
    struct Color {
        struct Base {
            static let Background: UIColor = UIColor(red: 245/255, green: 243/255, blue: 240/255, alpha: 1)
            static let LoginBackground: UIColor = UIColor(red: 137/255, green: 198/255, blue: 0/255, alpha: 1)
            static let Line: UIColor = UIColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            static let Separator: UIColor = UIColor(red: 200/255, green: 199/255, blue: 204/255, alpha: 1)
            static let Black: UIColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
            static let Gray: UIColor = UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 1)
            static let EmptyGray: UIColor = UIColor(red: 204/255, green: 196/255, blue: 191/255, alpha: 1)
            static let EmptyStrongGray: UIColor = UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 1)
            static let ProfileBackground: UIColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            static let SectionBackground: UIColor = UIColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
            static let DarkenedBackground: UIColor = UIColor(red: 245*0.6/255, green: 243*0.6/255, blue: 240*0.6/255, alpha: 1)
            static let tableViewBackground: UIColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        }
    }
}

extension Constants {
    struct Character {
        static let parcent: String = "%"
        static let Blank: String = ""
        static let Space: String = " "
        static let Full_Width_Space: String = "　"
        static let Dot: String = "."
        static let Slash: String = "/"
        static let Hyphen: String = "-"
        static let Left_Round_Braket: String = "("
        static let Right_Round_Braket: String = ")"
        static let Left_Square_Braket: String = "["
        static let Right_Square_Braket: String = "]"
        static let Left_Corner_Braket: String = "『"
        static let Right_Corner_Braket: String = "』"
        static let Left_Bracket = "\""
        static let Right_Bracket = "\""
        static let New_Line: String = "\n"
        static let Prefix:String = "#"
        static let OmitSuffix = "..."
        static let VerticalSeparator = " | "
        static let Https = "https:"
    }
}
