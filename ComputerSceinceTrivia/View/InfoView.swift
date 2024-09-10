//
//  InfoView.swift
//  ComputerSceinceTrivia
//
//  Created by Parth Patel on 2024-08-15.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(.blue).opacity(0.8).grayscale(0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                DismissButton()
                    .offset(x: 150, y: -15)
                    .onTapGesture {
                        dismiss()
                    }
                
                IconView()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("A simple trivia game with multiple choice question.")
                    Text("Choose the correct answer from the choice and get 4 points.")
                    Text("Choosing incorrect answer each time will cost you 1 point.")
                }
                .padding()
                .font(.system(size: 20, weight: .light, design: .serif))
                .foregroundStyle(.black)
                
                Text("Good Luck!")
                    .foregroundStyle(.black)
                    .font(.system(size: 30, weight: .light, design: .serif))
                    .padding(.top, 30)
            }
            .frame(width: 400)
        }
    }
}

#Preview {
    InfoView()
}
