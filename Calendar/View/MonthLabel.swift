//
//  MonthLabel.swift
//  Calendar
//
//  Created by Дмитрий Скоробогаты on 12.01.2023.
//

import UIKit

class MonthLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(aligment: NSTextAlignment) {
        self.init()
        textAlignment = aligment
        configure()
    }
    
    private func configure() {
        text = "January"
        textColor = .gray
        translatesAutoresizingMaskIntoConstraints = false
    }
}
