//
//  SettingsView.swift
//  ComputerSceinceTrivia
//
//  Created by Parth Patel on 2024-09-05.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var gameViewModel: GameViewModel
    
    var body: some View {
        
        ZStack {
            Color(.blue).opacity(0.8).grayscale(0.5)
                .ignoresSafeArea()
            VStack {
                DismissButton()
                    .offset(x: 150, y: 10)
                    .onTapGesture {
                        dismiss()
                    }
                
                Text("Difficulty Level")
                    .padding()
                    .foregroundStyle(.black)
                    .font(.system(size: 30, weight: .medium, design: .serif))
                    .frame(width: 330)
                
                VStack(spacing: 20) {
                    ForEach(Difficulty.allCases, id: \.self) { difficulty in
                        HStack {
                            Text(difficulty.rawValue.capitalized)
                            Spacer()
                            Image(systemName: gameViewModel.difficulty == difficulty ? "checkmark.circle" : "circle")
                        }
                        .onTapGesture {
                            gameViewModel.difficulty = difficulty
                            print("difficulty set to: \(difficulty.rawValue)")
                                dismiss()
                        }
                        if difficulty != Difficulty.allCases.last {
                            Divider()
                                .background(.black)
                        }
                    }
                }
                .font(.system(size: 20, weight: .medium, design: .serif))
                .frame(width: 300)
                .foregroundStyle(.black)
                .padding()
                .overlay {
                    Rectangle()
                        .fill(.clear)
                        .border(Color.black)
                }
            }
        }
    }
    
}

#Preview {
    SettingsView()
        .environmentObject(GameViewModel())
}
