//
//  FlashCardView.swift
//  FlashCard
//
//  Created by Natchanon Posayaanuwat on 13/4/2569 BE.
//

import SwiftUI

struct FlashCardView: View {
    let question: String
    let answer: String
    let isShowingAnswer: Bool
    let rotation: Double

    var body: some View {
        ZStack {
            cardFace(
                title: "QUESTION",
                text: question,
                colors: [Color.blue, Color.cyan]
            )
            .opacity(frontOpacity)

            cardFace(
                title: "ANSWER",
                text: answer,
                colors: [Color.orange, Color.red]
            )
            .opacity(backOpacity)
            .rotation3DEffect(
                .degrees(180),
                axis: (x: 0, y: 1, z: 0)
            )
        }
        .frame(maxWidth: 520)
        .frame(height: 260)
        .rotation3DEffect(
            .degrees(rotation),
            axis: (x: 0, y: 1, z: 0)
        )
        .shadow(radius: 8)
    }

    private var normalizedRotation: Double {
        let value = rotation.truncatingRemainder(dividingBy: 360)
        return value >= 0 ? value : value + 360
    }

    private var frontOpacity: Double {
        normalizedRotation < 90 || normalizedRotation > 270 ? 1 : 0
    }

    private var backOpacity: Double {
        frontOpacity == 1 ? 0 : 1
    }

    @ViewBuilder
    private func cardFace(title: String, text: String, colors: [Color]) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(
                    LinearGradient(
                        colors: colors,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            VStack(spacing: 12) {
                Text(title)
                    .font(.caption.bold())
                    .foregroundStyle(.white.opacity(0.85))

                Text(text)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    VStack(spacing: 30) {
        FlashCardView(
            question: "head",
            answer: "头 (tóu)",
            isShowingAnswer: false,
            rotation: 0
        )

        FlashCardView(
            question: "head",
            answer: "头 (tóu)",
            isShowingAnswer: true,
            rotation: 180
        )
    }
    .padding()
}
