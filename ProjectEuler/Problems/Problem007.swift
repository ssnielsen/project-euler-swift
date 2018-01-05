//
//  Problem007.swift
//  ProjectEuler
//
//  Created by Søren Nielsen on 30/12/2017.
//  Copyright © 2017 Sonderby Inc. All rights reserved.
//

import Foundation

/*
 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

 What is the 10 001st prime number?
 */
struct Problem007: Problem {
    func solve() -> String {
        let primeSequence = sequence(first: 2) { candidate -> Int? in
            let from = candidate == 2 ? candidate+1 : candidate+2
            return (from...).first(where: isPrime)
        }

        let result = primeSequence.dropFirst(10000).first { _ in true }!

        return "\(result)"
    }
}
