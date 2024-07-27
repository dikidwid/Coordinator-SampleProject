//
//  CoordinatorView.swift
//  CoordinatorPatternSample
//
//  Created by Diki Dwi Diro on 26/07/24.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject var appCoordinator: AppCoordinatorImpl = AppCoordinatorImpl()
    
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.build(.home)
                .navigationDestination(for: Screen.self) { screen in
                    appCoordinator.build(screen)
                }
                .sheet(item: $appCoordinator.sheet) { sheet in
                    appCoordinator.build(sheet)
                }
                .fullScreenCover(item: $appCoordinator.fullScreenCover) { fullScreenCover in
                    appCoordinator.build(fullScreenCover)
                }
        }
        .environmentObject(appCoordinator)
    }
}

#Preview {
    CoordinatorView()
}
