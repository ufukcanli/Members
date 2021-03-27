//
//  UCTitleLabel.swift
//  Members
//
//  Created by Ufuk Canlı on 27.03.2021.
//

import UIKit

class UCTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textColor: UIColor, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textColor = textColor
        self.font = .systemFont(ofSize: fontSize, weight: .semibold)
    }
    
    private func configure() {
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
