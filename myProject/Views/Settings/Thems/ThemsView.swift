//
//  ThemsView.swift
//  myProject
//
//  Created by Apple on 13.4.2024.
//

import UIKit

class ThemsView: UIViewController {
    
    private lazy var hStac: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .center
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 13
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.darkGray.cgColor
        return view
    }()
    
    private lazy var themsLabel: UILabel = {
        let view = UILabel()
        view.text = "   Темная тема"
        view.isHidden = false
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var switchControlThems: UISwitch = {
        let view = UISwitch()
        view.contentHorizontalAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI(){
        view.addSubview(hStac)
        hStac.addArrangedSubview(themsLabel)
        hStac.addArrangedSubview(switchControlThems)
        
        NSLayoutConstraint.activate([
            hStac.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            hStac.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            hStac.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            hStac.heightAnchor.constraint(equalToConstant: 50),
            
            switchControlThems.trailingAnchor.constraint(equalTo: hStac.trailingAnchor, constant: -10),
        ])
    }
}
