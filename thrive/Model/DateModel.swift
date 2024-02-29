//
//  DateModel.swift
//  thrive
//
//  Created on 2/29/24.
//

import Foundation

class TodaysDate: ObservableObject {
    @Published var currentDate: Date = Date()
    @Published var month: String = ""
    @Published var weekday: String = ""
    @Published var dayOfMonth: String = ""
    
    init() {
        updateDate()
    }
    
    func updateDate() {
        currentDate = Date()
        updateMonth()
        updateWeekday()
        updateDayOfMonth()
    }
    
    private func updateMonth() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        self.month = formatter.string(from: currentDate)
    }
    
    private func updateWeekday() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        self.weekday = dateFormatter.string(from: currentDate)
    }
    
    private func updateDayOfMonth() {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        self.dayOfMonth = formatter.string(from: currentDate)
    }
    
    func getShortenedWeekday(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date)
    }
    
    func getDayOfMonth(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
}
