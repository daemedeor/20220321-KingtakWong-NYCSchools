//
//  CredentialTests.swift
//  CredentialTests
//
//  Created by Kingtak Justin Wong on 3/14/22.
//

import XCTest
@testable import _0220321_KingtakWong_NYCSchools

class CredentialTests: XCTestCase {

    var credentials: ProdInformation!
    let savedAPIKey = "3SDF8DF9SDF0"
    let newURL = "https://www.google.com"

    override func setUpWithError() throws {
        credentials = ProdInformation(type: .testing(savedAPIKey, newURL))
    }

    func testSvaedAPIKey() throws {
        assert(credentials.urlBase == newURL)
        assert(credentials.apitoken == savedAPIKey)
    }

}
