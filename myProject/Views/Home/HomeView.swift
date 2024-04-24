//
//  HomeView.swift
//  myProject
//
//  Created by Apple on 3.4.2024.
//

import UIKit

protocol HomeViewProtocol: AnyObject{
    func succsesDates(dates: [Wine])
}

class HomeView: UIViewController {
    
    private var controller: HomeControllerProtocol?
    
    private var datess: [Wine] = []
    
    private let cellRegister = "celll"
    
    private var isSearching: Bool = false
    
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
        view.setTitleColor(UIColor(named: "darkThems"), for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sectionsBtn2: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Offer", for: .normal)
        view.setTitleColor(UIColor(named: "darkThems"), for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sectionsBtn3: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Restaurant", for: .normal)
        view.setTitleColor(UIColor(named: "darkThems"), for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.cornerRadius = 12
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
        view.addTarget(self, action: #selector(searchBarEditing), for: .editingChanged)
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
        view.setTitleColor(UIColor(named: "darkThems"), for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var fastFoodBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Fast Food", for: .normal)
        view.setTitleColor(UIColor(named: "darkThems"), for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var drinkBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Alcahols", for: .normal)
        view.setTitleColor(UIColor(named: "darkThems"), for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchResultLabel: UILabel = {
        let view = UILabel()
//        view.text = "Проверьте ваш интернет!!"
        view.isHidden = false
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var listCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 30)  , height: 230)
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
        controller = HomeController(view: self)
        controller?.onGetDates()
        addGestureReconizer()
        view.bringSubviewToFront(searchResultLabel)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        controller?.onGetDates()
        listCollectionView.reloadData()

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
        view.addSubview(searchResultLabel)
        
        view.addSubview(listCollectionView)
        NSLayoutConstraint.activate([
            hStacLists.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            hStacLists.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            hStacLists.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            hStacLists.heightAnchor.constraint(equalToConstant: 40),
            
            searchResultLabel.topAnchor.constraint(equalTo: hStacLists.bottomAnchor, constant: 50),
            searchResultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            listCollectionView.topAnchor.constraint(equalTo: hStacLists.bottomAnchor, constant: 15),
            listCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
        ])
    }
    private func addGestureReconizer(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(resignSearchBar))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc private func resignSearchBar(){
        searchBar.text = ""
        searchResultLabel.text = ""
        controller?.onGetDates()
        searchBar.resignFirstResponder()
        
        if datess.isEmpty{
            searchResultLabel.isHidden = false
            searchResultLabel.text = "По вашему запросу ничего не найдено..."
        }else{
            searchResultLabel.isHidden = true
        }
    }
    
    @objc private func searchBarEditing(){
        guard let text = searchBar.text else {return}
        isSearching = true
        controller?.onSearchWines(text: text)
        listCollectionView.reloadData()
        if searchBar.text == "" {
            searchResultLabel.text = ""
        }
    }
}

extension HomeView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        datess.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = listCollectionView.dequeueReusableCell(withReuseIdentifier: cellRegister, for: indexPath) as! HomeCell
        cell.set(dates: datess[indexPath.row])
        cell.backgroundColor = .systemBackground
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemGray3.cgColor
        cell.layer.shadowRadius = 4
        cell.layer.shadowColor = UIColor.systemGray.cgColor
        cell.layer.cornerRadius = 17
        return cell
    }
}
extension HomeView: HomeViewProtocol {
    func succsesDates(dates: [Wine]) {
        if dates.isEmpty{
            searchResultLabel.isHidden = false
           searchResultLabel.text = "По вашему запросу ничего не найдено..."
        }else{
            searchResultLabel.isHidden = true
        }
        self.datess = dates
        self.listCollectionView.reloadData()
    }
}
