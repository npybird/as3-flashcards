//
//  StudyView.swift
//  FlashCard
//
//  Created by Natchanon Posayaanuwat on 13/4/2569 BE.
//

import SwiftUI

struct StudyView: View {
    @Binding var deck: Deck

    @State private var currentIndex: Int = 0
    @State private var showAnswer: Bool = false
    @State private var rotation: Double = 0

    @State private var cardOffset: CGFloat = 0
    @State private var cardOpacity: Double = 1
    @State private var cardScale: CGFloat = 1

    @State private var shuffledIndices: [Int] = []

    var remainingCards: [FlashCard] {
        shuffledIndices.map { deck.cards[$0] }
    }

    var currentCard: FlashCard? {
        guard !shuffledIndices.isEmpty else { return nil }
        let safeIndex = min(currentIndex, shuffledIndices.count - 1)
        let realIndex = shuffledIndices[safeIndex]
        return deck.cards[realIndex]
    }

    var body: some View {
        Group {
            if shuffledIndices.isEmpty {
                ClearView(deckTitle: deck.title)
            } else {
                VStack(spacing: 24) {
                    VStack(spacing: 8) {
                        Text(deck.title)
                            .font(.largeTitle.bold())

                        Text(deck.subtitle)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        Text("\(shuffledIndices.count) cards remaining")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }

                    Spacer()

                    ZStack {
                        if let card = currentCard {
                            FlashCardView(
                                question: card.question,
                                answer: card.answer,
                                isShowingAnswer: showAnswer,
                                rotation: rotation
                            )
                            .id(card.id)
                            .offset(x: cardOffset)
                            .opacity(cardOpacity)
                            .scaleEffect(cardScale)
                            .onTapGesture {
                                flipCard()
                            }
                        }
                    }

                    Spacer()

                    HStack(spacing: 12) {
                        Button("Flip Card") {
                            flipCard()
                        }
                        .buttonStyle(.borderedProminent)

                        Button("Next Card") {
                            nextCard()
                        }
                        .buttonStyle(.bordered)

                        Button("Done") {
                            markDone()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            shuffleCards()
        }
        .onChange(of: deck.id) {
            shuffleCards()
        }
    }

    private func shuffleCards() {
        let availableIndices = deck.cards.indices.filter { !deck.cards[$0].isDone }
        shuffledIndices = availableIndices.shuffled()

        currentIndex = 0
        showAnswer = false
        rotation = 0
        cardOffset = 0
        cardOpacity = 1
        cardScale = 1
    }

    private func flipCard() {
        showAnswer.toggle()

        withAnimation(.easeInOut(duration: 0.5)) {
            rotation = showAnswer ? 180 : 0
        }
    }

    private func nextCard() {
        guard !shuffledIndices.isEmpty else { return }

        withAnimation(.easeInOut(duration: 0.20)) {
            cardOffset = -60
            cardOpacity = 0
            cardScale = 0.95
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) {
            showAnswer = false
            rotation = 0
            currentIndex = (currentIndex + 1) % shuffledIndices.count

            cardOffset = 60
            cardOpacity = 0
            cardScale = 0.95

            withAnimation(.easeInOut(duration: 0.22)) {
                cardOffset = 0
                cardOpacity = 1
                cardScale = 1
            }
        }
    }

    private func markDone() {
        guard !shuffledIndices.isEmpty else { return }

        withAnimation(.easeInOut(duration: 0.20)) {
            cardOffset = -60
            cardOpacity = 0
            cardScale = 0.95
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) {
            let removingIndex = shuffledIndices[currentIndex]

            deck.cards[removingIndex].isDone = true
            shuffledIndices.remove(at: currentIndex)

            showAnswer = false
            rotation = 0

            if currentIndex >= shuffledIndices.count {
                currentIndex = 0
            }

            if !shuffledIndices.isEmpty {
                cardOffset = 60
                cardOpacity = 0
                cardScale = 0.95

                withAnimation(.easeInOut(duration: 0.22)) {
                    cardOffset = 0
                    cardOpacity = 1
                    cardScale = 1
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var previewDeck = SampleData.decks[0]
    StudyView(deck: $previewDeck)
}
