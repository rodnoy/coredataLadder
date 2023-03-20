//
//  StorageProvider.swift
//  HelloCoreData
//
//  Created by KIRILL SIMAGIN on 20/03/2023.
//

import CoreData

class StorageProvider {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "K6Probe")
        
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data store failed to load with error: → \(error)")
            }
        }
    }
}

extension StorageProvider {
    fileprivate func updateContext(named name: String) {
        do{
            try persistentContainer.viewContext.save()
            print("\(name) saved succesfully")
        }catch{
            persistentContainer.viewContext.rollback()
            print("Failled to save \(name): \(error)")
        }
    }
}
extension StorageProvider {
    
    func saveMovie(named name: String){
        
        let movie = Movie(context: persistentContainer.viewContext)
        movie.name = name
        
        updateContext(named: "Movie")
    }
}

extension StorageProvider{
    func getAllMovies()->[Movie]{
        let movieFetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        do{
            return try persistentContainer.viewContext.fetch(movieFetchRequest)
        }catch{
            return []
        }
    }
}

extension StorageProvider{
    func deleteMovie(_ movie: Movie){
        persistentContainer.viewContext.delete(movie)
        updateContext(named: "Movie")
    }
}

