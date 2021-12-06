//
//  Metric+CoreDataProperties.swift
//  Track Anything
//
//  Created by Joe Buchoff on 12/5/21.
//
//

import Foundation
import CoreData


extension Metric
{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Metric>
    {
        return NSFetchRequest<Metric>(entityName: "Metric")
    }

    @NSManaged public var name: String?
    @NSManaged public var unit: String?
    @NSManaged public var logs: NSSet?
    @NSManaged public var goals: NSSet?
    
    public var unwrappedName: String
    {
        return name!
    }
    
    public var unwrappedUnit: String
    {
        return unit!
    }
    
    public var logArray: [Metric]
    {
        let set = logs as? Set<Metric> ?? []
        
        return set.sorted
        {
            $0.unwrappedName < $1.unwrappedName
        }
    }
    
    public var goalArray: [Goal]
    {
        let set = goals as? Set<Goal> ?? []
        
        return set.sorted
        {
            $0.unwrappedDeadline < $1.unwrappedDeadline
        }
    }

}

// MARK: Generated accessors for logs
extension Metric
{

    @objc(addLogsObject:)
    @NSManaged public func addToLogs(_ value: Measurement)

    @objc(removeLogsObject:)
    @NSManaged public func removeFromLogs(_ value: Measurement)

    @objc(addLogs:)
    @NSManaged public func addToLogs(_ values: NSSet)

    @objc(removeLogs:)
    @NSManaged public func removeFromLogs(_ values: NSSet)

}

// MARK: Generated accessors for goal
extension Metric
{

    @objc(addGoalObject:)
    @NSManaged public func addToGoal(_ value: Goal)

    @objc(removeGoalObject:)
    @NSManaged public func removeFromGoal(_ value: Goal)

    @objc(addGoal:)
    @NSManaged public func addToGoal(_ values: NSSet)

    @objc(removeGoal:)
    @NSManaged public func removeFromGoal(_ values: NSSet)

}

extension Metric : Identifiable
{

}
