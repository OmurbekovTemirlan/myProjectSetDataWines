//
//  HomeView.swift
//  myProject
//
//  Created by Apple on 3.4.2024.
//

import UIKit

class HomeView: UIViewController {
    
    let wineService = WineService.shared
    
    private let cellRegister = "celll"
    
    private var dates: [Wine] = []
    
    private lazy var navBar = HomeNavBar()
    
    private lazy var hStac: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var sectionsBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Popular", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sectionsBtn2: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Offer", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sectionsBtn3: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Restaurant", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchBar: UISearchTextField = {
        let view = UISearchTextField()
        view.placeholder = "Search Wine"
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.cornerRadius = 13
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var hStacLists: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var allBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("All", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var fastFoodBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Fast Food", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var drinkBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Alcahols", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    private lazy var listCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 30)  , height: 120)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.minimumLineSpacing = 40
        let cl = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cl.translatesAutoresizingMaskIntoConstraints = false
        cl.dataSource = self
        cl.register(HomeCell.self, forCellWithReuseIdentifier: cellRegister)
        return cl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTop()
        setupCenter()
        wineService.fetchData { date in
            self.dates = date
            self.listCollectionView.reloadData()
        }
    }

    private func setupTop(){
        view.addSubview(navBar)
        view.addSubview(hStac)
        hStac.addArrangedSubview(sectionsBtn)
        hStac.addArrangedSubview(sectionsBtn2)
        hStac.addArrangedSubview(sectionsBtn3)
        view.addSubview(searchBar)
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor,constant: 40),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 60),
            
            hStac.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 15),
            hStac.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            hStac.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            hStac.heightAnchor.constraint(equalToConstant: 40),
            
            searchBar.topAnchor.constraint(equalTo: hStac.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setupCenter() {
        view.addSubview(hStacLists)
        hStacLists.addArrangedSubview(allBtn)
        hStacLists.addArrangedSubview(fastFoodBtn)
        hStacLists.addArrangedSubview(drinkBtn)
        view.addSubview(listCollectionView)
        NSLayoutConstraint.activate([
            hStacLists.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            hStacLists.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            hStacLists.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            hStacLists.heightAnchor.constraint(equalToConstant: 40),
            
            listCollectionView.topAnchor.constraint(equalTo: hStacLists.bottomAnchor, constant: 15),
            listCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
        ])
    }
}

extension HomeView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dates.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = listCollectionView.dequeueReusableCell(withReuseIdentifier: cellRegister, for: indexPath) as! HomeCell
        cell.set(dates: dates[indexPath.row])
        cell.backgroundColor = .systemBackground
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemGray3.cgColor
        cell.layer.shadowRadius = 4
        cell.layer.shadowColor = UIColor.systemGray.cgColor
        cell.layer.cornerRadius = 17
        return cell
    }
}

//extension HomeView: UICollectionViewDelegate {
//    
//}
