//
//  SatViewModel.swift
//  20220321-KingtakWong-NYCSchools
//
//  Created by Kingtak Justin Wong on 3/19/22.
//

import Foundation

/**
 Sparse view model because could go a million ways to extend this with more complex data... for brievity, just returning the data simply, would prefer to find a way to have this be a mutating struct instead but would make error handling in this original project blow up
 */
class SatViewModel {
    
    // Not super testable but ....
    let satCall: SATEndpoint
    let school: School
    var sat: SAT?
    
    init(school: School, endpoint: SATEndpoint) {
        self.school = school
        self.satCall = endpoint
    }
    
    func grabInformation() async throws {
        satCall.schoolDBN = school.dbn

        // Using fancy await to allow for background processing 
        let listOfSat = try await self.satCall.downloadData()
        sat = listOfSat.first
    }
}
