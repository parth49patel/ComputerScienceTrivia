//
//  QuestionModel.swift
//  ComputerSceinceTrivia
//
//  Created by Parth Patel on 2024-08-15.
//

import Foundation

struct QuestionModel: Codable, Hashable, Identifiable {
    var id = UUID().uuidString
    let question: String
    let difficulty: String
    let category: String?
    var answers: [String: Bool] = [:]
    
    var filteredDifficulty: Difficulty? {
        return Difficulty(rawValue: difficulty)
    }
    
    // Defines an enumeration to map the JSON keys to the properties of the struct. This is used to facilitate encoding and decoding.
    enum CodingKeys: String, CodingKey {
        case id
        case question
        case correct_answer
        case incorrect_answers
        case difficulty
        case category
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID().uuidString
        self.question = try container.decode(String.self, forKey: .question)
        self.difficulty = try container.decode(String.self, forKey: .difficulty)
        self.category = try container.decodeIfPresent(String.self, forKey: .category)
        
        // Decodes the correct answer from the JSON and assigns it to correctAnswer.
        let correctAnswer = try container.decode(String.self, forKey: .correct_answer)
        // Sets the correct answer in the answers dictionary with a value of true.
        answers[correctAnswer] = true
        // Decodes the list of incorrect answers from the JSON.
        let wrongAnswers = try container.decode([String].self, forKey: .incorrect_answers)
        // Iterates through the incorrect answers and adds them to the answers dictionary with a value of false.
        for answer in wrongAnswers {
            answers[answer] = false
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(question, forKey: .question)
      
        // Finds the correct answer (the first one with a true value) and encodes it. It assumes there is only one correct answer.
        if let correctAnswer = answers.first(where: { $0.value })?.key {
            // Encodes the correct answer under the correct_answer key.
            try container.encode(correctAnswer, forKey: .correct_answer)
        }
        // Filters the answers dictionary to get only the incorrect answers (those with a false value) and maps them to an array of strings.
        let incorrectAnswers = answers.filter { !$0.value }.map { $0.key }
        // Encodes the array of incorrect answers under the incorrect_answers key.
        try container.encode(incorrectAnswers, forKey: .incorrect_answers)
    }
}
