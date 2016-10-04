//
//  UIColor+Hex.swift
//  ColorWithHex
//
//  Created by GabrielMassana on 18/03/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//
//  Credit: https://www.hackingwithswift.com/example-code/uicolor/how-to-convert-a-hex-color-to-a-uicolor
// 

import UIKit

public extension UIColor {
    
    //MARK: - Public method
    
    /**
     Creates UIColor object based on given hexadecimal color value (rrggbb), (#rrggbb), (rrggbbaa), (#rrggbbaa), (rgb) or (#rgb).
     
     - parameter hex: String with the hex information. With or without hash symbol.
     
     - returns: A UIColor from the given String.
    */
    @objc(cwh_colorWithHex:)
    public class func color(with hex: String) -> UIColor? {
        
        var color:UIColor? = nil
        
        let noHash = hex.replacingOccurrences(of: "#", with: "")
        
        let start = noHash.startIndex
        let hexColor = noHash.substring(from: start)
        
        if (hexColor.characters.count == 8) {
            
            color = colorWithHexAlpha(hexColor)
        }
        else if (hexColor.characters.count == 6)
        {
           color = colorWithHexSixCharacters(hexColor)
        }
        else if (hexColor.characters.count == 3)
        {
            color = colorWithHexThreeCharacters(hexColor)
        }
        
        return color
    }
    
    //MARK: - Private methods
    
    /**
     Creates UIColor object based on given hexadecimal color value with alpha (rrggbbaa).
     
     - parameter hexColor: String with the hex information.
     
     - returns: A UIColor from the given String.
     */
    fileprivate class func colorWithHexAlpha(_ hexColor: String) -> UIColor? {
        
        let red: CGFloat
        let green: CGFloat
        let blue: CGFloat
        let alpha: CGFloat
        
        var color:UIColor? = nil
        
        if hexColor.characters.count == 8 {
            
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                
                red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                alpha = CGFloat(hexNumber & 0x000000ff) / 255
                
                color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
            }
        }
        
        return color
    }
    
    /**
     Creates UIColor object based on given hexadecimal color value without alpha (rrggbb) by adding alpha 1.0 to the given hex color.
     
     - parameter hexColor: String with the hex information.
     
     - returns: A UIColor from the given String.
     */
    fileprivate class func colorWithHexSixCharacters(_ hexColor: String) -> UIColor? {
        
        return colorWithHexAlpha(String(format: "%@ff", hexColor))
    }
    
    /**
     Creates UIColor object based on given short hexadecimal color value without alpha (rgb). Alpha will be 1.0.
     
     - parameter hexColor: String with the hex information.
     
     - returns: A UIColor from the given String.
     */
    fileprivate class func colorWithHexThreeCharacters(_ hexColor: String) -> UIColor? {
        
        let redRange: Range = (hexColor.characters.index(hexColor.startIndex, offsetBy: 0) ..< hexColor.characters.index(hexColor.startIndex, offsetBy: 1))
        let redString: String = String(format: "%@%@", hexColor.substring(with: redRange), hexColor.substring(with: redRange))
        
        let greenRange: Range = (hexColor.characters.index(hexColor.startIndex, offsetBy: 1) ..< hexColor.characters.index(hexColor.startIndex, offsetBy: 2))
        let greenString: String = String(format: "%@%@", hexColor.substring(with: greenRange), hexColor.substring(with: greenRange))
        
        let blueRange: Range = (hexColor.characters.index(hexColor.startIndex, offsetBy: 2) ..< hexColor.characters.index(hexColor.startIndex, offsetBy: 3))
        let blueString: String = String(format: "%@%@", hexColor.substring(with: blueRange), hexColor.substring(with: blueRange))
        
        let hex: String = String(format: "%@%@%@", redString, greenString, blueString)
        
        return colorWithHexSixCharacters(hex)
    }
}
