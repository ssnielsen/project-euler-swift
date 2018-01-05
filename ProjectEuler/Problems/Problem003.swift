//
//  Problem003.swift
//  ProjectEuler
//
//  Created by Søren Nielsen on 29/12/2017.
//  Copyright © 2017 Sonderby Inc. All rights reserved.
//

import Foundation

/*
 The prime factors of 13195 are 5, 7, 13 and 29.

 What is the largest prime factor of the number 600851475143 ?
 */
struct Problem003: Problem {
    func solve() -> String {
        let n = 600_851_475_143
        let max = Int(ceil(sqrt(Double(n))))
        let factors = (2...max).filter { n % $0 == 0 && isPrime($0) }
        let largest = factors.max()!

        return "\(largest)"
    }
}
