//
//  Problem009.swift
//  ProjectEuler
//
//  Created by Søren Nielsen on 30/12/2017.
//  Copyright © 2017 Sonderby Inc. All rights reserved.
//

import Foundation

/*
 A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

 a^2 + b^2 = c^2
 For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

 There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 Find the product abc.
 */
struct Problem009: Problem {
    func solve() -> String {
        let from = 1
        let to = 997

        let tuples = sequence(first: (a: from, b: from, c: from)) { (a, b, c) in
            switch (a, b, c) {
            case (to, to, to):
                return nil
            case (let a, let b, to):
                return (a, b+1, from)
            case (let a, to, _):
                return (a+1, from, from)
            case let (a, b, c):
                return (a, b, c+1)
            }
        }

        let triplet = tuples.first { (a: Int, b: Int, c: Int) -> Bool in
            a < b  && b < c && a + b + c == 1000 && a.toThePower(of: 2) + b.toThePower(of: 2) == c.toThePower(of: 2)
        }!

        let result = triplet.0 * triplet.1 * triplet.2

        return "\(result)"
    }
}
