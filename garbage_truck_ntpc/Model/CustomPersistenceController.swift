//
//  CustomPersistenceController.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2022/1/26.
//

import UIKit
import CoreData

class NSCustomPersistenceContainer:NSPersistentContainer{
    
    override open class func defaultDirectoryURL() -> URL {
        var storeURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.datacore.share")
        storeURL = storeURL?.appendingPathComponent("Model.sqlite")
        return storeURL!
    }
}
