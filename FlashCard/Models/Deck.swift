//
//  Deck.swift
//  FlashCard
//
//  Created by Natchanon Posayaanuwat on 13/4/2569 BE.
//

import Foundation

struct Deck: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    var cards: [FlashCard]
}
