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
    static let changeThemeKey = "theme.change.notificationKey"

    @IBOutlet weak var desciptionTextView: UITextView!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var themeButton: UIBarButtonItem!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.desciptionTextView.text = school?.description
        self.phoneNumber.text = school?.phoneNumber
        self.email.text = school?.email
        self.website.text = school?.website
        NotificationCenter.default.addObserver(self, selector: #selector(changeThemePress), name: Notification.Name(rawValue: SchoolInformationController.changeThemeKey), object: nil)
    }
    
    @objc func changeThemePress() {
        var currentThemeColor: UIColor = .white
        
        switch traitCollection.userInterfaceStyle {
        case .dark:
            currentThemeColor = .blue
        case .light:
            currentThemeColor = .brown
        case .unspecified:
            currentThemeColor = .cyan
        @unknown default:
            currentThemeColor = .white
        }
        
        self.view.backgroundColor = currentThemeColor
    }
    
    @IBAction func pressTheme(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: SchoolInformationController.changeThemeKey), object: self)
    }
}
