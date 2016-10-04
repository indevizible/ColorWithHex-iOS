//
//  ColorWithHexTests.swift
//  ColorWithHexTests
//
//  Created by GabrielMassana on 23/03/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

import XCTest

@testable import ColorWithHex

class ColorWithHexTests: XCTestCase {
    
    //MARK: - Accessors
    
    // Success Path
    var shortHexHash: String?
    var shortHex: String?
    var hex: String?
    var hexAlpha: String?
    var hexHash: String?
    var hexHashAlpha: String?
    var hashLastCharacter: String?

    // Nil Path
    var noHexValue: String?
    var emptyString: String?
    var lengthFour: String?
    var lengthFive: String?
    var lengthSeven: String?

    // Result Path
    var red: String?
    var green: String?
    var blue: String?
    
    override func setUp() {
        
        super.setUp()
        
        // Success Path
        shortHexHash = "#f80"
        shortHex  = "f80"
        hex  = "ff8800"
        hexAlpha  = "ff880080"
        hexHash  = "#20aa45"
        hexHashAlpha  = "#20aa4580"
        hashLastCharacter = "123456#"

        // Nil Path
        noHexValue = "xxxxxx"
        emptyString = ""
        lengthFour = "1234"
        lengthFive = "12345"
        lengthSeven = "1234567"
        
        // Result Path
        red = "ff0000"
        green = "00ff00"
        blue = "0000ff"
    }
    
    override func tearDown() {
        
        // Success Path
        shortHexHash = nil
        shortHex  = nil
        hex  = nil
        hexAlpha  = nil
        hexHash  = nil
        hexHashAlpha  = nil
        hashLastCharacter = nil

        // Nil Path
        noHexValue = nil
        emptyString = nil
        lengthFour = nil
        lengthFive = nil
        lengthSeven = nil
        
        // Result Path
        red = nil
        green = nil
        blue = nil
        
        super.tearDown()
    }
    
    //MARK: - ValidString
    
    func test_colorWithHex_newObjectReturned_shortHexHash() {
        
        let shortHexHashColor = UIColor.color(with: shortHexHash!)
        
        XCTAssertNotNil(shortHexHashColor, "A valid Color object wasn't created");
    }
    
    func test_colorWithHex_newObjectReturned_shortHex() {
        
        let shortHexColor = UIColor.color(with: shortHex!)
        
        XCTAssertNotNil(shortHexColor, "A valid Color object wasn't created");
    }
    
    func test_colorWithHex_newObjectReturned_hex() {
        
        let hexColor = UIColor.color(with: hex!)
        
        XCTAssertNotNil(hexColor, "A valid Color object wasn't created");
    }
    
    func test_colorWithHex_newObjectReturned_hexAlpha() {
        
        let hexAlphaColor = UIColor.color(with: hexAlpha!)
        
        XCTAssertNotNil(hexAlphaColor, "A valid Color object wasn't created");
    }
    
    func test_colorWithHex_newObjectReturned_hexHash() {
        
        let hexHashColor = UIColor.color(with: hexHash!)
        
        XCTAssertNotNil(hexHashColor, "A valid Color object wasn't created");
    }
    
    func test_colorWithHex_newObjectReturned_hexHashAlpha() {
        
        let hexHashAlphaColor = UIColor.color(with: hexHashAlpha!)
        
        XCTAssertNotNil(hexHashAlphaColor, "A valid Color object wasn't created");
    }
    
    func test_colorWithHex_newObjectReturned_hashLastCharacter() {
        
        let hashLastCharacterColor = UIColor.color(with: hashLastCharacter!)
        
        XCTAssertNotNil(hashLastCharacterColor, "A valid Color object was created");
    }
    
    //MARK: - NotValidString

    func test_colorWithHex_newObjectReturned_noHexValue() {
        
        let noHexValueColor = UIColor.color(with: noHexValue!)
        
        XCTAssertNil(noHexValueColor, "A valid Color object was created");
    }
    
    func test_colorWithHex_newObjectReturned_emptyString() {
        
        let emptyStringColor = UIColor.color(with: emptyString!)
        
        XCTAssertNil(emptyStringColor, "A valid Color object was created");
    }
    
    func test_colorWithHex_newObjectReturned_lengthFour() {
        
        let lengthFourColor = UIColor.color(with: lengthFour!)
        
        XCTAssertNil(lengthFourColor, "A valid Color object was created");
    }
    
    func test_colorWithHex_newObjectReturned_lengthFive() {
        
        let lengthFiveColor = UIColor.color(with: lengthFive!)
        
        XCTAssertNil(lengthFiveColor, "A valid Color object was created");
    }
    
    func test_colorWithHex_newObjectReturned_lengthSeven() {
        
        let lengthSevenColor = UIColor.color(with: lengthSeven!)
        
        XCTAssertNil(lengthSevenColor, "A valid Color object was created");
    }
    
    //MARK: - SpecificColor
    
    func test_colorWithHex_red() {
        
        let redColor = UIColor.color(with: red!)
        
        XCTAssertEqual(redColor, UIColor.red, "A red Color object wasn't created");
    }
    
    func test_colorWithHex_green() {
        
        let greenColor = UIColor.color(with: green!)
        
        XCTAssertEqual(greenColor, UIColor.green, "A green Color object wasn't created");
    }
    
    func test_colorWithHex_blue() {
        
        let blueColor = UIColor.color(with: blue!)
        
        XCTAssertEqual(blueColor, UIColor.blue, "A blue Color object wasn't created");
    }
}
