//
//  Exercise.swift
//  WorkoutTracker
//
//  Created by Sergio Gomes on 10/24/23.
//

import Foundation

struct Exercise: Codable, Hashable {
    var bodyPart: String
    var name: String
    var gifUrl: String
}
