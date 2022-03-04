//
//  GahezDemoTests.swift
//  GahezDemoTests
//
//  Created by Tariq Maged on 28/02/2022.
//

import XCTest
import Combine
@testable import GahezDemo

class GahezDemoTests: XCTestCase {

    private var resturantViewModel: ResturantViewModel!
    private var mockResturantService: MockResturantServices!
    private var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockResturantService = MockResturantServices()
        resturantViewModel = ResturantViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        mockResturantService = nil
        resturantViewModel = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func test_shouldCallService() {
        // when
        resturantViewModel.fetchResturants()

        // then
        XCTAssertEqual(mockResturantService.getCallsCount, 1)
       
    }
    
    func testGettingJSON() {
        let ex = expectation(description: "Expecting a JSON data not nil")
    
        ResturantServices.instance.testFetchResturants(){ (success, resturant) in
            XCTAssert(success)
            XCTAssertNotNil(resturant)
            ex.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
          if let error = error {
            XCTFail("error: \(error)")
          }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
