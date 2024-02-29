//
//  HabitModel.swift
//
//  Created on 2/25/24.
//

import Foundation

struct Habit: Identifiable, Hashable, Codable {
    let id: String
    var name: String
    var details: String?
    var isChecked: Bool
    var completionDates: [Date]
    var currentStreak: Int
    
    mutating func toggleCompletion() {
        isChecked.toggle()
        if isChecked {
            completionDates.append(Date())
            print("added and now completion dates look like \(completionDates)")
        } else {
            if let index = completionDates.firstIndex(where: { Calendar.current.isDate($0, inSameDayAs: Date())}) {
                completionDates.remove(at: index)
            }
            print("removed and now completion dates look like \(completionDates)")
        }
    }
}

class Habits: ObservableObject {
    @Published var habitData = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habitData) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedHabits) {
                habitData = decodedHabits
                return
            }
        }
        habitData = []
    }
    
    func addHabit(name: String, details: String) {
        let newHabit = Habit(id: NSUUID().uuidString, name: name, details: details, isChecked: false, completionDates: [], currentStreak: 0)
        habitData.append(newHabit)
    }
    
    func getHabit(by id: String) -> Habit? {
       return habitData.first(where: { $0.id == id})
    }
    
    func deleteHabit(by id: String) {
        if let index = habitData.firstIndex(where: { $0.id == id }) {
            print("removing the habit with the name: \(habitData[index].name)")
            habitData.remove(at: index)
        }
    }
    
    func deleteAllHabits() {
        habitData.removeAll()
        print("deleted all habits")
    }
}

extension Habit {
    static var MOCK_HABITS: [Habit] = [
        .init(id: NSUUID().uuidString, name: "Go jogging", isChecked: false, completionDates: [], currentStreak: 0),
        .init(id: NSUUID().uuidString, name: "Journal", isChecked: false, completionDates: [], currentStreak: 0),
        .init(id: NSUUID().uuidString, name: "Practice piano", isChecked: false, completionDates: [], currentStreak: 0),
        .init(id: NSUUID().uuidString, name: "Floss", isChecked: false, completionDates: [], currentStreak: 0),
        .init(id: NSUUID().uuidString, name: "No phone for an hour in the morning", isChecked: false, completionDates: [], currentStreak: 0),
    ]
}

