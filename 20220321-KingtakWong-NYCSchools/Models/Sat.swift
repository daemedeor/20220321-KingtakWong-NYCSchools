//
//  Sat.swift
//  20220321-KingtakWong-NYCSchools
//
//  Created by Kingtak Justin Wong on 3/19/22.
//

import Foundation

struct SAT: Codable {
    var dbn: String?
    var schoolName: String?
    var numSATPeople: String?
    var readingAvgScore: String?
    var mathAvgScore: String?
    var writingAvgScore: String?

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numSATPeople = "num_of_sat_test_takers"
        case readingAvgScore = "sat_critical_reading_avg_score"
        case mathAvgScore = "sat_math_avg_score"
        case writingAvgScore = "sat_writing_avg_score"
    }
}
