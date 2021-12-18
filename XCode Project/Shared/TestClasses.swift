//
//  TestClasses.swift
//  Track Anything
//
//  Created by Joe Buchoff on 12/15/21.
//

import Foundation

class TestCategory: Hashable
{
    static func == (lhs: TestCategory, rhs: TestCategory) -> Bool
    {
        return  lhs.unwrappedName == rhs.unwrappedName &&
                lhs.metricArray == rhs.metricArray &&
                lhs.exerciseArray == rhs.exerciseArray
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(unwrappedName)
    }
    
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

    public func addMetric(name: String, unit: String, measurements: [TestMeasurement] = [], goals: [TestGoal] = [])
    {
        metricArray.append(TestMetric(name: name, unit: unit))
    }

    public func addWeightExercise(name: String)
    {
        exerciseArray.append(TestWeightExercise(name: name))
    }
}

class TestMetric: Equatable
{
    static func == (lhs: TestMetric, rhs: TestMetric) -> Bool
    {
        return  lhs.unwrappedName == rhs.unwrappedName &&
                lhs.unwrappedUnit == rhs.unwrappedUnit &&
                lhs.logArray == rhs.logArray &&
                lhs.goalArray == rhs.goalArray
    }
    
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

    public func addLog(number: Double, date: Date)
    {
        logArray.append(TestMeasurement(number: number, date: date))
    }

    public func addGoal(goal: Double, deadline: Date, timeframe: Int16, type: TypeOfGoal, timeframeUnits: TimeframeUnits)
    {
        goalArray.append(TestGoal(goal: goal, deadline: deadline, timeframe: timeframe, type: type, timeframeUnits: timeframeUnits))
    }
    
}

class TestWeightExercise: Equatable
{
    static func == (lhs: TestWeightExercise, rhs: TestWeightExercise) -> Bool
    {
        return  lhs.unwrappedName == rhs.unwrappedName &&
                lhs.logArray == rhs.logArray &&
                lhs.goal == rhs.goal
    }
    
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
    
    public func addLog(lbs: Double, sets: Int16, reps: Int16, date: Date)
    {
        logArray.append(TestWeightExerciseEntry(lbs: lbs, sets: sets, reps: reps, date: date))
    }

    public func addGoal(lbsGoal: Double, setsGoal: Int16, repsGoal: Int16, deadline: Date, timeframe: Int16, timeframeUnits: TimeframeUnits)
    {
        goal = TestWeightExerciseGoal(lbsGoal: lbsGoal, setsGoal: setsGoal, repsGoal: repsGoal, deadline: deadline, timeframe: timeframe, timeframeUnits: timeframeUnits)
    }
    
    public var unwrappedGoal: TestWeightExerciseGoal
    {
        return goal!
    }
    
}

class TestMeasurement: Equatable
{
    
    public var number: Double
    public var unwrappedDate: Date
    
    static func == (lhs: TestMeasurement, rhs: TestMeasurement) -> Bool
    {
        return  lhs.number == rhs.number &&
                lhs.unwrappedDate == rhs.unwrappedDate
    }
    
    init(number: Double, date: Date)
    {
        self.number = number
        self.unwrappedDate = date
        
        return
    }
}

class TestWeightExerciseEntry: Equatable
{
    
    static func == (lhs: TestWeightExerciseEntry, rhs: TestWeightExerciseEntry) -> Bool
    {
        return  lhs.lbs == rhs.lbs &&
                lhs.sets == rhs.sets &&
                lhs.reps == rhs.reps &&
                lhs.unwrappedDate == rhs.unwrappedDate
    }
    
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

class TestGoal: Equatable
{
    static func == (lhs: TestGoal, rhs: TestGoal) -> Bool
    {
        return  lhs.goal == rhs.goal &&
                lhs.unwrappedDeadline == rhs.unwrappedDeadline &&
                lhs.timeframe == rhs.timeframe &&
                lhs.typeOfGoalValue == rhs.typeOfGoalValue &&
                lhs.timeframeUnitsValue == rhs.timeframeUnitsValue
    }
    
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

class TestWeightExerciseGoal: Equatable
{
    static func == (lhs: TestWeightExerciseGoal, rhs: TestWeightExerciseGoal) -> Bool
    {
        return  lhs.lbsGoal == rhs.lbsGoal &&
                lhs.setsGoal == rhs.setsGoal &&
                lhs.repsGoal == rhs.repsGoal &&
                lhs.unwrappedDeadline == rhs.unwrappedDeadline &&
                lhs.timeframe == rhs.timeframe &&
                lhs.timeframeUnitsValue == rhs.timeframeUnitsValue
    }
    
    public var lbsGoal: Double
    public var setsGoal: Int16
    public var repsGoal: Int16
    public var unwrappedDeadline: Date
    public var timeframe: Int16
    public var timeframeUnitsValue: Int16 = 0
    
    init(lbsGoal: Double, setsGoal: Int16, repsGoal: Int16, deadline: Date, timeframe: Int16, timeframeUnits: TimeframeUnits)
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
