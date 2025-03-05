//
//  Habit.swift
//  HabitKnife
//
//  Created by Mark Alldritt on 2025-01-27.
//

import Foundation
import SwiftUI
import SwiftData


@Model
final class Habit {
    
    static let accentColors: [Color] = CodableColor.allCases.map { c in
        Color(codableColor: c)
    }
    
    enum StreakType: Int, CaseIterable, Codable { case none, daily, weekdays, weekly, monthly }
    
    var created: Date = Date()
    var name: String? = nil
    var notes: String? = nil
    var streak: StreakType? = StreakType.daily
    var streakCount = Int(1)
    var iconName: String = "star.fill"
    var accentCodableColor = CodableColor.palette1

    init() {
        //  Randomize accent color
        self.accentCodableColor = CodableColor.allCases.randomElement() ?? .palette1
    }
    
    //  Convinence accessors
    
    var icon: Image {
        return Image(systemName: iconName)
    }
    
    var accentColor: Color {
        get {
            return Color(codableColor: accentCodableColor)
        }
        set {
            accentCodableColor = CodableColor(color: newValue) ?? .palette1
        }
    }
}


extension Habit.StreakType {
    var description: String {
        switch self {
        case .none:
            return "None"
        case .daily:
            return "Daily"
        case .weekdays:
            return "Weekdays"
        case .weekly:
            return "Weekly"
        case .monthly:
            return "Monthly"
        }
    }
    
    var singular: String {
        switch self {
        case .none:
            return "None"
        case .daily:
            return "Day"
        case .weekdays:
            return "Weekday"
        case .weekly:
            return "Week"
        case .monthly:
            return "Month"
        }
    }
}
