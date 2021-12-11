//
//  DataController.swift
//  Track Anything
//
//  Created by Joe Buchoff on 12/5/21.
//

import CoreData
import Foundation

class DataController: ObservableObject
{
    let container = NSPersistentContainer(name: "Track_Anything")
    
    init()
    {
        container.loadPersistentStores
        { description, error in
            if let error = error
            {
                print("CoreData failed to load: \(error.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
