//
//  Sepia_petApp.swift
//  Sepia pet
//
//  Created by Krunal Maisuriya on 10/03/23.
//

import SwiftUI

@main
struct Sepia_petApp: App {
    
    @StateObject private var petsViewModel = PetsViewModel()
    @StateObject private var settingConfigViewModel = SettingConfigViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .navigationViewStyle(.stack)
                .environmentObject(petsViewModel)
                .environmentObject(settingConfigViewModel)
        }
    }
}
