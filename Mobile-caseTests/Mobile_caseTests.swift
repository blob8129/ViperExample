//
//  Mobile_caseTests.swift
//  Mobile-caseTests
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import XCTest
@testable import Mobile_case

class Mobile_caseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRecipeSearchVievControllerIsInstantiated() {
        let vc = RecipeSearchRouter().viewController
        XCTAssert(vc != nil,
                  "View controller is not instantiated form storyboard ")
    }
    
    func testRecipeSearchPresenterAssembled() {
        let presenter = RecipeSearchRouter().viewController?.presenter
        XCTAssert(presenter != nil,
                  "Presenter not assembled")
    }
    
}
