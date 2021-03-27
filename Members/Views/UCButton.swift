//
//  UCButton.swift
//  Members
//
//  Created by Ufuk Canlı on 27.03.2021.
//

import UIKit

class UCButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title.uppercased(), for: .normal)
    }
    
    private func configure() {
        clipsToBounds = true
        layer.masksToBounds = false
        layer.cornerRadius = 25
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowColor = UIColor.darkGray.cgColor
        
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .preferredFont(forTextStyle: .headline)
        
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 250).isActive = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
