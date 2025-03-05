//
//  HabitAction.swift
//  HabitKnife
//
//  Created by Mark Alldritt on 2025-01-27.
//

import Foundation
import SwiftData


@Model
final class HabitAction {
    var created: Date = Date()
    var count = Int(0)

    init(created: Date, count: Int) {
        self.created = created
        self.count = count
    }
}

