//
//  HomeNavBar.swift
//  myProject
//
//  Created by Apple on 6.4.2024.
//

import UIKit

class HomeNavBar: UIView {
    
    private lazy var leftIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName:  "slider.vertical.3")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleNavBar: UILabel = {
        let label = UILabel()
        label.text = "Wine List"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.circle")
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
        addSubview(leftIcon)
        addSubview(titleNavBar)
        addSubview(userImage)
        
        NSLayoutConstraint.activate([
            leftIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            leftIcon.heightAnchor.constraint(equalToConstant: 25),
            leftIcon.widthAnchor.constraint(equalToConstant: 25),
            
            
            titleNavBar.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleNavBar.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            userImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            userImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            userImage.heightAnchor.constraint(equalToConstant: 30),
            userImage.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    
}
