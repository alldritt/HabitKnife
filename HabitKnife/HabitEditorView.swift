//
//  HabitEditorView.swift
//  HabitKnife
//
//  Created by Mark Alldritt on 2025-01-28.
//

import SwiftUI
import ColorGrid


struct HabitEditorView: View {
    @State var habit: Habit
    let isNewModel: Bool
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Name",
                          text: Binding<String>(
                            get: { habit.name ?? "" }, // Provide a default value if the optional is nil
                            set: { value in
                                habit.name = value
                            }
                          )
                )
            }
            
            Section(header: Text("Description")) {
                TextField("Description",
                          text: Binding<String>(
                            get: { habit.notes ?? "" }, // Provide a default value if the optional is nil
                            set: { value in
                                habit.notes = value
                            }
                          ),
                          axis: .vertical
                )
            }
            
            Section(header: Text("Streak Goal")) {
                Picker("Streak", selection: $habit.streak) {
                    ForEach(Habit.StreakType.allCases, id: \.self) { type in
                        Text(type.description)
                            .tag(type)
                            .accessibilityLabel(type.description)
                    }
                }
                .pickerStyle(.menu)
                    
                if let streak = habit.streak,
                   streak != Habit.StreakType.none {
                    Stepper("\(habit.streakCount) / \(streak.singular)", value: $habit.streakCount)
                }
            }
            
            Section(header: Text("Color")) {
                CGPicker(colors: Habit.accentColors, selection: $habit.accentColor, icon: .square, border: .selection)
            }
        }
    }
}

#Preview {
    @Previewable @State var habit = Habit()
    
    HabitEditorView(habit: habit, isNewModel: true)
}
