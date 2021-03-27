//
//  ListViewController.swift
//  Members
//
//  Created by Ufuk Canlı on 26.03.2021.
//

import UIKit

class ListViewController: UITableViewController {
    
    private lazy var sortButton = UCButton(backgroundColor: .customBlack, title: "Sort Members")
    private lazy var addButton = UCButton(backgroundColor: .systemGreen, title: "Add New Member")
    private lazy var buttonStackView = UIStackView(arrangedSubviews: [sortButton, addButton])
    
    private var viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.members.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
                
        configure()
    }
    
    @objc private func didTapSortButton() {
        sortButton.startAnimatingPressActions()
    }
    
    @objc private func didTapAddButton() {
        addButton.startAnimatingPressActions()
        viewModel.addNewMember()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MemberCell.reuseIdentifier, for: indexPath) as! MemberCell
        let member = viewModel.member(at: indexPath.row)
        cell.update(with: member)
        return cell
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    private func configure() {
        let padding: CGFloat = 30
        
        navigationItem.title = "Members"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(MemberCell.self, forCellReuseIdentifier: MemberCell.reuseIdentifier)
        
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
