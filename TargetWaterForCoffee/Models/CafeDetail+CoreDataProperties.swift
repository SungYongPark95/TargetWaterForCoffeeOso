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

    @NSManaged public var cafePrimaryKey: String?
    @NSManaged public var date: String?
    @NSManaged public var circle: String?
    @NSManaged public var ph: String?
    @NSManaged public var alkalinity: String?
    @NSManaged public var hardness: String?
    @NSManaged public var filter: String?
    @NSManaged public var memo: String?

}

extension CafeDetail : Identifiable {

}
