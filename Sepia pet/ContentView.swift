//
//  ContentView.swift
//  Sepia pet
//
//  Created by Krunal Maisuriya on 10/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var petsViewModel: PetsViewModel

    @State var isTappedPet: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(petsViewModel.petsModel.pets ?? [Pet](), id: \.self) {
                        petInfo(pet: $0)
                            .padding(.horizontal)
                    }
                }
            }
            .onAppear {
                petsViewModel.getPetsData()
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
