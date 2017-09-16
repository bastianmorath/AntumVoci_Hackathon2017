//
//  AntumVocilistTests.swift
//  AntumVocilistTests
//
//  Created by Bastian on 16.09.17.
//  Copyright © 2017 Bastian. All rights reserved.
//

import XCTest
@testable import AntumVocilist

class AntumVocilistTests: XCTestCase {
    
    func testVocilistInitializationSucceeds() {
        let noCards = Vocilist.init(name: "noCards", cards: [])
        XCTAssertNil(noCards)
    }
    
}
