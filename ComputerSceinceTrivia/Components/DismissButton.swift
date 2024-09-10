//
//  DismissButton.swift
//  ComputerSceinceTrivia
//
//  Created by Parth Patel on 2024-08-15.
//

import SwiftUI

struct DismissButton: View {
    var body: some View {
        VStack {
            Circle()
                .fill(Color.black.opacity(0.75))
                .frame(width: 30)
                .overlay {
                    Text("X")
                        .foregroundStyle(.white)
                        .bold()
                }
        }
    }
}

#Preview {
    DismissButton()
}
