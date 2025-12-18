//
//  SkeletonRow.swift
//  LoadingAndSkeletonPack
//
//  Created by Sabbir Hossan on 18/12/25.
//

import SwiftUI

/// A skeleton row component typically used for list items
public struct SkeletonRow: View {
    let avatarSize: CGFloat
    let lineCount: Int
    let spacing: CGFloat
    let animation: ShimmerAnimation
    
    public init(
        avatarSize: CGFloat = 50,
        lineCount: Int = 2,
        spacing: CGFloat = 12,
        animation: ShimmerAnimation = .default
    ) {
        self.avatarSize = avatarSize
        self.lineCount = lineCount
        self.spacing = spacing
        self.animation = animation
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            // Avatar
            SkeletonView(shape: .circle, animation: animation)
                .frame(width: avatarSize, height: avatarSize)
            
            // Text lines
            VStack(alignment: .leading, spacing: 8) {
                ForEach(0..<lineCount, id: \.self) { index in
                    SkeletonView(
                        shape: .roundedRectangle,
                        cornerRadius: 4,
                        animation: animation
                    )
                    .frame(height: 12)
                    .frame(maxWidth: index == lineCount - 1 ? 0.7 : 1.0, alignment: .leading)
                }
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

