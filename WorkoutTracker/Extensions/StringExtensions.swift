//
//  StringExtensions.swift
//  WorkoutTracker
//
//  Created by Sergio Gomes on 10/29/23.
//

import Foundation

extension String {
    var pascalCase: String {
        return self.components(separatedBy: " ")
            .map {
                if $0.count <= 3 {
                    return $0.uppercased()
                } else {
                    if $0.firstIndex(of: "-") != nil {
                        return $0.components(separatedBy: "-").map { $0.pascalCase }.joined(separator: "-")
                    } else {
                        return $0.capitalized
                    }
                }
            }
            .joined(separator: " ")
    }
}
