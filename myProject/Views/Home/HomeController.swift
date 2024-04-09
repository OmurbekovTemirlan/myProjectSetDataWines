//
//  HomeController.swift
//  myProject
//
//  Created by Apple on 9.4.2024.
//

import UIKit

protocol HomeControllerProtocol: AnyObject{
    func onGetDates()
    func onSuccsesDates(dates: [Wine])
}

class HomeController: HomeControllerProtocol {
    
    weak var view: HomeViewProtocol?
    private var model: HomeModelProtocol?
    
    init(view: HomeViewProtocol?) {
        self.view = view
        self.model = HomeModel(controller: self)
    }
    func onGetDates(){
        model?.getDates()
    }
    func onSuccsesDates(dates: [Wine]){
        view?.succsesDates(dates: dates)
    }
}
