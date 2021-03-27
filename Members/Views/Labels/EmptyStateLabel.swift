//
//  EmptyStateLabel.swift
//  Members
//
//  Created by Ufuk Canlı on 27.03.2021.
//

import UIKit

class EmptyStateLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        text = "🧐 Looks like there are no members."
        textAlignment = .center
        font = .preferredFont(forTextStyle: .body)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
