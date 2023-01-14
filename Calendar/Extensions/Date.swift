//
//  Date.swift
//  Calendar
//
//  Created by Дмитрий Скоробогаты on 12.01.2023.
//

import Foundation


extension Date {
    
    func getDateWithOffset(with offset: Int) -> Date {
        
        let offsetDate = Calendar.current.date(byAdding: .day, value: offset, to: self) ?? Date()
        
        return offsetDate
        
    }
    
    func convertDateToModel() -> DateModel {
        
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_Ru")
        formatter.dateFormat = "EEEEEE"
        
        let numberOfDay = calendar.component(.day, from: self)
        let dayOfWeek = formatter.string(from: self)
        
        return DateModel(numberOfDay: String(numberOfDay), dayOfWeek: dayOfWeek, monthName: self.getMonthFromDate(), dateString: self.dateFormatddMMyyyy())
    }
    
    func getMonthFromDate() -> String {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_Ru")
        formatter.dateFormat = "MMMM"
        let monthName = formatter.string(from: self)
        return monthName
        
    }
    
    func dateFormatddMMyyyy() -> String {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_Ru")
        formatter.dateFormat = "dd/MM/yyyy"
        let format = formatter.string(from: self)
        return format
        
    }
}
