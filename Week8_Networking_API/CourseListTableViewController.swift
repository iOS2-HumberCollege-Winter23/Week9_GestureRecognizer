//
//  CourseListTableViewController.swift
//  Week8_Networking_API
//
//  Created by Rania Arbash on 2021-03-26.
//

import UIKit

class CourseListTableViewController: UITableViewController {
    var coursePackageFromAPI = (UIApplication.shared.delegate as! AppDelegate).coursePackageFromAPI

    var networkingManager = NetworkingManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        networkingManager.fetchDataFromAPI { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let coursePackage):
                    self.coursePackageFromAPI = coursePackage
                    self.title = self.coursePackageFromAPI.student
                    (UIApplication.shared.delegate as! AppDelegate).coursePackageFromAPI = coursePackage
                    
                    self.tableView.reloadData()
                
                case .failure(let error):
                   self.title = "No Student Data Available!!"
                }
        }
    }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return coursePackageFromAPI.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        if let data = coursePackageFromAPI.data{
        
        cell.textLabel?.text = data[indexPath.row].courseName
        cell.detailTextLabel?.text = data[indexPath.row].courseCode
        }
        return cell
    }



}
