//
//  FlashCard.swift
//  FlashCard
//
//  Created by Natchanon Posayaanuwat on 13/4/2569 BE.
//

import Foundation

struct FlashCard: Identifiable, Hashable {
    let id = UUID()
    let question: String
    let answer: String
    var isMastered: Bool = false
    var isDone: Bool = false
}
