//
//  SchoolCell.swift
//  NYC Schools
//
//  Created by Kingtak Wong on 4/20/18.
//  Copyright © 2018 KingtakWong. All rights reserved.
//

import UIKit

class SchoolCell: UITableViewCell {

    @IBOutlet weak var schoolName: UILabel!

    func configure(school: School) {
        self.schoolName.text = school.name
    }
}
