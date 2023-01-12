//
//  CallendarCollectionView.swift
//  Calendar
//
//  Created by Дмитрий Скоробогаты on 10.01.2023.
//

import UIKit

class CallendarCollectonView: UICollectionView {
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        setupLayout()
        configure()
        setDelegate()
        register(CallendarCollectionViewCell.self, forCellWithReuseIdentifier: CallendarCollectionViewCell.idCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        collectionLayout.minimumLineSpacing = 3
        collectionLayout.scrollDirection = .horizontal
        
    }
    
    private func configure() {
        
        backgroundColor = .none
        bounces = false
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        
    }
    
    private func setDelegate() {
        
        delegate = self
        dataSource = self
        
    }
}

//MARK: - Delegate Methods
extension CallendarCollectonView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped cell")
    }
    
}

//MARK: - Data Source Methods
extension CallendarCollectonView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CallendarCollectionViewCell.idCell, for: indexPath) as? CallendarCollectionViewCell else {
            return UICollectionViewCell()
            
        }
        return cell
    }
}

//MARK: - FlowLayotDelegate Methods
extension CallendarCollectonView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 7.5, height: collectionView.frame.height)
    }
    
}
