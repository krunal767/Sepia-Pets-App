//
//  PetDetailView.swift
//  Sepia pet
//
//  Created by Krunal Maisuriya on 10/03/23.
//

import SwiftUI

struct PetDetailView: View {
    
    @Binding var petDetail: Pet
    
    var body: some View {
        VStack {
            WebKitView(url: URL(string: petDetail.contentURL ?? "")!)
        }
        .navigationTitle(petDetail.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

