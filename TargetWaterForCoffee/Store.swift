//
//  store.swift
//  TargetWaterForCoffee
//
//  Created by Sung Yong Park on 2022/07/17.
//

import Foundation

/// 상점에 대한 구조체를 선언합니다.
struct Store : Codable{
    let caffeName : String
    let address : String
    let ownerName : String?
    let storePhone : String?
    let phone : String?
    let filter : [String]?
    let registDate : Date
    
    init(caffeName: String, address: String, ownerName:String = "", storePhone:String = "", phone:String = "", filter:[String] = []){
        self.caffeName = caffeName
        self.address = address
        self.ownerName = ownerName
        self.storePhone = storePhone
        self.phone = phone
        self.filter = filter
        self.registDate = Date()
    }
}
