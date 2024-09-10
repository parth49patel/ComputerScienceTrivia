//
//  GameViewModel.swift
//  ComputerSceinceTrivia
//
//  Created by Parth Patel on 2024-08-26.
//

import Foundation
 
enum Difficulty: String, CaseIterable, Equatable {
    case all = "All"
    case easy = "easy"
    case medium = "medium"
    case hard = "hard"
}
@MainActor
class GameViewModel: ObservableObject {
    @Published var difficulty: Difficulty = .all {
        didSet { filtered() }
    }
    @Published var filteredQuestions: [QuestionModel] = []
    @Published var question: [QuestionModel] = []
    @Published var currentQuestion = previewQuestion
    @Published var selectedAnswer: String?
    private var currentIndex: Int = 0
    init () {
        decodedQuestions()
    }
    static let previewQuestion = try! JSONDecoder().decode([QuestionModel].self, from: Data(contentsOf: Bundle.main.url(forResource: "Questions", withExtension: "json")!))[0]
    
    func filtered() {
        if difficulty == .all {
            filteredQuestions = question
        } else {
            filteredQuestions = question.filter { Difficulty(rawValue: $0.difficulty) == difficulty }
        }
        if let current = filteredQuestions.first {
            currentQuestion = current
        } else {
            currentQuestion = Self.previewQuestion // Handle empty questions after filtering
        }
    }
    func decodedQuestions() {
        if let url = Bundle.main.url(forResource: "Questions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                question = try JSONDecoder().decode([QuestionModel].self, from: data)
                filtered()
            } catch {
                print("Unable to decode questions: \(error)")
            }
        }
    }
    func selectAnswer(_ answer: String) {
        selectedAnswer = answer
        if isAnswerCorrect(answer) { // Check if the answer is correct
            moveToNextQuestion() // Move to the next question if available
        }
    }
    func isAnswerCorrect(_ answer: String) -> Bool {
        return currentQuestion.answers[answer] == true
    }
    private func moveToNextQuestion() {
        guard let currentIndex = filteredQuestions.firstIndex(where: { $0.id == currentQuestion.id }) else { return }
        let delay: TimeInterval = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            if currentIndex < self.filteredQuestions.count - 1 {
                self.currentQuestion = self.filteredQuestions[currentIndex + 1]
                self.selectedAnswer = nil
            } else {
                self.restartGame()
                print("End of Question")
            }
        }
    }
    func restartGame() {
        decodedQuestions()
        filtered()
        selectedAnswer = nil // Reset the selected answer
    }
}
