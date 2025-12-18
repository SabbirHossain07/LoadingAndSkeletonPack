//
//  ShimmerAnimation.swift
//  LoadingAndSkeletonPack
//
//  Created by Sabbir Hossan on 18/12/25.
//

import SwiftUI

/// Types of shimmer animations available
public enum ShimmerAnimation: String, CaseIterable {
    case none = "None"
    case slow = "Slow"
    case `default` = "Default"
    case fast = "Fast"
    case pulse = "Pulse"
    
    var animation: Animation {
        switch self {
        case .none:
            return .linear(duration: 0)
        case .slow:
            return .linear(duration: 2.5)
        case .default:
            return .linear(duration: 1.5)
        case .fast:
            return .linear(duration: 0.8)
        case .pulse:
            return .easeInOut(duration: 1.2)
        }
    }
    
    /// Returns animation respecting accessibility reduce motion preference
    func animation(reduceMotion: Bool) -> Animation {
        if reduceMotion {
            return .linear(duration: 0)
        }
        return self.animation
    }
}

