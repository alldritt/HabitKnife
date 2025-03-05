//
//  NewHabitView.swift
//  HabitKnife
//
//  Created by Mark Alldritt on 2025-03-05.
//

import SwiftUI

struct NewHabitView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State var newHabit: Habit
    
    var body: some View {
        NavigationView {
            HabitEditorView(habit: newHabit, isNewModel: true)
                .overlay(alignment: .bottom) {
                    Button {
                        modelContext.insert(newHabit)
                        dismiss()
                    } label: {
                        Text("Save")
                            .padding(3)
                            .frame(maxWidth: .infinity)
                    }
                    .disabled((newHabit.name?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "").isEmpty)
                    .buttonStyle(.borderedProminent)
                    .padding(15)
                    .padding([.leading, .trailing], 15)
                }
                .navigationTitle("New Habit")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Label("Cancel", systemImage: "xmark")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            modelContext.insert(newHabit)
                            dismiss()
                        }
                        .disabled((newHabit.name?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "").isEmpty)
                    }
                }
        }
    }
}

#Preview {
    @Previewable @State var newHabit = Habit()
    
    NewHabitView(newHabit: newHabit)
}
