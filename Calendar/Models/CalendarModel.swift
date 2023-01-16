//
//  CallendarModel.swift
//  Calendar
//
//  Created by Дмитрий Скоробогаты on 12.01.2023.
//

import Foundation

class CalendarModel {
    
    
    private func getDaysArray(date: Date) -> [Date] {
        
        var dateArray = [Date]()
        
        for day in -10...10 {
            
            let day = date.getDateWithOffset(with: day)
            dateArray.append(day)
            
        }
        
        return dateArray
    }
    
    public func getWeeksForCalendar(date: Date) -> [DateModel] {
        
        let dayArray = getDaysArray(date: date)
        let dateModelsArray = dayArray.map { $0.convertDateToModel() }
        return dateModelsArray
        
    }
}
