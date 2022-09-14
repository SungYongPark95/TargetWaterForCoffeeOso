//
//  CafeDetail+CoreDataProperties.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/08/19.
//
//

import Foundation
import CoreData


extension CafeDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CafeDetail> {
        return NSFetchRequest<CafeDetail>(entityName: "CafeDetail")
    }

    @NSManaged public var date: Date?
    @NSManaged public var circle: String?
    @NSManaged public var ph: String?
    @NSManaged public var alkalinity: String?
    @NSManaged public var hardness: String?
    @NSManaged public var filter: String?
    @NSManaged public var memo: String?
    
//    var dateString: String? {
//        let myFormatter = DateFormatter()
//        myFormatter.dateFormat = "yyyy.mm.dd"
//        guard let date = self.date else { return "" }
//        let savedDateString = myFormatter.string(from: date)
//        return savedDateString
//    }

}

extension CafeDetail : Identifiable {

}
