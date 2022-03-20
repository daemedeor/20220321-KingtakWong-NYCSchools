//
//  NYCEndpoint.swift
//  20220321-KingtakWong-NYCSchools
//
//  Created by Kingtak Justin Wong on 3/19/22.
//

import Foundation

/**
    This isn't how I'd usually model endpoints since this can be a bit difficult to follow the flow and use even more static definitions to encourage composition of different datatypes and endpoints that let me easily toggle through productions / qa / staging enviornments easily. However, this is used to show how important composition and inhertence still have their place together even though swift heavily encourages value types
 */
class NYCEndpoint: BaseNetworkClass, NetworkEndpointProtocol {

    typealias dataType = [School]
    
    //Endpoints are statically defined here to help define getting to the end
    var endPoint = "97mf-9njv.json"

    /**
     This is built locally to help facilitate differences in how building the URL can happen depending on the endpoint information. This could make this extremely complex but since its really just buliding it on a few properties, this can be set for now.... can potentionally be optimized later depending on use case
     */
    var fullUrl: URL? {
        let url = NSURLComponents(string: "\(self.credential.urlBase)\(self.endPoint)")

        url?.queryItems?.append(URLQueryItem(name: "$$app_token", value: self.credential.apitoken))
        
        return url?.url
    }

    override init(credential: Credential) {
        super.init(credential: credential)
    }
}
