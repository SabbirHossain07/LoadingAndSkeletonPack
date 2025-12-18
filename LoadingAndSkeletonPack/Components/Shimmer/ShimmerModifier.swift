//
//  ShimmerModifier.swift
//  LoadingAndSkeletonPack
//
//  Created by Sabbir Hossan on 18/12/25.
//

import SwiftUI

/// A view modifier that applies a shimmer animation effect
struct ShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = 0
    let animation: ShimmerAnimation
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(0.3),
                            Color.white.opacity(0.7),
                            Color.white.opacity(0.3)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: geometry.size.width * 2)
                    .offset(x: -geometry.size.width + (geometry.size.width * 2 * phase))
                    .blendMode(.overlay)
                }
            )
            .onAppear {
                let effectiveAnimation = reduceMotion ? ShimmerAnimation.none : animation
                if effectiveAnimation != .none {
                    withAnimation(
                        effectiveAnimation.animation
                            .repeatForever(autoreverses: false)
                    ) {
                        phase = 1.0
                    }
                }
            }
    }
}

extension View {
    func shimmer(animation: ShimmerAnimation = .default) -> some View {
        modifier(ShimmerModifier(animation: animation))
    }
}
