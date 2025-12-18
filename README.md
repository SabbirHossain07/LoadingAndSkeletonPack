# Loading & Skeleton Pack

A beautiful, production-ready SwiftUI library for loading states, skeleton screens, and shimmer effects. Built with accessibility in mind and following Meta's coding standards.

## ✨ Features

- **Skeleton Components**: Pre-built skeleton views for rows, cards, and custom shapes
- **Shimmer Animations**: Multiple animation types (slow, default, fast, pulse)
- **Content Placeholders**: Smooth transitions between loading and content states
- **Accessibility**: Full support for reduce motion preferences
- **Customizable**: Easy to customize colors, sizes, and animations
- **Production Ready**: Clean, modular code following best practices

## 📦 Components

### SkeletonView
A flexible skeleton view that supports multiple shapes:
- Rectangle
- Circle
- Rounded Rectangle
- Capsule

### SkeletonRow
Pre-built skeleton row component perfect for list items with avatar and text lines.

### SkeletonCard
Card-based skeleton component with image placeholder, title, and description lines.

### SkeletonPlaceholder
A view modifier that smoothly transitions between skeleton and actual content.

## 🚀 Quick Start

### Basic Usage

```swift
import SwiftUI

struct MyView: View {
    var body: some View {
        // Basic skeleton view
        SkeletonView(shape: .roundedRectangle, animation: .default)
            .frame(width: 200, height: 100)
        
        // Skeleton row
        SkeletonRow(avatarSize: 50, lineCount: 2)
        
        // Skeleton card
        SkeletonCard(imageHeight: 200)
    }
}
```

### With Content Placeholder

```swift
struct ContentView: View {
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            Text("My Content")
            Image(systemName: "photo")
        }
        .skeletonPlaceholder(isLoading: isLoading) {
            SkeletonCard()
        }
    }
}
```

### Custom Animation

```swift
SkeletonView(shape: .circle, animation: .fast)
    .frame(width: 100, height: 100)
```

## 🎨 Animation Types

- **None**: No animation
- **Slow**: Slow, smooth animation (2.5s)
- **Default**: Standard animation (1.5s) - Recommended
- **Fast**: Quick animation (0.8s)
- **Pulse**: Pulsing effect (1.2s)

## ♿ Accessibility

The library automatically respects the system's "Reduce Motion" setting. When enabled, animations are disabled to provide a better experience for users with motion sensitivity.

## 📱 Requirements

- iOS 15.0+
- macOS 12.0+
- Xcode 14.0+
- Swift 5.7+

## 🔧 Installation

### Manual Installation

1. Clone this repository
2. Add the `LoadingAndSkeletonPack` folder to your Xcode project
3. Import and use the components

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/Sabbirhossan07/LoadingAndSkeletonPack.git", from: "1.0.0")
]
```

## 📖 Examples

### Example 1: List with Skeleton Rows

```swift
struct UserListView: View {
    @State private var isLoading = true
    
    var body: some View {
        List {
            ForEach(0..<5) { _ in
                SkeletonRow()
            }
        }
    }
}
```

### Example 2: Grid of Skeleton Cards

```swift
struct CardGridView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(0..<6) { _ in
                    SkeletonCard()
                }
            }
        }
    }
}
```

### Example 3: Custom Skeleton Shape

```swift
SkeletonView(shape: .capsule, cornerRadius: 20, animation: .pulse)
    .frame(width: 150, height: 40)
```

## 🏗️ Architecture

The project follows a clean, modular architecture:

```
LoadingAndSkeletonPack/
├── Components/
│   ├── Shimmer/
│   │   ├── ShimmerAnimation.swift
│   │   └── ShimmerModifier.swift
│   └── Skeleton/
│       ├── SkeletonView.swift
│       ├── SkeletonRow.swift
│       ├── SkeletonCard.swift
│       └── SkeletonPlaceholder.swift
└── ContentView.swift (Demo App)
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Sabbir Hossan**

- GitHub: [@Sabbirhossan07](https://github.com/Sabbirhossan07)

## 🙏 Acknowledgments

- Inspired by modern loading patterns from Meta, Apple, and other leading tech companies
- Built with SwiftUI best practices
- Designed with accessibility in mind

## 📝 Changelog

### Version 1.0.0
- Initial release
- Skeleton components (View, Row, Card)
- Shimmer animations
- Content placeholder support
- Accessibility features

---

⭐ If you find this project helpful, please consider giving it a star!

