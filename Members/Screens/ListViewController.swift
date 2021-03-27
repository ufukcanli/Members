//
//  ListViewController.swift
//  Members
//
//  Created by Ufuk Canlı on 26.03.2021.
//

import UIKit

class ListViewController: UITableViewController {
    
    private lazy var sortButton = UCButton(backgroundColor: .black, title: "Sort Members")
    private lazy var addButton = UCButton(backgroundColor: .systemGreen, title: "Add New Member")
    private lazy var buttonStackView = UIStackView(arrangedSubviews: [sortButton, addButton])
    
    private var company = Bundle.main.decode(Company.self, from: "hipo.json", keyDecodingStrategy: .convertFromSnakeCase)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    @objc private func didTapSortButton() {
        sortButton.startAnimatingPressActions()
    }
    
    @objc private func didTapAddButton() {
        addButton.startAnimatingPressActions()
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
        let padding: CGFloat = 30
        
        navigationItem.title = "Members"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.tableFooterView = UIView(frame: .zero)
        
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        sortButton.addTarget(self, action: #selector(didTapSortButton), for: .touchUpInside)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.alignment = .center
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 15
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }
}
