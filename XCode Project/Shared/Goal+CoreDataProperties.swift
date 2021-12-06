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

    @NSManaged public var deadline: Date?
    @NSManaged public var timeframe: Int16
    @NSManaged public var typeOfGoalValue: Int16
    @NSManaged public var timeframeUnitsValue: Int16
    
    public var unwrappedDeadline: Date
    {
        return deadline!
    }
    
    var typeOfGoal: TypeOfGoal {
        // To get a State enum from stateValue, initialize the
        // State type from the Int32 value stateValue
        get {
            return TypeOfGoal(rawValue: self.typeOfGoalValue)!
        }

        // newValue will be of type State, thus rawValue will
        // be an Int32 value that can be saved in Core Data
        set {
            self.typeOfGoalValue = newValue.rawValue
        }
    }
    
    var timeframeUnits: TimeframeUnits {
        // To get a State enum from stateValue, initialize the
        // State type from the Int32 value stateValue
        get {
            return TimeframeUnits(rawValue: self.timeframeUnitsValue)!
        }

        // newValue will be of type State, thus rawValue will
        // be an Int32 value that can be saved in Core Data
        set {
            self.timeframeUnitsValue = newValue.rawValue
        }
    }

}

extension Goal : Identifiable
{

}
