//
//  SchoolViewModel.swift
//  20220321-KingtakWong-NYCSchools
//
//  Created by Kingtak Justin Wong on 3/19/22.
//

import Foundation

class SchoolViewModel {
    var schools: [School]
    let schoolCalls: NYCEndpoint
    
    init(schools: [School], endpoint: NYCEndpoint) {
        self.schools = schools
        self.schoolCalls = endpoint
    }
    
    func grabInformation() async throws {
        do {
            self.schools = try await schoolCalls.downloadData()
        }
    }
}
