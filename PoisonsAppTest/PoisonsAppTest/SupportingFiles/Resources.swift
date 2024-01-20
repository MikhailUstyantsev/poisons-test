//
//  Resources.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 13.01.2024.
//

import UIKit

enum R {
    
    enum Colors {
        static let black = UIColor(hexString: "#333333")
        static let green = UIColor(hexString: "#6FB54B")
    }
    
    enum Strings {
        static let error = "Ошибка"
        static let loading = "Загрузка..."
        static let waitABit = "Подождите немного"
        static let done = "Готово"
        static let whereToBuyTitle = "ГДЕ КУПИТЬ"
        static let searchTextFieldPlaceholder = "Поиск препарата"
        static let shansBaseURL = "http://shans.d2.i-partner.ru"
    }
    
    enum Images {
        static let pin = UIImage(named: "pin")
        static let dislike = UIImage(named: "star")
        static let like = UIImage(named: "starFilled")
        static let searchImage = UIImage(systemName: "magnifyingglass")
        static let backArrow = UIImage(systemName: "chevron.backward")
    }
    
    enum Headers {
        
        enum Key {
            static let contentType = "Content-Type"
        }
        
        enum Value {
            static let applicationJson = "application/json"
        }
    }
    
    enum Paths {
        static let poisonsList = "index"
    }
    
    enum Fonts {
        
        static func sanFranciscoDisplayLight(with size: CGFloat) -> UIFont {
            UIFont(name: "SFProDisplay-Light", size: size) ?? UIFont()
        }
        
        static func sanFranciscoDisplayRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "SFProDisplay-Regular", size: size) ?? UIFont()
        }
        
        static func sanFranciscoDisplaySemibold(with size: CGFloat) -> UIFont {
            UIFont(name: "SFProDisplay-Semibold", size: size) ?? UIFont()
        }
    }
}
