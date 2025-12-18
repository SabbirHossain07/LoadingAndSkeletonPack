//
//  SkeletonView.swift
//  LoadingAndSkeletonPack
//
//  Created by Sabbir Hossan on 18/12/25.
//

import SwiftUI

/// A flexible skeleton view that can be customized with various shapes and animations
public struct SkeletonView: View {
    let shape: SkeletonShape
    let cornerRadius: CGFloat
    let animation: ShimmerAnimation
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(
        shape: SkeletonShape = .roundedRectangle,
        cornerRadius: CGFloat = 8,
        animation: ShimmerAnimation = .default
    ) {
        self.shape = shape
        self.cornerRadius = cornerRadius
        self.animation = animation
    }
    
    public var body: some View {
        Group {
            switch shape {
            case .rectangle:
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
            case .circle:
                Circle()
                    .fill(Color.gray.opacity(0.2))
            case .roundedRectangle:
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.gray.opacity(0.2))
            case .capsule:
                Capsule()
                    .fill(Color.gray.opacity(0.2))
            }
        }
        .shimmer(animation: reduceMotion ? .none : animation)
    }
}

/// Available skeleton shapes
public enum SkeletonShape {
    case rectangle
    case circle
    case roundedRectangle
    case capsule
}

