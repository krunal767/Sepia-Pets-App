//
//  PetsListView.swift
//  Sepia pet
//
//  Created by Krunal Maisuriya on 10/03/23.
//

import SwiftUI

struct PetsListView: View {
    
    @Binding var petData: Pet
    
    let tappedAction: (_: Pet) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            Button {
                tappedAction(petData)
            } label: {
                HStack(alignment: .center, spacing: 15.0) {
                    PetImageView(image: .constant(petData.imageURL ?? ""))
                    
                    Text(petData.title ?? "")
                        .font(.title3.weight(.regular))
                        .foregroundColor(Color.black)
                    Spacer()
                }
            }
            
            Divider()
                .foregroundColor(Color.gray)
                .frame(height: 1.0, alignment: .leading)
        }
    }
}

struct PetsListView_Previews: PreviewProvider {
    static var previews: some View {
        PetsListView(petData: .constant(Pet()), tappedAction: {_ in})
    }
}
