//
//  PetImageView.swift
//  Sepia pet
//
//  Created by Krunal Maisuriya on 10/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PetImageView: View {
    
    @Binding var image: String
    
    var body: some View {
        WebImage(url: URL(string: image))
            .onSuccess { image, data, cacheType in }
            .resizable()
            .placeholder {
                Circle().foregroundColor(.gray)
            }
            .indicator(.activity)
            .scaledToFill()
            .transition(.fade(duration: 0.5))
            .frame(width: 60, height: 60, alignment: .center)
            .clipShape(Circle())
    }
}
