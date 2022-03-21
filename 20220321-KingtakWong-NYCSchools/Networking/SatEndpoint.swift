//
//  SatEndpoint.swift
//  20220321-KingtakWong-NYCSchools
//
//  Created by Kingtak Justin Wong on 3/19/22.
//

import Foundation


/**
 Just the standard datamodel should look like without all the information that peppers NYCEndpoint, feel free to head on over to the other class to see my full notes on the setup of this :) 
 */
class SATEndpoint: BaseNetworkClass, NetworkEndpointProtocol {
    typealias dataType = [SAT]
    var endPoint = "734v-jeq5.json"
    var schoolDBN: String?

    var fullUrl: URL? {
        let url = NSURLComponents(string: "\(self.credential.urlBase)\(self.endPoint)")
        url?.queryItems = []
        url?.queryItems?.append(URLQueryItem(name: "$$app_token", value: self.credential.apitoken))
        
        if let schoolDBN = self.schoolDBN {
            url?.queryItems?.append(URLQueryItem(name: "dbn", value: schoolDBN))
        }

        return url?.url
    }
    
    override init(credential: Credential) {
        super.init(credential: credential)
    }
}
