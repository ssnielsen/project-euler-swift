//
//  main.swift
//  ProjectEuler
//
//  Created by Søren Nielsen on 29/12/2017.
//  Copyright © 2017 Sonderby Inc. All rights reserved.
//

import Foundation

let problem = Problem013()

let duration = measure {
    let result = problem.solve()
    print(result)
}

print("Executed in \(duration) s")
