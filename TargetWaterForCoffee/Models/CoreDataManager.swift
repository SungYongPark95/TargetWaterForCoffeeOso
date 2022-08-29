//
//  CoreDataManager.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/08/28.
//

import Foundation
import CoreData

class CoreDataManager{
    static var shared: CoreDataManager = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    var CafeDetailEntity: NSEntityDescription? {
            return  NSEntityDescription.entity(forEntityName: "CafeDetail", in: context)
    }
}

// [ MARK ] Function
extension CoreDataManager{
    // Insert Data
    func insertCafeDetail(_ mesureData : MesureData){
        if let entity = CafeDetailEntity{
            let managedObject = NSManagedObject(entity: entity, insertInto: context)
            managedObject.setValue(mesureData.hardness, forKey: "hardness")
            managedObject.setValue(mesureData.alkalinity, forKey: "alkalinity")
            managedObject.setValue(mesureData.date, forKey: "date")
            managedObject.setValue(mesureData.cafePrimaryKey, forKey: "cafePrimaryKey")
            managedObject.setValue(mesureData.circle, forKey: "circle")
            managedObject.setValue(mesureData.filter, forKey: "filter")
            managedObject.setValue(mesureData.ph, forKey: "ph")
            managedObject.setValue(mesureData.memo, forKey: "memo")
        }
        saveToContext()
    }
    
    // Save Data
    func saveToContext(){
        do{
            try context.save()
        } catch{
            print(error.localizedDescription)
        }
    }
    
    // Fetch Data
    func fetchCafeDetails() -> [CafeDetail]{
        do{
            let request = CafeDetail.fetchRequest()
            let results = try context.fetch(request)
            return results
        }catch{
            print(error.localizedDescription)
        }
        return []
    }
    
    // Get Data
    func getCafeDetails() -> [CafeDetail]{
        var cafeDetails: [CafeDetail] = []
        let fetchResults = fetchCafeDetails()
        
        for result in fetchResults{
            let MesureData = MesureData(hardness: result.hardness ?? "",
                                        alkalinity: result.alkalinity ?? "",
                                        ph: result.ph ?? "",
                                        filter: result.filter ?? "",
                                        memo: result.memo ?? "",
                                        circle: result.circle ?? "",
                                        date: result.date ?? "",
                                        cafePrimaryKey: result.cafePrimaryKey ?? "")
            cafeDetails.append(MesureData)
        }
        return cafeDetails
    }
    
    // Update Data
    
    
    
    
}
