//
//  ThemsView.swift
//  myProject
//
//  Created by Apple on 13.4.2024.
//

import UIKit

class ThemsView: UIViewController {
    
    private var them: [ThemsStruct] = [ThemsStruct(title: "Dark them")]
    
    private lazy var themsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    private func setupUI(){
        view.addSubview(themsTableView)
        NSLayoutConstraint.activate([
            themsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            themsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            themsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        themsTableView.translatesAutoresizingMaskIntoConstraints = false
        themsTableView.dataSource = self
        themsTableView.register(ThemsCell.self, forCellReuseIdentifier: ThemsCell.idCell)
//        themsTableView.delegate = self
        themsTableView.backgroundColor = .blue
    }
    
}

extension ThemsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        them.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ThemsCell.idCell, for: indexPath) as! ThemsCell
        cell.set(title: them[indexPath.row])
        cell.backgroundColor = .systemGray4
        cell.layer.cornerRadius = 14
        return cell
    }
}
//
//extension ThemsView: UITableViewDelegate{
//    
//}
