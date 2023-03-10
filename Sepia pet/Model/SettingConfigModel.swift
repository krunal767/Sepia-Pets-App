//
//  SettingConfigModel.swift
//  Sepia pet
//
//  Created by Krunal Maisuriya on 10/03/23.
//

import Foundation


// MARK: - PetsModel
struct SettingConfigModel: Codable {
    var settings: Settings?
}

// MARK: - Settings
struct Settings: Codable {
    var workHours: String?

    //  MARK:- Get Work Hours
    func getHours() -> [String] {
        let arrSeparaterComponents = workHours?.components(separatedBy: " ")
        
        guard arrSeparaterComponents?.count == 4 else {
            return []
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let currentDate = dateFormatter.string(from: Date())
        
        let strStart = "\(currentDate) \(arrSeparaterComponents![1])"
        let strEnd = "\(currentDate) \(arrSeparaterComponents![3])"
        
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        var startDate = dateFormatter.date(from: strStart)!
        let endDate = dateFormatter.date(from: strEnd)!

        guard startDate < endDate else {
            return []
        }
        
        var dates: [Date] = []
        dates.append(startDate)
        
        while startDate < endDate {
            guard let date = Calendar(identifier: .iso8601).nextDate(after: startDate, matching: DateComponents(minute: 0), matchingPolicy: .strict) else {
                continue
            }
            if date <= endDate {
                dates.append(date)
            }
            startDate = date
        }

        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "H"

        let arrTimes = dates.map({ timeFormatter.string(from: $0) })
        return arrTimes
    }

    //  MARK:- Get Week
    func getWeeks() -> [Int] {
        let arrSeparaterComponents = workHours?.components(separatedBy: " ")
        let arrFirstSeparater = arrSeparaterComponents?.first?.components(separatedBy: "-")
        
        guard (arrFirstSeparater?.count ?? 0) == 2 else {
            return []
        }
        
        let startWeek = DayOfWeek.day(from: arrFirstSeparater?.first ?? "M")
        let endWeek = DayOfWeek.day(from: arrFirstSeparater?.last ?? "F")
        
        var arrWeeks = [Int]()
        
        guard startWeek < endWeek else { return [] }
        for i in startWeek ... endWeek {
            arrWeeks.append(i)
        }
            
        return arrWeeks
    }
}

enum DayOfWeek: Int {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wendnesday = 4
    case thrusday = 5
    case friday = 6
    case saturday = 7

    static func day(from string: String) -> Int {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "e"
        formatter.calendar.firstWeekday = 0
        let date = formatter.date(from: string)!
        return Int(formatter.string(from: date))!
    }
}

