//
//  SettingsListCell.swift
//  myProject
//
//  Created by Apple on 6.4.2024.
//

import UIKit

struct SettingselementsSecond {
    var icons: String
    var titles: String
    var rightIcons: String
}

class SettingsListCell: UITableViewCell {
    
    private lazy var icon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rightIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI(){
        addSubview(icon)
        addSubview(title)
        addSubview(rightIcon)
        
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.widthAnchor.constraint(equalToConstant: 30),
            
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            
            rightIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
        ])
    }
    func set(dates: SettingselementsSecond){
        icon.image = UIImage(systemName: dates.icons)
        title.text = dates.titles
        rightIcon.image = UIImage(systemName: dates.rightIcons)
    }
}
