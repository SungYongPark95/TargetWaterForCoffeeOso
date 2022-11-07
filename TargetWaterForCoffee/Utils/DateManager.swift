//
//  DateManager.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/09/14.
//

import Foundation

func cafeDetailDateFormatter(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd"
    let current_date_string = formatter.string(from: date)
    let startIndex = current_date_string.index(current_date_string.startIndex, offsetBy: 2)
    return String(current_date_string[startIndex...])
}

func dataDetailDateFormatter(date: Date) -> (day: String, time: String) {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy년MM월dd일 h:mm a"
    let current_date_string = formatter.string(from: date)
    let arr = current_date_string.components(separatedBy: " ")
    return (arr[0], arr[1] + " " + arr[2])
}
