//
//  MemberCell.swift
//  Members
//
//  Created by Ufuk Canlı on 27.03.2021.
//

import UIKit

class MemberCell: UITableViewCell {
    
    static let reuseIdentifier = "MemberCell"

    private let nameLabel = UCTitleLabel(textColor: .label, fontSize: 16)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with member: Member) {
        nameLabel.text = member.name
    }
    
    private func configure() {
        tintColor = .systemGreen
        accessoryType = .detailDisclosureButton
        
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
    }
}
