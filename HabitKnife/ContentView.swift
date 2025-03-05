//
//  ContentView.swift
//  HabitKnife
//
//  Created by Mark Alldritt on 2025-01-27.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Habit.created) private var habits: [Habit]

    @State var presentingNewHabit = false
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(habits) { habit in
                    NavigationLink {
                        NavigationView {
                            HabitEditorView(habit: habit, isNewModel: false)
                                .navigationTitle("Edit Habit")
                                .navigationBarTitleDisplayMode(.inline)
                        }
                    } label: {
                        HabitSummaryView(habit: habit)
                    }
                }
                .onDelete(perform: deleteHabits)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addHabit) {
                        Label("Add Habit", systemImage: "plus")
                    }
                    .sheet(isPresented: $presentingNewHabit) {
                        let newHabit = Habit()

                        NewHabitView(newHabit: newHabit)
                    }
                }
            }
            .navigationTitle(("Habits"))
        } detail: {
            Text("Select a Habit")
        }
    }

    private func addHabit() {
        withAnimation {
            presentingNewHabit = true
        }
    }

    private func deleteHabits(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(habits[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Habit.self, inMemory: true)
}
