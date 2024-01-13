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
        
    }
    
    enum Images {
        
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
    
    enum Methods {
        
        enum GetRequests {
            static let imagesSearch = "images/search"
        }
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
