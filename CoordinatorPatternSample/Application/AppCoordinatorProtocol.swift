//
//  AppCoordinatorProtocol.swift
//  CoordinatorPatternSample
//
//  Created by Diki Dwi Diro on 26/07/24.
//

import SwiftUI

protocol AppCoordinatorProtocol: ObservableObject {
    var path: NavigationPath { get set }
    var sheet: Sheet? { get set }
    var fullScreenCover: FullScreenCover? { get set }
    func push(_ screen:  Screen)
    func presentSheet(_ sheet: Sheet)
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover)
    func pop()
    func popToRoot()
    func dismissSheet()
    func dismissFullScreenOver()
}

enum Screen: Identifiable, Hashable {
    case home
    case listHabit
    case detailHabit(named: Habit)
    
    var id: Self { return self }
}

enum Sheet: Identifiable, Hashable {
    case detailTask(named: Task)
    
    var id: Self { return self }
}

enum FullScreenCover: Identifiable, Hashable {
    case addHabit(onSaveButtonTap: ((Habit) -> Void))

    var id: Self { return self }
}

extension FullScreenCover {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .addHabit:
            hasher.combine("addHabit")
        }
    }
    
    // Conform to Equatable
    static func == (lhs: FullScreenCover, rhs: FullScreenCover) -> Bool {
        switch (lhs, rhs) {
        case (.addHabit, .addHabit):
            return true
        }
    }
}
