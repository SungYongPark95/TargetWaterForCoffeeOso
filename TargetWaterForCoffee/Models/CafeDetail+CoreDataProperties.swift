//
//  CafeDetail+CoreDataProperties.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/08/19.
//
//

import Foundation
import CoreData


extension CafeDetailData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CafeDetailData> {
        return NSFetchRequest<CafeDetailData>(entityName: "CafeDetailData")
    }

    @NSManaged public var date: Date?
    @NSManaged public var circle: String?
    @NSManaged public var ph: String?
    @NSManaged public var alkalinity: String?
    @NSManaged public var hardness: String?
    @NSManaged public var filter: String?
    @NSManaged public var memo: String?
}

extension CafeDetailData : Identifiable {

}
