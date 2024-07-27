//
//  ListHabitView.swift
//  CoordinatorPatternSample
//
//  Created by Diki Dwi Diro on 27/07/24.
//

import SwiftUI

struct ListHabitView: View {
    @State private var habits: [Habit] = Habit.habitsDummy
    @EnvironmentObject private var appCoordinator: AppCoordinatorImpl
    
    var body: some View {
        List {
            ForEach(habits) { habit in
                Button {
                    appCoordinator.push(.detailHabit(named: habit))
                } label: {
                    HStack {
                        Text(habit.title)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.secondary)
                    }
                }
                .tint(.primary)
            }
        }
        .navigationTitle("Habit List")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("", systemImage: "plus") {
                    appCoordinator.presentFullScreenCover(.addHabit(onSaveButtonTap: addNewHabit(_:)))
                }
            }
        }
    }
    
    private func addNewHabit(_ habit: Habit) {
        habits.append(habit)
    }
}

#Preview {
    ListHabitView()
}
