//
//  ProdInformation.swift
//  20220321-KingtakWong-NYCSchools
//
//  Created by Kingtak Justin Wong on 3/19/22.
//

import Foundation


// Modeled to be a singleton to speed this exercise up a little
struct ProdInformation: Credential {
    let apitoken: String
    let urlBase: String

    // Modeled to have a singleton ... just to encourage ease of use in the main app... :shrug:
    static let shared: ProdInformation = ProdInformation(type: .production)

    /**
     Could even save the type to the object to define other more complex properties.
     However, since this really involves the api tokens and url base, just to show its "technically doable' even though they are the same values for now
     */
    init(type: Endpoint = .production) {
        
        // Ideally this is unique to separate the different environments QA/Prod/etc. includes a tseting one to test this struct further if there are more unqiue properties but since there's no concept of separation, just showing how this can further future testing of this struct for different ways this information can impact how stable this is
        switch type {
        case .production:
            self.apitoken = "JDTrbaYwmJLf8oDh1HBmCI8Ee"
            self.urlBase = "https://data.cityofnewyork.us/resource/"
        // Making a testing case like this to appropriately test this struct in unit tests
        case let .testing(apitoken, urlBase):
            self.apitoken = apitoken
            self.urlBase = urlBase
        @unknown default:
            self.apitoken = "JDTrbaYwmJLf8oDh1HBmCI8Ee"
            self.urlBase = "https://data.cityofnewyork.us/resource/"
        }
    }
}
