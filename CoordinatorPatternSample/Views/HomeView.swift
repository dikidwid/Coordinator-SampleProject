//
//  HomeView.swift
//  CoordinatorPatternSample
//
//  Created by Diki Dwi Diro on 27/07/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appCoordinator: AppCoordinatorImpl
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image(systemName: "house")
                .foregroundStyle(.tint)
                .imageScale(.large)
            
            Text("Home")
            
            Spacer()
            
            Button("Go to Habit List") {
                appCoordinator.push(.listHabit)
            }
        }
        .navigationTitle("Home")
        
    }
}

#Preview {
    HomeView()
}
