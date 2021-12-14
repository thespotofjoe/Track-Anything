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

enum Screen: Int16
{
    case homeScreen                         = 0
    case allCategoriesScreen                = 1
    case newCategoryScreen                  = 2
    case oneCategoryScreen                  = 3
    case newMetricScreen                    = 4
    case whatUnitsScreen                    = 5
    case recordMeasurementScreen            = 6
    case recordWeightExerciseEntryScreen    = 7
}
