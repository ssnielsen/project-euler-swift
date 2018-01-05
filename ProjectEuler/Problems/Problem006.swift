//
//  Problem006.swift
//  ProjectEuler
//
//  Created by Søren Nielsen on 29/12/2017.
//  Copyright © 2017 Sonderby Inc. All rights reserved.
//

import Foundation

/*
 The sum of the squares of the first ten natural numbers is,
 1^2 + 2^2 + ... + 10^2 = 385

 The square of the sum of the first ten natural numbers is,
 (1 + 2 + ... + 10)^2 = 552 = 3025

 Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

 Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 */
struct Problem006: Problem {
    func solve() -> String {
        let numbers = 1...100
        let sumOfSquares = numbers.map { pow(Double($0), 2) |> Int.init }.sum()
        let squareOfSums = numbers.reduce(0, +).toThePower(of: 2)
        let result = squareOfSums - sumOfSquares

        return "\(result)"
    }
}
