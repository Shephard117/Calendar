//
//  ViewController.swift
//  Calendar
//
//  Created by Дмитрий Скоробогаты on 10.01.2023.
//

import UIKit

class ViewController: UIViewController {

    private let callendarCollectionView = CallendarCollectonView()
    private let prevButton = CallendarMoveButton(imageName: "chevron.backward")
    private let nextButton = CallendarMoveButton(imageName: "chevron.forward")
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(callendarCollectionView)
        view.addSubview(nextButton)
        view.addSubview(prevButton)
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
            callendarCollectionView.heightAnchor.constraint(equalToConstant: 60)
        
        ])
        
    }
}
