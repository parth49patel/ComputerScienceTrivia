//
//  GameButtons.swift
//  ComputerSceinceTrivia
//
//  Created by Parth Patel on 2024-08-29.
//

import SwiftUI

struct GameButtons: View {
    
    @State var buttonText: String
    @State var backgroundColor: Color
    @State var textColor: Color
    
    var body: some View {
        VStack {
            Text(buttonText)
                .foregroundStyle(textColor)
                .font(.system(size: 20, weight: .medium, design: .serif))
                .frame(width: 100)
                .padding(10)
                .background(backgroundColor)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}

#Preview {
    GameButtons(buttonText: "End Game", backgroundColor: .red, textColor: .white)
        .preferredColorScheme(.dark)
}
