//
//  Problem020.swift
//  ProjectEuler
//
//  Created by Søren Nielsen on 30/12/2017.
//  Copyright © 2017 Sonderby Inc. All rights reserved.
//

import Foundation

/*
 n! means n × (n − 1) × ... × 3 × 2 × 1

 For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
 and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

 Find the sum of the digits in the number 100!
 */
struct Problem020: Problem {
    func solve() -> String {
        let from = BigInt(1)
        let to = BigInt(100)

        var fac100 = from
        var n = from

        while n <= to {
            fac100 = fac100.multipliedBy(factor: n.intValue)
            n = n.addedTo(other: BigInt(1))
        }

        let result = fac100.description.map { Int(String($0))! }.reduce(0, +)

        return "\(result)"
    }
}
