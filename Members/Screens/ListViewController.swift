//
//  ListViewController.swift
//  Members
//
//  Created by Ufuk Canlı on 26.03.2021.
//

import UIKit

class ListViewController: UITableViewController {
    
    private var company = Bundle.main.decode(Company.self, from: "hipo.json", keyDecodingStrategy: .convertFromSnakeCase)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return company.members.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "MemberCell")
        cell.textLabel?.text = String(company.members[indexPath.row].name)
        return cell
    }
    
    private func configure() {
        navigationItem.title = "Members"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.tableFooterView = UIView(frame: .zero)
    }
}
