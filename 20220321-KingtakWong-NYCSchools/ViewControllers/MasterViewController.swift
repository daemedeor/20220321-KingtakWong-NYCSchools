//
//  MasterViewController.swift
//  NYC Schools
//
//  Created by Kingtak Wong on 4/20/18.
//  Copyright © 2018 KingtakWong. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil

    // To avoid questions on initializing the master view....
    var schoolData: SchoolViewModel!
    let endpoint: SATEndpoint = SATEndpoint(credential: ProdInformation.shared)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        schoolData = SchoolViewModel(schools: [],
                                     endpoint: NYCEndpoint(credential: ProdInformation.shared))
        
        loadDataOnView()
    }

    
    func loadDataOnView() {
        Task(priority: .high) {
            do {
                try await schoolData.grabInformation()
               
                // Try to satisfy the detail view controller for a better experience
                if let split = splitViewController, let unrelatedSchool = schoolData.schools.first {
                    let controllers = split.viewControllers
                    detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
                    detailViewController?.viewModel = SatViewModel(school: unrelatedSchool,
                                                                   endpoint: endpoint)
                }
                
                self.tableView.reloadData()
            } catch {
                // Display an actual error here and display
                if let currentError = error as? NetworkError {
                    print("THere was a network error \(currentError)")
                }
            }
            
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If there was more time, separate these interactions with the segues to their different interactive models to try to mitigate so much clutter with the navigation methods
        if let detailDestination = (segue.destination as? UINavigationController)?.topViewController as? DetailViewController {

            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let school = schoolData.schools[indexPath.row]

            detailDestination.viewModel = SatViewModel(school: school,
                                                       endpoint: endpoint)

            detailDestination.navigationItem.title = school.name
            detailDestination.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            detailDestination.navigationItem.leftItemsSupplementBackButton = true
        }

        if segue.identifier == "schoolDetailInformation", let schoolDestination = segue.destination as? SchoolInformationController, let cell = sender as? UITableViewCell, let row = self.tableView.indexPath(for: cell)?.row {
            let school = schoolData.schools[row]
            schoolDestination.school = school
            schoolDestination.navigationItem.title = school.name
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolData.schools.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SchoolCell

        let currentSchool = schoolData.schools[indexPath.row]

        cell.configure(school: currentSchool)

        return cell
    }
}
