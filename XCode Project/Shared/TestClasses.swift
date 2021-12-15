//
//  TestClasses.swift
//  Track Anything
//
//  Created by Joe Buchoff on 12/15/21.
//

import Foundation

class TestCategory
{
    public var unwrappedName: String
    public var metricArray: [TestMetric] = []
    public var exerciseArray: [TestWeightExercise] = []

    init(name: String, metrics: [TestMetric] = [], exercises: [TestWeightExercise] = [])
    {
        self.unwrappedName = name
        self.metricArray = metrics
        self.exerciseArray = exercises
        return
    }

    public func addMetric(_ metric: Metric? = nil, metrics: [Metric] = [])
    {
        
    }

    public func addWeightExercise(_ exercise: WeightExercise? = nil, exercises: [WeightExercise] = [])
    {

    }
}

class TestMetric
{
    public var unwrappedName: String
    public var unwrappedUnit: String
    public var logArray: [TestMeasurement] = []
    public var goalArray: [TestGoal] = []
    
    init(name: String, unit: String, measurements: [TestMeasurement] = [], goals: [TestGoal] = [])
    {
        self.unwrappedName = name
        self.unwrappedUnit = unit
        self.logArray = measurements
        self.goalArray = goals
        return
    }

    public func addMeasurement(_ measurement: TestMeasurement? = nil, measurements: [TestMeasurement] = [])
    {
        
    }

    public func addGoal(_ goal: Goal? = nil, goals: [TestGoal] = [])
    {

    }
    
}

class TestWeightExercise
{
    public var unwrappedName: String
    public var logArray: [TestWeightExerciseEntry] = []
    public var goal: TestWeightExerciseGoal?
    
    init(name: String, entries: [TestWeightExerciseEntry] = [], goal: TestWeightExerciseGoal? = nil)
    {
        self.unwrappedName = name
        self.logArray = entries
        self.goal = goal
        return
    }

    public func addMeasurement(_ measurement: TestMeasurement? = nil, measurements: [TestMeasurement] = [])
    {
        
    }

    public func addGoal(_ goal: Goal? = nil, goals: [Goal] = [])
    {

    }
    
    public var unwrappedGoal: TestWeightExerciseGoal
    {
        return goal!
    }
    
}

class TestMeasurement
{
    public var number: Double
    public var unwrappedDate: Date
    
    init(number: Double, date: Date)
    {
        self.number = number
        self.unwrappedDate = date
        
        return
    }
}

class TestWeightExerciseEntry
{
    public var lbs: Double
    public var sets: Int16
    public var reps: Int16
    public var unwrappedDate: Date

    init(lbs: Double, sets: Int16, reps: Int16, date: Date)
    {
        self.lbs = lbs
        self.sets = sets
        self.reps = reps
        self.unwrappedDate = date
        
        return
    }
}

class TestGoal
{
    public var goal: Double
    public var unwrappedDeadline: Date
    public var timeframe: Int16
    public var typeOfGoalValue: Int16
    public var timeframeUnitsValue: Int16 = 0
    
    init(goal: Double, deadline: Date, timeframe: Int16, type: TypeOfGoal, timeframeUnits: TimeframeUnits)
    {
        self.goal = goal
        self.unwrappedDeadline = deadline
        self.timeframe = timeframe
        self.typeOfGoalValue = type.rawValue
        self.timeframeUnits = timeframeUnits
        
        return
    }
    
    var typeOfGoal: TypeOfGoal {
        get {
            return TypeOfGoal(rawValue: self.typeOfGoalValue)!
        }

        set {
            self.typeOfGoalValue = newValue.rawValue
        }
    }
    
    var timeframeUnits: TimeframeUnits {
        get {
            return TimeframeUnits(rawValue: self.timeframeUnitsValue)!
        }

        set {
            self.timeframeUnitsValue = newValue.rawValue
        }
    }
}

class TestWeightExerciseGoal
{
    public var lbsGoal: Int16
    public var setsGoal: Int16
    public var repsGoal: Int16
    public var unwrappedDeadline: Date
    public var timeframe: Int16
    public var timeframeUnitsValue: Int16 = 0
    
    init(lbsGoal: Int16, setsGoal: Int16, repsGoal: Int16, deadline: Date, timeframe: Int16, timeframeUnits: TimeframeUnits)
    {
        self.lbsGoal = lbsGoal
        self.setsGoal = setsGoal
        self.repsGoal = repsGoal
        self.unwrappedDeadline = deadline
        self.timeframe = timeframe
        self.timeframeUnits = timeframeUnits
        
        return
    }
    
    var timeframeUnits: TimeframeUnits {
        get {
            return TimeframeUnits(rawValue: self.timeframeUnitsValue)!
        }

        set {
            self.timeframeUnitsValue = newValue.rawValue
        }
    }
}
