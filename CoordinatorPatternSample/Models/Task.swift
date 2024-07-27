//
//  Task.swift
//  CoordinatorPatternSample
//
//  Created by Diki Dwi Diro on 27/07/24.
//

import Foundation

struct Task: Identifiable, Hashable, Equatable {
    let id = UUID()
    let title: String
    let description: String
}
