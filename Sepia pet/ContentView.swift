//
//  ContentView.swift
//  Sepia pet
//
//  Created by Krunal Maisuriya on 10/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var petsViewModel: PetsViewModel

    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(petsViewModel.petsModel.pets ?? [Pet](), id: \.self) {
                        PetsListView(petData: .constant($0))
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
