//
//  ContentView.swift
//  Sepia pet
//
//  Created by Krunal Maisuriya on 10/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var petsViewModel: PetsViewModel
    @EnvironmentObject var settingConfigViewModel: SettingConfigViewModel
    
    @State var isTappedPet: Bool = false
    @State private var showingAlert = false
    
    @State private var arrWeeks: [Int] = [Int]()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                if !showingAlert {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(petsViewModel.petsModel.pets ?? [Pet](), id: \.self) {
                            petInfo(pet: $0)
                                .padding(.horizontal)
                        }
                    }.blur(radius: showingAlert ? 30 : 0)
                }
                else {
                    AlertView(message: "User Can't Showing Pets Information yet. Because today's Working hours are over. Please visit on \(getWeekDay(number: arrWeeks.first ?? 2)) to \(getWeekDay(number: arrWeeks.last ?? 6)) between 9:00 to 18:00.")
                }
            }
            .onAppear {
                settingConfigViewModel.getSettingData {
                    let arrHours = settingConfigViewModel.settingConfigModel.settings?.getHours()
                    arrWeeks = (settingConfigViewModel.settingConfigModel.settings?.getWeeks())!

                    let currentDate = Date().convertDateToStr(format: "H")
                    let weekNumber = Int(Date().convertDateToStr(format: "e"))
                    
                    if arrWeeks.contains(where: { $0 == weekNumber }) == true {
                        if arrHours?.contains(where: { $0 == currentDate }) == true {
                            showingAlert = false
                            petsViewModel.getPetsData()
                        } else {
                            //Pop up
                            showingAlert = true
                        }
                    } else {
                        //Pop up
                        showingAlert = true
                    }
                }
            }
            .navigationTitle("Pet List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    //  MARK: - Pet Info View
    @ViewBuilder func petInfo(pet: Pet) -> some View {
        NavigationLink(destination: PetDetailView(petDetail: .constant(pet)), isActive: $isTappedPet) {
            PetsListView(petData: .constant(pet), tappedAction: { pet in
                isTappedPet.toggle()
            })
        }
    }
    
    func getWeekDay(number: Int) -> String {
        switch number {
        case 1:
            return "Sunday"
        case 2:
            return "Monday"
        case 3:
            return "Tuesday"
        case 4:
            return "Wendnesday"
        case 5:
            return "Thrusday"
        case 6:
            return "Friday"
        case 7:
            return "Saturday"
        default:
            return "Monday"
        }
    }
}
