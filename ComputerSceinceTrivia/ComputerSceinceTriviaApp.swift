//
//  ComputerSceinceTriviaApp.swift
//  ComputerSceinceTrivia
//
//  Created by Parth Patel on 2024-08-14.
//

import SwiftUI

@main
struct ComputerSceinceTriviaApp: App {
    
    @StateObject var gameViewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameViewModel)
                .preferredColorScheme(.dark)
        }
    }
}
