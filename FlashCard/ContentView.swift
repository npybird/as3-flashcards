//
//  ContentView.swift
//  FlashCard
//
//  Created by Natchanon Posayaanuwat on 13/4/2569 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var decks: [Deck] = SampleData.decks
    @State private var selectedDeckID: UUID? = nil

    var body: some View {
        NavigationSplitView {
            DeckListView(decks: $decks, selectedDeckID: $selectedDeckID)
        } detail: {
            if let selectedDeckID,
               let index = decks.firstIndex(where: { $0.id == selectedDeckID }) {
                StudyView(deck: $decks[index])
            } else {
                ContentUnavailableView(
                    "Select a Deck",
                    systemImage: "rectangle.stack.fill",
                    description: Text("Choose a flash card deck to begin studying.")
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
