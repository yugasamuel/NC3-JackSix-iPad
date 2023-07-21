//
//  NC3_Jacksix_iPadApp.swift
//  NC3-Jacksix-iPad
//
//  Created by Jason Leonardo on 20/07/23.
//

import SwiftUI

@main
struct NC3_Jacksix_iPadApp: App {
    @StateObject var navigationManager = NavigationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navigationManager)
        }
    }
}
