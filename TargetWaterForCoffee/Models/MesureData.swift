//
//  MesureData.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/08/28.
//

import Foundation

struct MesureData: Codable, Equatable {
    let date: String
    let circle: String
    let ph: String
    let alkalinity: String
    let hardness: String
    let filter: String
    let memo: String
}
