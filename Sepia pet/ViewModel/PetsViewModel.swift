//
//  PetsViewModel.swift
//  Sepia pet
//
//  Created by Krunal Maisuriya on 10/03/23.
//

import Foundation
import SwiftUI

class PetsViewModel: ObservableObject {
        
    static let sharedInstance = PetsViewModel()

    @Published var petsModel = PetsModel()

    
    func getPetsData() {
        petsModel = try! JSONDecoder().decode(PetsModel.self, from: Data(contentsOf: Bundle.main.url(forResource: "pets_list", withExtension: "json")!))
    }
}
