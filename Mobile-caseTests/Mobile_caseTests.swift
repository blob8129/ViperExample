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
    
    func testSearchURL() {
        let key = "b549c4c96152e677eb90de4604ca61a2"
        let q = "coffee"
        let page = 30
        let url = URLs.searchFood.getURL()
        let constructedUrl = URLBuilder(url: url)
            .with(key: key)
            .with(searchTerm: q)
            .with(page: page)
            .url
        let testUrl = URL(string: "http://food2fork.com/api/search?key=b549c4c96152e677eb90de4604ca61a2&q=coffee&page=30")!
        XCTAssertEqual(constructedUrl, testUrl, "SearchURL is incorrect")
    }
    
    func testFoodyIdURL() {
        let id = "f5795c"
        let key = "b549c4c96152e677eb90de4604ca61a2"
        let url = URLs.getFoodById.getURL()
        let constructedUrl = URLBuilder(url: url)
            .with(key: key)
            .with(id: id)
            .url
        let testUrl = URL(string: "http://food2fork.com/api/get?key=b549c4c96152e677eb90de4604ca61a2&rId=f5795c")!
        XCTAssertEqual(constructedUrl, testUrl, "FoodyIdURL is incorrect")
    }
    
    
    func testNetworkManagerUnknownError() {
        let session = URLSessionMock(data: nil, response: nil, error: nil)
        let manager = NetworkManager(session: session) { result in
            switch result {
            case .sucess(_):
                XCTFail()
            case .error(let error):
                XCTAssertEqual(error, .unknown,
                          "Should be unknown error")
            }
        }
        manager.loadData(url: URL(string: "http://aaa.bcd")!)
    }
    
    func testNetworkManagerNonHttpError() {
        let data = Data()
        let response = URLResponse()
        let session = URLSessionMock(data: data, response: response, error: nil)
        let manager = NetworkManager(session: session) { result in
            switch result {
            case .sucess(_):
                XCTFail()
            case .error(let error):
                XCTAssertEqual(error, .nonHTTPResponse(response: response),
                          "Should be nonHTTPResponse error")
            }
        }
        manager.loadData(url: URL(string: "http://aaa.bcd")!)
    }
    
    func testNetworkManagerHttpRequestFailed() {
        let httpStatusCode = 400
        let data = Data()
        let response = HTTPURLResponse(url:  URL(string: "http://aaa.bcd")!,
                                       statusCode: httpStatusCode,
                                       httpVersion: nil,
                                       headerFields: nil)

        let session = URLSessionMock(data: data, response: response, error: nil)
        let manager = NetworkManager(session: session) { result in
            switch result {
            case .sucess(_):
                XCTFail()
            case .error(let error):
                XCTAssertEqual(error,
                               NetworkError.httpRequestFailed(response: response!, data: data),
                          "Should be httpRequestFailed error")
            }
        }
        manager.loadData(url: URL(string: "http://aaa.bcd")!)
    }
    
    func testNetworkManagerSucess() {
        let httpStatusCode = 200
        let data = Data()
        let response = HTTPURLResponse(url:  URL(string: "http://aaa.bcd")!,
                                       statusCode: httpStatusCode,
                                       httpVersion: nil,
                                       headerFields: nil)
        
        let session = URLSessionMock(data: data, response: response, error: nil)
        let manager = NetworkManager(session: session) { result in
            switch result {
            case .sucess(let data):
                XCTAssertEqual(data, data, "Should be success")
            case .error(_):
                XCTFail()
            }
        }
        manager.loadData(url: URL(string: "http://aaa.bcd")!)
    }
    
    func testRecipeSearchPresenterAssembled() {
        let presenter = RecipeSearchRouter().viewController?.presenter
        XCTAssert(presenter != nil,
                  "Presenter not assembled")
    }
}
