//
//  School.swift
//  20220321-KingtakWong-NYCSchools
//
//  Created by Kingtak Justin Wong on 3/19/22.
//

import Foundation

struct School: Codable {
    var name: String?
    var dbn: String?
    var campusName: String?
    var description: String?
    var apCourses: String?
    var neighborhood: String?
    var location: String?
    var phoneNumber: String?
    var email: String?
    var website: String?
    var startTime: String?
    var endTime: String?
    var latitude: String?
    var longitude: String?

    enum CodingKeys: String, CodingKey {
        case name = "school_name"
        case campusName = "campus_name"
        case apCourses = "advancedplacement_courses"
        case phoneNumber = "phone_number"
        case email = "school_email"
        case startTime = "start_time"
        case endTime = "end_time"

        case dbn
        case description
        case neighborhood
        case location
        case website
        case latitude
        case longitude
    }
}


