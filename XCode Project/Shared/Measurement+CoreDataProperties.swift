//
//  Measurement+CoreDataProperties.swift
//  Track Anything
//
//  Created by Joe Buchoff on 12/5/21.
//
//

import Foundation
import CoreData


extension Measurement
{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Measurement>
    {
        return NSFetchRequest<Measurement>(entityName: "Measurement")
    }

    @NSManaged public var number: Double
    @NSManaged public var date: Date?

}

extension Measurement : Identifiable
{

}
