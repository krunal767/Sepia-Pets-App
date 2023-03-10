//
//  SettingConfigViewModel.swift
//  Sepia pet
//
//  Created by Krunal Maisuriya on 10/03/23.
//

import Foundation
import SwiftUI

class SettingConfigViewModel: ObservableObject {
    static let sharedInstance = SettingConfigViewModel()

    
    @Published var settingConfigModel = SettingConfigModel()

    
    func getSettingData(completionHandler: @escaping () -> Void) {
        settingConfigModel = try! JSONDecoder().decode(SettingConfigModel.self, from: Data(contentsOf: Bundle.main.url(forResource: "config", withExtension: "json")!))
        completionHandler()
    }
}
