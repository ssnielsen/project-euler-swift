//
//  Problem004.swift
//  ProjectEuler
//
//  Created by Søren Nielsen on 29/12/2017.
//  Copyright © 2017 Sonderby Inc. All rights reserved.
//

import Foundation

/*
 A palindromic number reads the same both ways.
 The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

 Find the largest palindrome made from the product of two 3-digit numbers.
 */
struct Problem004: Problem {
    func solve() -> String {
        let threeDigitNumbers = 100..<999
        let pairs = threeDigitNumbers.map { first in
            threeDigitNumbers.map { second in
                (first, second)
            }
        }.joined()

        let result = pairs
            .map { $0.0 * $0.1 }
            .filter { $0 |> String.init |> isPalindrome }
            .max()!

        return "\(result)"
    }
}
