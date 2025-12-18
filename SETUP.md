# Setup Guide

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/Sabbirhossan07/LoadingAndSkeletonPack.git
   cd LoadingAndSkeletonPack
   ```

2. **Open in Xcode**
   - Open `LoadingAndSkeletonPack.xcodeproj` in Xcode
   - Select your target device or simulator
   - Build and run (⌘R)

## Project Structure

```
LoadingAndSkeletonPack/
├── Components/
│   ├── Shimmer/
│   │   ├── ShimmerAnimation.swift      # Animation types enum
│   │   └── ShimmerModifier.swift       # Shimmer effect modifier
│   └── Skeleton/
│       ├── SkeletonView.swift          # Base skeleton component
│       ├── SkeletonRow.swift           # Row skeleton component
│       ├── SkeletonCard.swift          # Card skeleton component
│       └── SkeletonPlaceholder.swift   # Content placeholder modifier
├── ContentView.swift                   # Demo app
└── LoadingAndSkeletonPackApp.swift     # App entry point
```

## Using in Your Project

### Option 1: Copy Components
Simply copy the `Components` folder to your project.

### Option 2: Swift Package (Future)
This will be available as a Swift Package in the future.

## Requirements

- Xcode 14.0 or later
- iOS 15.0+ / macOS 12.0+
- Swift 5.7+

## Building

1. Open the project in Xcode
2. Select your target platform
3. Build (⌘B) or Run (⌘R)

## Troubleshooting

### Build Errors
- Make sure you're using Xcode 14.0 or later
- Clean build folder (⌘⇧K) and rebuild

### Animation Not Working
- Check if "Reduce Motion" is enabled in Accessibility settings
- Verify the animation type is not set to `.none`

## Next Steps

- Read the [README.md](README.md) for usage examples
- Check out [CONTRIBUTING.md](CONTRIBUTING.md) if you want to contribute
- Explore the demo app in `ContentView.swift` for examples

