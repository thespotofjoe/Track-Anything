//
//  Enums.swift
//  Track Anything
//
//  Created by Joe Buchoff on 12/5/21.
//

import Foundation

enum TypeOfGoal: Int16
{
    case lessThanOrEqualTo = 0
    case lessThan = 1
    case greaterThanOrEqualTo = 2
    case greaterThan = 3
    case exactlyEqualTo = 4
}

enum TimeframeUnits: Int16
{
    case measurements = 0
    case days = 1
}

enum WeightExerciseComponent: Int16
{
    case reps = 0
    case sets = 1
    case lbs = 2
}
