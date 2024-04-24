//
//  HomeModel.swift
//  myProject
//
//  Created by Apple on 9.4.2024.
//

import Foundation

protocol HomeModelProtocol: AnyObject{
    func getDates()
    func searchWines(text: String)
}

class HomeModel: HomeModelProtocol{
    
    weak var controller: HomeControllerProtocol?
    
    var wineService = WineService.shared
    
    private var dates: [Wine] = []
    
    private var filteredDates: [Wine] = []
    
    init(controller: HomeControllerProtocol?) {
        self.controller = controller
    }
    
    func getDates() {
        
        wineService.fetchData { dates in
            self.dates = dates
            self.filteredDates = dates
            self.controller?.onSuccsesDates(dates: dates)
        }
    }
    
    func searchWines(text: String) {
       filteredDates = []
        if text.isEmpty {
            filteredDates = dates
            controller?.onSuccsesDates(dates: filteredDates)
        } else {
            filteredDates = dates.filter({date in date.wine.uppercased().contains(text.uppercased()) == true })
            controller?.onSuccsesDates(dates: filteredDates)
            
        }
    }
}

