//
//  Problem001.swift
//  ProjectEuler
//
//  Created by Søren Nielsen on 29/12/2017.
//  Copyright © 2017 Sonderby Inc. All rights reserved.
//

import Foundation

/// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
/// The sum of these multiples is 23.
/// Find the sum of all the multiples of 3 or 5 below 1000.
struct Problem001: Problem {
    func solve() -> String {
        let result = (0..<1000)
            .filter { $0 % 3 == 0 || $0 % 5 == 0 }
            .sum()

        return "\(result)"
    }
}
