//
//  ViewController+CoreData.swift
//  MyGames
//
//  Created by Douglas Cardoso Ferreira on 18/10/21.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
