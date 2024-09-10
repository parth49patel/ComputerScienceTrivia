//
//  GameBackgroundView.swift
//  ComputerSceinceTrivia
//
//  Created by Parth Patel on 2024-08-26.
//

import SwiftUI

struct GameBackgroundView: View {
    var body: some View {
        Image("game")
            .resizable()
            .scaledToFill()
            .overlay {
                Color.black.opacity(0.5)
            }
            .ignoresSafeArea()
    }
}

#Preview {
    GameBackgroundView()
}
