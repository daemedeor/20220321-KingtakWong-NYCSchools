//
//  EndpointTests.swift
//  20220321-KingtakWong-NYCSchoolsTests
//
//  Created by Kingtak Justin Wong on 3/20/22.
//

import XCTest
@testable import _0220321_KingtakWong_NYCSchools

class EndpointTests: XCTestCase {

    var credentials: ProdInformation!
    var endpoint: NYCEndpoint!

    let savedAPIKey = "3SDF8DF9SDF0"
    let newURL = "https://www.google.com"
    
    override func setUpWithError() throws {
        credentials = ProdInformation(type: .testing(savedAPIKey, newURL))
        endpoint = NYCEndpoint(credential: credentials)
    }

    func testSvaedAPIKey() throws {
        let fullModelURL = endpoint.fullUrl?.absoluteString
        
        assert(fullModelURL?.contains(savedAPIKey) ?? false)
        assert(fullModelURL?.contains(newURL) ?? false)
    }

}
