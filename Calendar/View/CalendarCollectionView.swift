//
//  CallendarCollectionView.swift
//  Calendar
//
//  Created by Дмитрий Скоробогаты on 10.01.2023.
//

import UIKit

protocol CalendarProtocol: AnyObject {
    
    func maxOffsetLeft()
    func maxOffsetRight()
    
}

class CalendarCollectonView: UICollectionView {
    
    private let collectionLayout = UICollectionViewFlowLayout()
    weak var calendarDelegate: CalendarProtocol?
    
    private var daysArray = [DateModel]()
    
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
    
    public func setDaysArray(_ array: [DateModel]) {
        
        daysArray = array
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x < 3 {
            calendarDelegate?.maxOffsetLeft()
        }
        
        if scrollView.contentOffset.x > self.frame.width * 2 {
            calendarDelegate?.maxOffsetRight()
        }
    }
}

//MARK: - Delegate Methods
extension CalendarCollectonView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped cell")
    }
    
}

//MARK: - Data Source Methods
extension CalendarCollectonView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return daysArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CallendarCollectionViewCell.idCell, for: indexPath) as? CallendarCollectionViewCell else {
            return UICollectionViewCell()
            
        }
        if daysArray[indexPath.row].dateString == Date().dateFormatddMMyyyy() {
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        }
        let dateModel = daysArray[indexPath.row]
        cell.configure(dateModel)
        return cell
    }
}

//MARK: - FlowLayotDelegate Methods
extension CalendarCollectonView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 7.5, height: collectionView.frame.height)
    }
    
}
