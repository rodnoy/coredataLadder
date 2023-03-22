//
//  FileStorage.swift
//  OneStepFarther
//
//  Created by KIRILL SIMAGIN on 21/03/2023.
//

import CoreData
import Foundation

class CoreDataStack{
    private let modelName = "K6Model"
    lazy var managedObjectModel: NSManagedObjectModel = {
        guard let url = Bundle.main.url(forResource: modelName, withExtension: "momd")
        else {
            fatalError("Failed to locate momd file for MyModel")
        }
        
        guard let model = NSManagedObjectModel(contentsOf: url)
        else{
            fatalError("Failed to load momd file for MyModel")
        }
        return model
    }()
    
    lazy var coordinator: NSPersistentStoreCoordinator = {
        let coordianator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let sqlitePath = documentDirectory.appendingPathComponent(modelName + ".sqlite")
        
        do{
            //NSBinaryStoreType
            try coordianator.addPersistentStore(ofType: NSSQLiteStoreType,
                                                configurationName: nil,
                                                at: sqlitePath)
            
        }catch{
            fatalError("Something went wrong while setting up the coordinator")
        }
        return coordianator
    }()
    
    lazy var viewContext: NSManagedObjectContext = {
    let context = NSManagedObjectContext(concurrencyType:.mainQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator
        return context
    }()
}
