//
//  WeightExerciseEntry+CoreDataProperties.swift
//  Track Anything
//
//  Created by Joe Buchoff on 12/5/21.
//
//

import Foundation
import CoreData


extension WeightExerciseEntry
{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeightExerciseEntry>
    {
        return NSFetchRequest<WeightExerciseEntry>(entityName: "WeightExerciseEntry")
    }

    @NSManaged public var lbs: Double
    @NSManaged public var sets: Int16
    @NSManaged public var reps: Int16
    @NSManaged public var date: Date?

    public var unwrappedDate: Date
    {
        return date!
    }
    
}

extension WeightExerciseEntry : Identifiable
{

}
