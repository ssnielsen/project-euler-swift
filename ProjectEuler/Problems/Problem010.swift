//
//  Problem010.swift
//  ProjectEuler
//
//  Created by Søren Nielsen on 30/12/2017.
//  Copyright © 2017 Sonderby Inc. All rights reserved.
//

import Foundation

/*
 The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

 Find the sum of all the primes below two million.
 */
struct Problem010: Problem {
    func solve() -> String {
        let max = 2_000_000

        var l = Array(repeating: true, count: max + 1)
        l[0] = false
        l[1] = false

        for n in 2..<(Int(pow(Double(max), 0.5))) where l[n] == true {
            for i in stride(from: n*n, to: max, by: n) {
                l[i] = false
            }
        }

        let primes = l.dropLast().enumerated().filter { $0.element }.map { $0.offset }
        let result = primes.reduce(0, +)

        return "\(result)"
    }
}
