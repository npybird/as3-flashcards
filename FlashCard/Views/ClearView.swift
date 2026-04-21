//
//  SwiftUIView.swift
//  FlashCard
//
//  Created by Natchanon Posayaanuwat on 13/4/2569 BE.
//

import SwiftUI

struct ClearView: View {
    let deckTitle: String

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 64))
                .foregroundStyle(.green)

            Text("Clear!")
                .font(.largeTitle.bold())

            Text("You remembered all cards in \(deckTitle)!")
                .font(.title3)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    ClearView(deckTitle: "Kuy")
}
