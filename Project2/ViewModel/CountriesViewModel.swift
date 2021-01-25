//
//  CountriesViewModel.swift
//  Project2
//
//  Created by Guilherme Moraes on 24/01/21.
//

import Foundation
import UIKit


struct CountriesViewModel {
    
    var name = Countries().countries
    
    var title: String
    
    var score: Int
    
    var totalTentatives:Int
    
    var correctAnswer: Int
    
    func getCountriesName() -> [String] {
        return name.shuffled()
    }
    
    mutating func getCorrectAnswer(senderValue: Int) {
        if senderValue == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, that's flag from \(name[senderValue])"
            score -= 1
        }
        totalTentatives += 1
    }
    
    mutating func getCorrectAnswerPath() -> Int {
        correctAnswer = Int.random(in: 0...2)
        return correctAnswer
    }
    

    mutating func getTotalTentatives() -> Int {
        return totalTentatives
    }
   
    
    
}

