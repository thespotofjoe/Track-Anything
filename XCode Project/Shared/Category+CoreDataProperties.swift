//
//  Category+CoreDataProperties.swift
//  Track Anything
//
//  Created by Joe Buchoff on 12/5/21.
//
//

import Foundation
import CoreData


extension Category
{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category>
    {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var metrics: NSSet?
    @NSManaged public var exercises: NSSet?

}

// MARK: Generated accessors for metrics
extension Category
{

    @objc(addMetricsObject:)
    @NSManaged public func addToMetrics(_ value: Metric)

    @objc(removeMetricsObject:)
    @NSManaged public func removeFromMetrics(_ value: Metric)

    @objc(addMetrics:)
    @NSManaged public func addToMetrics(_ values: NSSet)

    @objc(removeMetrics:)
    @NSManaged public func removeFromMetrics(_ values: NSSet)

}

// MARK: Generated accessors for exercises
extension Category
{

    @objc(addExercisesObject:)
    @NSManaged public func addToExercises(_ value: WeightExercise)

    @objc(removeExercisesObject:)
    @NSManaged public func removeFromExercises(_ value: WeightExercise)

    @objc(addExercises:)
    @NSManaged public func addToExercises(_ values: NSSet)

    @objc(removeExercises:)
    @NSManaged public func removeFromExercises(_ values: NSSet)

}

extension Category : Identifiable
{

}
