//
//  Goal+CoreDataProperties.swift
//  Track Anything
//
//  Created by Joe Buchoff on 12/5/21.
//
//

import Foundation
import CoreData


extension Goal
{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal>
    {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var goal: Double
    @NSManaged public var deadline: Date?
    @NSManaged public var timeframe: Int16
    @NSManaged public var typeOfGoalValue: Int16
    @NSManaged public var timeframeUnitsValue: Int16
    
    public var unwrappedDeadline: Date
    {
        return deadline!
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

extension Goal : Identifiable
{

}
