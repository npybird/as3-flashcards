//
//  SampleData.swift
//  FlashCard
//
//  Created by Natchanon Posayaanuwat on 13/4/2569 BE.
//

import Foundation

struct SampleData {
    static let decks: [Deck] = [
        Deck(
            title: "Chinese Body Parts",
            subtitle: "Basic vocabulary for the human body",
            cards: [
                FlashCard(question: "head", answer: "头 (tóu)"),
                FlashCard(question: "eye", answer: "眼睛 (yǎn jīng)"),
                FlashCard(question: "ear", answer: "耳朵 (ěr duo)"),
                FlashCard(question: "foot", answer: "脚 (jiǎo)")
            ]
        ),
        Deck(
            title: "Chinese Colors",
            subtitle: "Basic color words in Chinese",
            cards: [
                FlashCard(question: "red", answer: "红色 (hóng sè)"),
                FlashCard(question: "blue", answer: "蓝色 (lán sè)"),
                FlashCard(question: "green", answer: "绿色 (lǜ sè)"),
                FlashCard(question: "yellow", answer: "黄色 (huáng sè)")
            ]
        ),
        Deck(
            title: "Number Arithmetic",
            subtitle: "Simple arithmetic practice",
            cards: [
                FlashCard(question: "2 + 3 = ?", answer: "5"),
                FlashCard(question: "9 - 4 = ?", answer: "5"),
                FlashCard(question: "6 × 2 = ?", answer: "12"),
                FlashCard(question: "15 ÷ 3 = ?", answer: "5")
            ]
        ),
        Deck(
            title: "Legendary Footballer",
            subtitle: "Guess the football legends from the given nicknames",
            cards: [
                FlashCard(question: "The Magician / Alien", answer: "Lionel Messi"),
                FlashCard(question: "The King of Football", answer: "Pelé"),
                FlashCard(question: "The Goal Machine", answer: "Cristiano Ronaldo"),
                FlashCard(question: "The Golden Boy", answer: "Diego Maradona")
            ]
        )
    ]
}
