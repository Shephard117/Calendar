//
//  CallendarCollectionViewCell.swift
//  Calendar
//
//  Created by Дмитрий Скоробогаты on 12.01.2023.
//

import UIKit


class CallendarCollectionViewCell: UICollectionViewCell {
    
    static let idCell = "idCell"
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Thu"
        label.textColor = .orange
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let dayNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .orange
                dayLabel.textColor = .white
                dayNumberLabel.textColor = .white
            } else {
                backgroundColor = .red
                dayLabel.textColor = .orange
                dayNumberLabel.textColor = .white
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        layer.cornerRadius = 15
        backgroundColor = .red
        addSubview(dayLabel)
        addSubview(dayNumberLabel)
    }
    
    public func configure(_ model: DateModel) {
        
        dayLabel.text = model.dayOfWeek
        dayNumberLabel.text = model.numberOfDay
    }
}

//MARK: - Ser Constriants
extension CallendarCollectionViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            dayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            dayNumberLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            dayNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        ])
    }
}
