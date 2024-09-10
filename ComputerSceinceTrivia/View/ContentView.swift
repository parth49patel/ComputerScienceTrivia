//
//  ContentView.swift
//  ComputerSceinceTrivia
//
//  Created by Parth Patel on 2024-08-14.
//

import SwiftUI

struct ContentView: View {
    
    @State private var infoView = false
    @State private var showGameView = false
    @State private var settingsView = false
    @State private var animate = false
    @StateObject var gameViewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            HomeBackgroundView()
            
            VStack {
                
                //MARK: Icon and Name
                VStack {
                    if animate{
                        VStack {
                            IconView()
                                .padding(.top, 125)
                            
                            Text("Computer Science Trivia")
                                .foregroundStyle(.white)
                                .font(.system(size: 30, weight: .light, design: .serif))
                                .padding(.top, 40)
                        }
                        .transition(.opacity)
                    }
                }
                .animation(.easeIn(duration: 2).delay(0.5), value: animate)
                
                //MARK: Buttons
                HStack(spacing: 70){
                    
                    // Info Button
                    VStack {
                        if animate {
                            Image(systemName: "info.circle.fill")
                                .foregroundStyle(.white)
                                .font(.system(size: 40))
                                .onTapGesture {
                                    infoView.toggle()
                                }
                                .transition(.move(edge: .leading).combined(with: .opacity))
                        }
                    }
                    .animation(.easeIn(duration: 2).delay(1), value: animate)
                    
                    // Play Button
                    VStack {
                        if animate {
                            Button {
                                showGameView.toggle()
                            } label: {
                                Text("Play")
                                    .font(.system(size: 30, weight: .light, design: .serif))
                                    .padding(10)
                                    .padding(.horizontal)
                                    .foregroundStyle(.white)
                                    .background(Color.blue.gradient)
                                    .clipShape(.rect(cornerRadius: 10))
                                
                            }
                            //.transition(.move(edge: .bottom).combined(with: .opacity))
                        }
                    }
                    .animation(.easeIn(duration: 2).delay(1), value: animate)
                    
                    // Settings Button
                    VStack {
                        if animate {
                            Image(systemName: "gear.circle.fill")
                                .foregroundStyle(.white)
                                .font(.system(size: 40))
                                .onTapGesture {
                                    settingsView.toggle()
                                }
                                .transition(.move(edge: .trailing).combined(with: .opacity))
                        }
                    }
                    .animation(.easeIn(duration: 2).delay(1), value: animate)
                }
                .padding(.top, 225)
            }
            .sheet(isPresented: $infoView) {
                InfoView()
                    .presentationDetents([.height(600)])
            }
            .fullScreenCover(isPresented: $showGameView) {
                GameView()
                    .environmentObject(gameViewModel)
            }
            .sheet(isPresented: $settingsView){
                SettingsView()
                    .environmentObject(gameViewModel)
                    .presentationDetents([.fraction(0.5)])
            }
        }
        .onAppear {
            animate.toggle()
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(GameViewModel())
}

