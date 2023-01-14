//
//  ViewController.swift
//  Calendar
//
//  Created by Дмитрий Скоробогаты on 10.01.2023.
//

import UIKit

class ViewController: UIViewController {

    private let callendarCollectionView = CalendarCollectonView()
    private let prevButton = CalendarMoveButton(imageName: "chevron.backward")
    private let nextButton = CalendarMoveButton(imageName: "chevron.forward")
    private let prevMonthLabel = MonthLabel()
    private let nextMonthLabel = MonthLabel(aligment: .right)
    
    private let calendarModel = CalendarModel()
    
    private var centerDate = Date()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        callendarCollectionView.scrollToItem(at: [0, 10], at: .centeredHorizontally, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .white
        updateDate(day: 0)
        callendarCollectionView.calendarDelegate = self
        view.addSubview(callendarCollectionView)
        
        view.addSubview(nextButton)
        view.addSubview(prevButton)
        
        prevButton.addTarget(self, action: #selector(prevTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        
        view.addSubview(prevMonthLabel)
        view.addSubview(nextMonthLabel)
    }
    
    @objc private func prevTapped() {
        
        callendarCollectionView.scrollToItem(at: [0, 3], at: .centeredHorizontally, animated: true)
        
    }
    
    @objc private func nextTapped() {
        
        callendarCollectionView.scrollToItem(at: [0, 17], at: .centeredHorizontally, animated: true)
        
    }
    
    private func updateDate(day offset: Int) {
        
        centerDate = centerDate.getDateWithOffset(with: offset)
        let daysArray = calendarModel.getWeeksForCalendar(date: centerDate)
        callendarCollectionView.setDaysArray(daysArray)
        callendarCollectionView.reloadData()
        callendarCollectionView.scrollToItem(at: [0, 10], at: .centeredHorizontally, animated: false)
        
        prevMonthLabel.text = daysArray[7].monthName.changeRusMonthEnding()
        nextMonthLabel.text = daysArray[13].monthName.changeRusMonthEnding()
        
        
    }

}

//MARK: - Calendar Protocol
extension ViewController: CalendarProtocol {
    
    func maxOffsetLeft() {
        updateDate(day: -7)
    }
    
    func maxOffsetRight() {
        updateDate(day: 7)
    }
    
}

//MARK: - Set Constrains
extension ViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            prevButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            prevButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            prevButton.widthAnchor.constraint(equalToConstant: 60),
            prevButton.heightAnchor.constraint(equalToConstant: 60),
            
            nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-10),
            nextButton.widthAnchor.constraint(equalToConstant: 60),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            
            callendarCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            callendarCollectionView.leadingAnchor.constraint(equalTo: prevButton.trailingAnchor, constant: 2),
            callendarCollectionView.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -2),
            callendarCollectionView.heightAnchor.constraint(equalToConstant: 60),
            
            prevMonthLabel.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 5),
            prevMonthLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            nextMonthLabel.topAnchor.constraint(equalTo: prevButton.bottomAnchor, constant: 5),
            nextMonthLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        
        ])
        
    }
}
