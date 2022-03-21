//
//  SchoolInformationController.swift
//  NYC Schools
//
//  Created by Kingtak Wong on 4/20/18.
//  Copyright © 2018 KingtakWong. All rights reserved.
//

import UIKit
import MapKit

class SchoolInformationController: UIViewController {

    var school: School?

    @IBOutlet weak var desciptionTextView: UITextView!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var website: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.desciptionTextView.text = school?.description
        self.phoneNumber.text = school?.phoneNumber
        self.email.text = school?.email
        self.website.text = school?.website
    }
}
