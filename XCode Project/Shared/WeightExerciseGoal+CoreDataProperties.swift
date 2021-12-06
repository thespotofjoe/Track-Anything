//
//  WeightExerciseGoal+CoreDataProperties.swift
//  Track Anything
//
//  Created by Joe Buchoff on 12/5/21.
//
//

import Foundation
import CoreData


extension WeightExerciseGoal
{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeightExerciseGoal>
    {
        return NSFetchRequest<WeightExerciseGoal>(entityName: "WeightExerciseGoal")
    }

    @NSManaged public var repGoal: Int16
    @NSManaged public var setGoal: Int16
    @NSManaged public var lbsGoal: Int16
    @NSManaged public var deadline: Date?
    @NSManaged public var timeframe: Int16
    
    public var unwrappedDeadline: Date
    {
        return deadline!
    }

}

extension WeightExerciseGoal : Identifiable
{

}
