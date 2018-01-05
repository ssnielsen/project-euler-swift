//
//  Shared.swift
//  ProjectEuler
//
//  Created by Søren Nielsen on 29/12/2017.
//  Copyright © 2017 Sonderby Inc. All rights reserved.
//

import Foundation

protocol Problem {
    func solve() -> String
}

func measure(_ f: () -> Void) -> Double {
    let before = Date().timeIntervalSince1970
    f()
    return Date().timeIntervalSince1970 - before
}

infix operator |> : MultiplicationPrecedence

func |> <A, B>(a: A, b: (A) -> B) -> B {
    return b(a)
}

infix operator |!> : MultiplicationPrecedence

func |!> <A, B>(a: A, b: (A) -> B?) -> B {
    return b(a)!
}

func reduce<T, U>(_ initialResult: U, _ f: @escaping (U, T) -> U) -> ([T]) -> U {
    return { array in
        return array.reduce(initialResult, f)
    }
}

func map<T, U>(_ f: @escaping (T) -> U) -> ([T]) -> [U] {
    return { array in
        return array.map(f)
    }
}

func filter<T>(_ f: @escaping (T) -> Bool) -> ([T]) -> [T] {
    return { array in
        return array.filter(f)
    }
}

extension Array where Element == Int {
    func sum() -> Int {
        return self |> ProjectEuler.reduce(0) { $0 + $1}
    }
}

extension Sequence {
    func all(_ f: (Element) -> Bool) -> Bool {
        for e in self {
            if !f(e) {
                return false
            }
        }

        return true
    }
}

extension Int {
    func toThePower(of raisedTo: Int) -> Int {
        return Int(pow(Double(self), Double(raisedTo)))
    }
}

func isPrime(_ n: Int) -> Bool {
    struct Cache {
        static var cache = [Int]()
    }

    if Cache.cache.contains(n) {
        return true
    }

    let max = Int(pow(Double(n), 0.5) + 1)
    let prime = stride(from: 3, to: max, by: 2).first { n % $0 == 0 } == nil

    if prime {
        Cache.cache.append(n)
        return true
    } else {
        return false
    }
}

func isPalindrome(_ n: String) -> Bool {
    return n == String(n.reversed())
}

extension String {
    func nonEmptyLines() -> [String] {
        return self.components(separatedBy: .newlines).filter { !$0.isEmpty }
    }
}
