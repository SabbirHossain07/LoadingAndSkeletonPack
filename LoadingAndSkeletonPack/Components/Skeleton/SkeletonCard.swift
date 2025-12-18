//
//  SkeletonCard.swift
//  LoadingAndSkeletonPack
//
//  Created by Sabbir Hossan on 18/12/25.
//

import SwiftUI

/// A skeleton card component for card-based layouts
public struct SkeletonCard: View {
    let imageHeight: CGFloat
    let cornerRadius: CGFloat
    let padding: CGFloat
    let animation: ShimmerAnimation
    
    public init(
        imageHeight: CGFloat = 200,
        cornerRadius: CGFloat = 12,
        padding: CGFloat = 16,
        animation: ShimmerAnimation = .default
    ) {
        self.imageHeight = imageHeight
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.animation = animation
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Image placeholder
            SkeletonView(
                shape: .roundedRectangle,
                cornerRadius: cornerRadius,
                animation: animation
            )
            .frame(height: imageHeight)
            
            // Title
            SkeletonView(
                shape: .roundedRectangle,
                cornerRadius: 6,
                animation: animation
            )
            .frame(height: 20)
            .frame(maxWidth: 0.8)
            
            // Description lines
            VStack(alignment: .leading, spacing: 8) {
                SkeletonView(
                    shape: .roundedRectangle,
                    cornerRadius: 4,
                    animation: animation
                )
                .frame(height: 12)
                
                SkeletonView(
                    shape: .roundedRectangle,
                    cornerRadius: 4,
                    animation: animation
                )
                .frame(height: 12)
                .frame(maxWidth: 0.9)
            }
        }
        .padding(padding)
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
        )
    }
}

