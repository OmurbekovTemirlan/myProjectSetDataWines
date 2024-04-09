//
//  HomeModel.swift
//  myProject
//
//  Created by Apple on 9.4.2024.
//

import Foundation

protocol HomeModelProtocol: AnyObject{
    func getDates()
}

class HomeModel: HomeModelProtocol{
   
weak var controller: HomeControllerProtocol?
    
    var wineService = WineService.shared
    
    private var dates: [Wine] = []
    
    
    init(controller: HomeControllerProtocol?) {
        self.controller = controller
    }
   
  
//    func getDates() {
//        dates = wineService.fetchData { date in
//            self.dates = date
//            self.controller?.onSuccsesDates(dates: self.dates)
//        }
//    }
    func getDates() {
        wineService.fetchData { dates in
            // Передаем полученные данные в замыкание
            self.controller?.onSuccsesDates(dates: dates)
        }
    }

    
    }

