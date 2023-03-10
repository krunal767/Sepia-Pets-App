//
//  AlertView.swift
//  Sepia pet
//
//  Created by Krunal Maisuriya on 10/03/23.
//

import SwiftUI

struct AlertView: View {
    
    var message: String

    var body: some View {
        VStack(alignment: .center, spacing: 10.0, content: {
            Spacer()
            Text(message).foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
        }).frame(width: UIScreen.main.bounds.width-50, height: 200)
            .background(Color.black.opacity(0.5))
            .cornerRadius(12)
            .clipped()
    }
}
