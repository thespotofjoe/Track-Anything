//
//  WeightExercise+CoreDataProperties.swift
//  Track Anything
//
//  Created by Joe Buchoff on 12/5/21.
//
//

import Foundation
import CoreData


extension WeightExercise
{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeightExercise>
    {
        return NSFetchRequest<WeightExercise>(entityName: "WeightExercise")
    }

    @NSManaged public var name: String?
    @NSManaged public var logs: NSSet?
    @NSManaged public var goal: WeightExerciseGoal?

}

// MARK: Generated accessors for logs
extension WeightExercise
{

    @objc(addLogsObject:)
    @NSManaged public func addToLogs(_ value: WeightExerciseEntry)

    @objc(removeLogsObject:)
    @NSManaged public func removeFromLogs(_ value: WeightExerciseEntry)

    @objc(addLogs:)
    @NSManaged public func addToLogs(_ values: NSSet)

    @objc(removeLogs:)
    @NSManaged public func removeFromLogs(_ values: NSSet)

}

extension WeightExercise : Identifiable
{

}
