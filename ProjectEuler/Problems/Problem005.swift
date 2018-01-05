//
//  Problem005.swift
//  ProjectEuler
//
//  Created by Søren Nielsen on 29/12/2017.
//  Copyright © 2017 Sonderby Inc. All rights reserved.
//

import Foundation

/*
 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

 What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
 */
struct Problem005: Problem {
    func solve() -> String {
        let result = sequence(first: 20, next: { $0 + 20 }).first { n in
            (2...20).all { n % $0 == 0 }
        }

        return "\(result!)"
    }
}
