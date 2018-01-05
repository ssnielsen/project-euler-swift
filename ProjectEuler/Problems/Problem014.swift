//
//  Problem014.swift
//  ProjectEuler
//
//  Created by Søren Nielsen on 05/01/2018.
//  Copyright © 2018 Sonderby Inc. All rights reserved.
//

import Foundation

/*
 The following iterative sequence is defined for the set of positive integers:

 n → n/2 (n is even)
 n → 3n + 1 (n is odd)

 Using the rule above and starting with 13, we generate the following sequence:

 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

 Which starting number, under one million, produces the longest chain?

 NOTE: Once the chain starts the terms are allowed to go above one million.
 */

class Problem014: Problem {
    var cache = [Int: Int]() // From "starting number" to length of chain.

    func solve() -> String {
        let lengths = (1...1_000_000).map { (n: Int) -> (Int, Int) in
            let collatzSequence = computeCollatzSequence(from: [n])
            self.cache[n] = collatzSequence.count
            return (n, collatzSequence.count)
        }

        let longest = lengths.max { $0.1 < $1.1 }!

        return "\(longest)"
    }

    private func computeCollatzSequence(from currentSequence: [Int]) -> [Int] {
        let last = currentSequence.last!

        if last == 1 {
            return currentSequence
        }

        if let cachedCount = cache[last] {
            return currentSequence + Array.init(repeating: 1, count: cachedCount)
        }

        let next: Int = {
            switch last % 2 == 0 {
            case true:
                return last / 2
            case false:
                return 3 * last + 1
            }
        }()

        return computeCollatzSequence(from: currentSequence + [next])
    }
}
