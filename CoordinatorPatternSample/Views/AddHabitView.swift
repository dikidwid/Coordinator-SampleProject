//
//  AddHabitView.swift
//  CoordinatorPatternSample
//
//  Created by Diki Dwi Diro on 27/07/24.
//

import SwiftUI

struct AddHabitView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinatorImpl
    
    @State private var habitTitle: String = ""
    @State private var habitTasks: [Task] = []
    @State private var newTaskTitle: String = ""
    @State private var newTaskDescription: String = ""
    
    let onSaveButtonTap: ((Habit) -> Void?)
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Habit Details")) {
                    TextField("Habit Name", text: $habitTitle)
                        .autocorrectionDisabled()
                }
                
                if !habitTasks.isEmpty {
                    Section(header: Text("Tasks")) {
                        ForEach(habitTasks) { task in
                            VStack(alignment: .leading) {
                                Text(task.title)
                                    .font(.headline)
                                Text(task.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onDelete(perform: deleteTask)
                    }
                }
                
                Section(header: Text("Add task")) {
                    TextField("Task Name", text: $newTaskTitle)
                        .autocorrectionDisabled()
                
                    TextField("Description", text: $newTaskDescription)
                        .autocorrectionDisabled()

                    Button("Add New Task", systemImage: "plus") {
                        addTask()
                    }
                    .disabled(newTaskTitle.isEmpty || newTaskDescription.isEmpty)
                    .foregroundStyle(newTaskTitle.isEmpty && newTaskDescription.isEmpty ? Color.secondary : Color.accentColor)
                }
            }
            .navigationTitle("Add Habit")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        appCoordinator.dismissFullScreenOver()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: saveHabit) {
                        Text("Save Habit")
                    }
                    .disabled(habitTitle.isEmpty || habitTasks.isEmpty)
                }
            }
        }
    }
    
    private func addTask() {
        let newTask = Task(
            title: newTaskTitle,
            description: newTaskDescription
        )
        habitTasks.append(newTask)
        newTaskTitle = ""
        newTaskDescription = ""
    }
    
    private func deleteTask(at offsets: IndexSet) {
        habitTasks.remove(atOffsets: offsets)
    }
    
    private func saveHabit() {
        let newHabit = Habit(title: habitTitle, tasks: habitTasks)
        onSaveButtonTap(newHabit)
        appCoordinator.dismissFullScreenOver()
    }
}

#Preview {
    AddHabitView(onSaveButtonTap: {_ in})
}
