//
//  ConsolesManager.swift
//  MyGames
//
//  Created by Douglas Cardoso Ferreira on 18/10/21.
//

import CoreData

class ConsolesManager {
    
    //MARK: - Propeties & Variables
    static let shared = ConsolesManager()
    var consoles: [Console] = []
    
    //MARK: - Functions
    func loadConsoles(with context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Console> = Console.fetchRequest()
        let shortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [shortDescriptor]
        
        do {
            consoles = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteConsole(index: Int, context: NSManagedObjectContext) {
        let console = consoles[index]
        context.delete(console)
        
        do {
            try context.save()
            consoles.remove(at: index)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //MARK: - Init
    private init() { }
}
