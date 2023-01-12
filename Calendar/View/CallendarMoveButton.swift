//
//  CallendarMoveButton.swift
//  Calendar
//
//  Created by Дмитрий Скоробогаты on 12.01.2023.
//

import UIKit


class CallendarMoveButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(imageName: String) {
        self.init(type: .system)
        setImage(UIImage(systemName: imageName), for: .normal)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 15
        backgroundColor = .red
        tintColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
