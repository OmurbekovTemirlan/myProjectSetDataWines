//
//  HomeCell.swift
//  myProject
//
//  Created by Apple on 6.4.2024.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    private lazy var titleFoodLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var infoLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .systemGray4
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var images: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI(){
        addSubview(titleFoodLbl)
        addSubview(infoLbl)
        addSubview(priceLbl)
        addSubview(images)
        
        NSLayoutConstraint.activate([
            titleFoodLbl.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            titleFoodLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleFoodLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            infoLbl.topAnchor.constraint(equalTo: titleFoodLbl.bottomAnchor, constant: 10),
            infoLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleFoodLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            priceLbl.topAnchor.constraint(equalTo: infoLbl.bottomAnchor, constant: 10),
            priceLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleFoodLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            images.centerYAnchor.constraint(equalTo: centerYAnchor),
            images.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            images.heightAnchor.constraint(equalToConstant: 100),
            images.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    func set(dates: Wine){
        titleFoodLbl.text = dates.wine
//        infoLbl.text = dates.winery
//        priceLbl.text = dates.location
    }
}
