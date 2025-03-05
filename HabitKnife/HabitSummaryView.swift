//
//  HabitSummaryView.swift
//  HabitKnife
//
//  Created by Mark Alldritt on 2025-02-05.
//

import SwiftUI

struct HabitSummaryView: View {
    @State var habit: Habit
    
    var streak: String? {
        if let streak = habit.streak,
           streak != .none {
            return "\(habit.streakCount) / \(streak.singular)"
        }
        
        return nil
    }

    var body: some View {
        HStack(alignment: .top) {
            habit.icon
                .font(.title)
                .foregroundColor(habit.accentColor)
            
            VStack(alignment: .leading, spacing: 3) {
                if let name = habit.name, name.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                    Text(name)
                }
                if let notes = habit.notes, notes.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                    Text(notes)
                        .lineLimit(3)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                if let streak = streak {
                    Group {
                        Text(habit.created, format: Date.FormatStyle(date: .numeric, time: .standard))
                            .font(.caption)
                        + Text(", ")
                            .font(.caption)
                        + Text(streak)
                            .font(.caption)
                    }
                }
                else {
                    Text(habit.created, format: Date.FormatStyle(date: .numeric, time: .standard))
                        .font(.caption)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var habit = Habit()

    HabitSummaryView(habit: habit)
}
