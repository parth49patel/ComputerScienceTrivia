//
//  IconView.swift
//  ComputerSceinceTrivia
//
//  Created by Parth Patel on 2024-08-15.
//

import SwiftUI

struct IconView: View {
    var body: some View {
        Image("icon")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .padding()
            .background(
                Color.gray.gradient
            )
            .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    IconView()
}
