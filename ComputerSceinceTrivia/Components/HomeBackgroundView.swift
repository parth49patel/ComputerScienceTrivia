//
//  IconView.swift
//  ComputerSceinceTrivia
//
//  Created by Parth Patel on 2024-08-15.
//

import SwiftUI

struct HomeBackgroundView: View {
    var body: some View {
        Image("home")
            .resizable()
            .scaledToFill()
            .overlay {
                Color.black.opacity(0.8)
            }
            .ignoresSafeArea()
    }
}


#Preview {
    HomeBackgroundView()
}
