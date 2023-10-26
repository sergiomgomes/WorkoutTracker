//
//  ErrorMessages.swift
//  WorkoutTracker
//
//  Created by Sergio Gomes on 10/26/23.
//

import Foundation

enum WTError: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case invalidParams = "Invalid parameters."
}
