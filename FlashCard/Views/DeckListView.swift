//
//  DeckListView.swift
//  FlashCard
//
//  Created by Natchanon Posayaanuwat on 13/4/2569 BE.
//

import SwiftUI

struct DeckListView: View {
    @Binding var decks: [Deck]
    @Binding var selectedDeckID: UUID?

    var body: some View {
        List(decks, selection: $selectedDeckID) { deck in
            VStack(alignment: .leading, spacing: 6) {
                Text(deck.title)
                    .font(.headline)

                Text(deck.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text("\(deck.cards.filter { !$0.isDone }.count) cards remaining")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Flash Cards")
    }
}
#Preview {
    @Previewable @State var previewDecks = SampleData.decks
    @Previewable @State var previewSelectedDeckID: UUID? = SampleData.decks[0].id

    NavigationStack {
        DeckListView(
            decks: $previewDecks,
            selectedDeckID: $previewSelectedDeckID
        )
    }
}
