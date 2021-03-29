//
//  ListViewController.swift
//  Members
//
//  Created by Ufuk Canlı on 26.03.2021.
//

import SwiftUI

class ListViewController: UITableViewController {
    
    private lazy var sortButton = UCButton(backgroundColor: .customBlack, title: "Sort Members")
    private lazy var addButton = UCButton(backgroundColor: .systemGreen, title: "Add New Member")
    private lazy var buttonStackView = UIStackView(arrangedSubviews: [sortButton, addButton])
    private let emptyStateLabel = EmptyStateLabel()
    
    private var viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        bind()
        configure()
    }
    
    private func bind() {
        viewModel.members.bind { [weak self] _ in
            DispatchQueue.main.async { self?.tableView.reloadData() }
        }
        viewModel.error.bind { [weak self] error in
            if let error = error {
                self?.presentAlertOnMainThread(title: "Something went wrong 🤪",
                                               message: error.rawValue,
                                               buttonTitle: "Ok")
            }
        }
    }
    
    @objc private func didTapSortButton() {
        sortButton.startAnimatingPressActions()
        viewModel.sortMembers()
    }
    
    @objc private func didTapAddButton() {
        addButton.startAnimatingPressActions()
        viewModel.addNewMember()
    }
    
    @objc private func didTapRestoreButton() {
        viewModel.restore()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        emptyStateLabel.isHidden = viewModel.emptyStateLabelIsHidden
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
        let member = viewModel.member(at: indexPath.row)
        let hostingController = UIHostingController(rootView: DetailsView(member: member))
        navigationController?.pushViewController(hostingController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] action, _, completion in
            self?.viewModel.removeMember(at: indexPath.row)
            completion(true)
        }
        deleteAction.backgroundColor = .customRed
        deleteAction.image = UIImage(systemName: "trash")
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfiguration
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    private func configure() {
        let padding: CGFloat = 30
        
        navigationItem.title = "Members"
        navigationController?.navigationBar.prefersLargeTitles = true
        let restoreImage = UIImage(systemName: "wand.and.stars")
        let restoreButton = UIBarButtonItem(image: restoreImage, style: .plain, target: self, action: #selector(didTapRestoreButton))
        restoreButton.tintColor = .systemGreen
        navigationItem.rightBarButtonItem = restoreButton
        
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(MemberCell.self, forCellReuseIdentifier: MemberCell.reuseIdentifier)
        
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        sortButton.addTarget(self, action: #selector(didTapSortButton), for: .touchUpInside)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.alignment = .center
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 15
        view.addSubview(buttonStackView)
        
        view.addSubview(emptyStateLabel)
        
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            
            emptyStateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            emptyStateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
