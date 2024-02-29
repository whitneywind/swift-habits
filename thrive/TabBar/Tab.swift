//
//  Tab.swift
//  thrive
//
//  Createdon 2/25/24.
//

import Foundation
import SwiftUI

enum Tab: Int, Identifiable, CaseIterable, Comparable {
    static func < (lhs: Tab, rhs: Tab) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case home, addHabit, settings
    
    internal var id: Int { rawValue }
    
    
    var icon: String {
        switch self {
        case .home:
            return "house.circle"
        case .addHabit:
            return "plus.circle"
        case .settings:
            return "gear.circle"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .addHabit:
            return "Habits"
        case .settings:
            return "Settings"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return .color1
        case .addHabit:
            return .color2
        case .settings:
            return .color4
        }
    }
}
