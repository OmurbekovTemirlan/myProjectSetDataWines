//
//  ThemsCell.swift
//  myProject
//
//  Created by Apple on 16.4.2024.
//

import UIKit

struct ThemsStruct {
    var title: String
}

class ThemsCell: UITableViewCell {
    
    static let idCell = "IDCELL" 
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var switchControlThems: UISwitch = {
        let view = UISwitch()
        view.contentHorizontalAlignment = .left
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
        addSubview(titleLabel)
        addSubview(switchControlThems)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            switchControlThems.centerYAnchor.constraint(equalTo: centerYAnchor),
            switchControlThems.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
    func set(title: ThemsStruct){
        titleLabel.text = title.title
    }
}
