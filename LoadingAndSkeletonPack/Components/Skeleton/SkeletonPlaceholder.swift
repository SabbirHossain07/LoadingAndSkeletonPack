//
//  SkeletonPlaceholder.swift
//  LoadingAndSkeletonPack
//
//  Created by Sabbir Hossan on 18/12/25.
//

import SwiftUI

/// A view modifier that shows skeleton content while loading
public struct SkeletonPlaceholder<Content: View, Placeholder: View>: View {
    let isLoading: Bool
    let content: () -> Content
    let placeholder: () -> Placeholder
    let transition: ContentTransition
    
    public init(
        isLoading: Bool,
        transition: ContentTransition = .opacity,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) {
        self.isLoading = isLoading
        self.transition = transition
        self.content = content
        self.placeholder = placeholder
    }
    
    public var body: some View {
        Group {
            if isLoading {
                placeholder()
            } else {
                content()
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isLoading)
    }
}

extension View {
    public func skeletonPlaceholder<Placeholder: View>(
        isLoading: Bool,
        transition: ContentTransition = .opacity,
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) -> some View {
        SkeletonPlaceholder(
            isLoading: isLoading,
            transition: transition,
            content: { self },
            placeholder: placeholder
        )
    }
}

