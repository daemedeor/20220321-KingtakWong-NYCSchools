//
//  DetailViewController.swift
//  NYC Schools
//
//  Created by Kingtak Wong on 4/20/18.
//  Copyright © 2018 KingtakWong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var readingScore: UILabel!
    @IBOutlet weak var writingScore: UILabel!
    @IBOutlet weak var mathScore: UILabel!

    // To save time when trying to save the state if this is set but will be always be setting it from the screen before
    var viewModel: SatViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNewInformation()
    }
    
    func loadNewInformation() {
        Task(priority: .high) {
            do {
                // May want to decouple this from the viewcontroller and is updated elsewhere
                // as a separate cell
                try await viewModel?.grabInformation()
                self.navigationItem.title = self.viewModel.school.name ?? ""
                self.writingScore.text = self.viewModel.sat?.writingAvgScore ?? ""
                self.readingScore.text = self.viewModel.sat?.readingAvgScore ?? ""
                self.mathScore?.text = self.viewModel.sat?.mathAvgScore ?? ""
            } catch {
                // In an ideal world, this should show an error based on the caught network error
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

