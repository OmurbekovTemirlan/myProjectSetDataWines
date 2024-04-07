//
//  SettingsCell.swift
//  myProject
//
//  Created by Apple on 6.4.2024.
//

import UIKit

enum SettingsType {
    case withRightImage
    case withStatus
    case withQrCode
    case usual
}

struct SettingsElements {
    var image: String
    var title: String
    var status: String
    var type: SettingsType
}

class SettingsCell: UITableViewCell {
    
    private lazy var userImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleCellLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userStatusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rightImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var qrCodeImage: UIImageView = {
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
        addSubview(userImage)
        addSubview(titleCellLabel)
        contentView.addSubview(userStatusLabel)
        contentView.addSubview(rightImage)
        contentView.addSubview(qrCodeImage)
        
        NSLayoutConstraint.activate([
            userImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            userImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userImage.heightAnchor.constraint(equalToConstant: 30),
            userImage.widthAnchor.constraint(equalToConstant: 30),
            
            titleCellLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleCellLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 10),
            
            userStatusLabel.topAnchor.constraint(equalTo: titleCellLabel.bottomAnchor, constant: 10),
            userStatusLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 10),
            
            qrCodeImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            qrCodeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            qrCodeImage.heightAnchor.constraint(equalToConstant: 25),
            qrCodeImage.widthAnchor.constraint(equalToConstant: 25),
            
            rightImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
           
        ])
    }
    
    func set(dates: SettingsElements){
        userImage.image = UIImage(systemName: dates.image)
        titleCellLabel.text = dates.title
        userStatusLabel.text = dates.status
        if dates.type == .withQrCode {
            qrCodeImage.image = UIImage(systemName: "qrcode")
            rightImage.isHidden = true
            qrCodeImage.isHidden = false
        }else if dates.type == .withRightImage{
            userImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
            userImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
            titleCellLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            rightImage.image = UIImage(systemName: "chevron.right")
            rightImage.semanticContentAttribute = .forceRightToLeft
            rightImage.isHidden = false
            qrCodeImage.isHidden = true
            userStatusLabel.isHidden = true
        }
        
    }
}
