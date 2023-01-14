//
//  StringExtensions.swift
//  Calendar
//
//  Created by Дмитрий Скоробогаты on 14.01.2023.
//

import Foundation


extension String {
    
    func changeRusMonthEnding() -> String {
        
        let monthDict = ["января" : "Январь", "февраля" : "Февраль", "марта" : "Март", "апреля" : "Апрель", "мая" : "Май", "июня" : "Июнь", "июля" : "Июль", "августа" : "Август", "сентября" : "Сентябрь", "октября" : "Октябрь", "ноября" : "Ноябрь", "декабря" : "Декабрь"]
        return monthDict[self]!
        
    }
}
