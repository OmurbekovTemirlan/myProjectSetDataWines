//
//  SettingsView.swift
//  myProject
//
//  Created by Apple on 5.4.2024.
//

import UIKit

class SettingsView: UIViewController {
    
    private let idCell = "cells"
    private let idCell2 = "cells2"
    private let idCell3 = "cells3"
    
    private lazy var settingsElements: [SettingsElements] = [
        SettingsElements(image: "person", title: "Temirlan", status: "Busy", type: .withQrCode),
        SettingsElements(image: "sparkles", title: "Avatars", status: "", type: .withRightImage)
    ]
    
    private lazy var settingsElementsSecond: [SettingselementsSecond] = [
        SettingselementsSecond(icons: "globe", titles: "Languages", rightIcons: "chevron.right"),
        SettingselementsSecond(icons: "microbe.circle", titles: "Themes", rightIcons: "chevron.right"),
        SettingselementsSecond(icons: "key.fill", titles: "Account", rightIcons: "chevron.right"),
        SettingselementsSecond(icons: "star", titles: "Favorites", rightIcons: "chevron.right"),
        SettingselementsSecond(icons: "bell", titles: "Notifications", rightIcons: "chevron.right"),
        SettingselementsSecond(icons: "macbook.and.iphone", titles: "Devices", rightIcons: "chevron.right"),
        SettingselementsSecond(icons: "nosign", titles: "Blockedы", rightIcons: "chevron.right"),
        SettingselementsSecond(icons: "bubble.middle.top.fill", titles: "Chats", rightIcons: "chevron.right"),
        SettingselementsSecond(icons: "lock", titles: "Сonfidentiality", rightIcons: "chevron.right"),
        SettingselementsSecond(icons: "arrow.up.arrow.down", titles: "Data and Storage", rightIcons: "chevron.right"),
        
    ]
    
    private lazy var settingElementsFAQ: [SettingselementsFaqs] = [
        SettingselementsFaqs(icons: "ellipsis.message.fill", titles: "Help", rightIcons: "chevron.right"),
        SettingselementsFaqs(icons: "questionmark.circle", titles: "Questions about MyApp", rightIcons: "chevron.right"),
        SettingselementsFaqs(icons: "wand.and.stars", titles: "My App Premuim", rightIcons: "chevron.right"),
        
    ]
    
    private lazy var scrollView = UIScrollView()
    
    private lazy var contentView = UIView()
    
    private lazy var titleScreenLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Search"
        view.backgroundImage = UIImage()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var profileInfoTableView = UITableView()
    
    private lazy var listTableView = UITableView()
    
    private lazy var FaqsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        navigationController?.tabBarController?.tabBar.isHidden = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    private func setupUI() {
        configureScrollView()
        praperScrollView()
        configureElements()
        tableViewSettings()
    }
    
    private func configureScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        scrollView.delegate = self
        scrollView.isScrollEnabled = true
    }
    
    private func praperScrollView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
    }
    
    private func configureElements(){
        contentView.addSubview(titleScreenLabel)
        contentView.addSubview(searchBar)
        contentView.addSubview(profileInfoTableView)
        contentView.addSubview(listTableView)
        contentView.addSubview(FaqsTableView)
        
        NSLayoutConstraint.activate([
            titleScreenLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            titleScreenLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            searchBar.topAnchor.constraint(equalTo: titleScreenLabel.bottomAnchor, constant: 5),
            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            profileInfoTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5),
            profileInfoTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            profileInfoTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            profileInfoTableView.heightAnchor.constraint(equalToConstant: 128),
            
            listTableView.topAnchor.constraint(equalTo: profileInfoTableView.bottomAnchor, constant: 10),
            listTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            listTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            listTableView.heightAnchor.constraint(equalToConstant: 500),
            
            FaqsTableView.topAnchor.constraint(equalTo: listTableView.bottomAnchor, constant: 15),
            FaqsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            FaqsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            FaqsTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            FaqsTableView.heightAnchor.constraint(equalToConstant: 148),
            
        ])
    }
    private func tableViewSettings(){
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        profileInfoTableView.backgroundColor = .systemGray6
        profileInfoTableView.translatesAutoresizingMaskIntoConstraints = false
        profileInfoTableView.dataSource = self
        profileInfoTableView.register(SettingsCell.self, forCellReuseIdentifier: idCell)
        profileInfoTableView.delegate = self
        profileInfoTableView.layer.cornerRadius = 20
        profileInfoTableView.isScrollEnabled = false
        
        listTableView.backgroundColor = .systemGray6
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        listTableView.dataSource = self
        listTableView.register(SettingsListCell.self, forCellReuseIdentifier: idCell2)
        listTableView.delegate = self
        listTableView.layer.cornerRadius = 20
        listTableView.isScrollEnabled = false
        
        FaqsTableView.backgroundColor = .systemGray6
        FaqsTableView.translatesAutoresizingMaskIntoConstraints = false
        FaqsTableView.dataSource = self
        FaqsTableView.register(SettingsCellFaqs.self, forCellReuseIdentifier: idCell3)
        FaqsTableView.delegate = self
        FaqsTableView.layer.cornerRadius = 20
        FaqsTableView.isScrollEnabled = false
    }
    
}
extension SettingsView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        
        if contentOffsetY > 0 {
            navigationController?.setNavigationBarHidden(false, animated: false)
            
            UIView.transition(with: navigationController!.navigationBar, duration: 1, options: .transitionCrossDissolve, animations: {
                self.navigationItem.title = self.titleScreenLabel.text
            }, completion: nil)
            
        } else {
            navigationController?.setNavigationBarHidden(false, animated: false)
            
            UIView.transition(with: navigationController!.navigationBar, duration: 1, options: .transitionCrossDissolve, animations: {
                self.navigationItem.title = ""
            }, completion: nil)
        }
    }
}
    
extension SettingsView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == profileInfoTableView {
            return settingsElements.count
        }else if tableView == listTableView {
            return settingsElementsSecond.count
        }else if tableView == FaqsTableView{
            return settingElementsFAQ.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == profileInfoTableView{
            let cell = profileInfoTableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! SettingsCell
            cell.set(dates: settingsElements[indexPath.row])
            cell.backgroundColor = .systemGray6
            return cell
        } else if tableView == listTableView {
            let cell = listTableView.dequeueReusableCell(withIdentifier: idCell2, for: indexPath) as! SettingsListCell
            cell.set(dates: settingsElementsSecond[indexPath.row])
            cell.backgroundColor = .systemGray6
            return cell
        } else {
            let cell = FaqsTableView.dequeueReusableCell(withIdentifier: idCell3, for: indexPath) as! SettingsCellFaqs
            cell.set(dates: settingElementsFAQ[indexPath.row])
            cell.backgroundColor = .systemGray6
            return cell
        }
    }
}


extension SettingsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == profileInfoTableView{
            if indexPath.row == 0 {
                return 80
            }
            return 50
        }
      return 50
        }
        
    
}
