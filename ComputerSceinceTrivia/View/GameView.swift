//
//  GameView.swift
//  ComputerSceinceTrivia
//
//  Created by Parth Patel on 2024-08-15.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    @Environment(\.dismiss) var dismiss
    @State var animate = false
    
    var body: some View {
        ZStack {
            GameBackgroundView()
            VStack {
                //MARK: Buttons to end and restart game
                HStack(spacing: 130) {
                    VStack {
                        if animate {
                            Button {
                                dismiss()
                            } label: {
                                GameButtons(buttonText: "End Game", backgroundColor: .red, textColor: .white)
                            }
                            .transition(.push(from: .leading))
                        }
                    }
                    .animation(.easeIn(duration: 2).delay(1), value: animate)
                    
                    VStack {
                        if animate {
                            Button {
                                // Restart the game
                                gameViewModel.restartGame()
                            } label: {
                                GameButtons(buttonText: "Restart", backgroundColor: .green, textColor: .white)
                            }
                            .transition(.push(from: .trailing))
                        }
                    }
                    .animation(.easeIn(duration: 2).delay(1), value: animate)
                }
                Spacer()
                //MARK: Questions
                VStack {
                    if animate {
                        VStack{
                            Text(gameViewModel.currentQuestion.question)
                                .foregroundStyle(.white)
                                .font(.system(size: 25, weight: .medium, design: .serif))
                        }
                        .frame(width: 360)
                        .padding([.top, .bottom], 10)
                        .padding(.horizontal, 5)
                        .background(
                            Color.black.gradient
                        )
                        .clipShape(.rect(cornerRadius: 10))
                    }
                }
                .animation(.easeIn(duration: 2).delay(1), value: animate)
                .padding(.bottom, 100)
                
                //MARK: Multiple Choice Options
                VStack {
                    if animate {
                        VStack {
                            LazyVGrid(columns: [GridItem(), GridItem()]) {
                                ForEach(gameViewModel.currentQuestion.answers.keys.sorted(), id: \.self) { answer in
                                    Button{
                                        gameViewModel.selectAnswer(answer)
                                    } label: {
                                        Text(answer)
                                            .foregroundStyle(.black)
                                            .frame(width: 130)
                                            .padding()
                                            .font(.system(size: 20, weight: .medium, design: .serif))
                                            .background(
                                                gameViewModel.selectedAnswer == answer ? (gameViewModel.isAnswerCorrect(answer) ? Color.green : Color.red) : Color(.lightGray)
                                            )
                                            .clipShape(.rect(cornerRadius: 10))
                                    }
                                    .padding()
                                }
                            }
                            .frame(width: 350)
                        }
                    }
                }
                .padding(.bottom, 150)
            }
            .animation(.easeIn(duration: 3).delay(1), value: animate)
        }
        .onAppear {
            animate.toggle()
            gameViewModel.filtered()
        }
    }
}

#Preview {
    GameView()
        .environmentObject(GameViewModel())
}
