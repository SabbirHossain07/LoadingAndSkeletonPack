//
//  ContentView.swift
//  LoadingAndSkeletonPack
//
//  Created by Sabbir Hossan on 18/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedAnimation: ShimmerAnimation = .default
    @State private var isLoading: Bool = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Loading & Skeleton Pack")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        // Animation Picker
                        HStack {
                            Text("Animation:")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Picker("Animation", selection: $selectedAnimation) {
                                ForEach(ShimmerAnimation.allCases, id: \.self) { animation in
                                    Text(animation.rawValue).tag(animation)
                                }
                            }
                            .pickerStyle(.menu)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                        }
                        
                        Text("Shimmer loaders and content placeholders.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Skeleton rows and cards; Shimmer gradient; Delayed content transition; Accessibility reduce motion path")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    // Skeleton Shapes Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Skeleton Shapes")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                VStack {
                                    SkeletonView(shape: .rectangle, animation: selectedAnimation)
                                        .frame(width: 100, height: 100)
                                    Text("Rectangle")
                                        .font(.caption)
                                }
                                
                                VStack {
                                    SkeletonView(shape: .circle, animation: selectedAnimation)
                                        .frame(width: 100, height: 100)
                                    Text("Circle")
                                        .font(.caption)
                                }
                                
                                VStack {
                                    SkeletonView(shape: .roundedRectangle, cornerRadius: 12, animation: selectedAnimation)
                                        .frame(width: 100, height: 100)
                                    Text("Rounded")
                                        .font(.caption)
                                }
                                
                                VStack {
                                    SkeletonView(shape: .capsule, animation: selectedAnimation)
                                        .frame(width: 100, height: 60)
                                    Text("Capsule")
                                        .font(.caption)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // Skeleton Rows Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Skeleton Rows")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        VStack(spacing: 12) {
                            ForEach(0..<3) { _ in
                                SkeletonRow(animation: selectedAnimation)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    
                    // Skeleton Cards Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Skeleton Cards")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(0..<3) { _ in
                                    SkeletonCard(animation: selectedAnimation)
                                        .frame(width: 300)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // Content Placeholder Demo
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Content Placeholder")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        Button(action: {
                            withAnimation {
                                isLoading.toggle()
                            }
                            if !isLoading {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation {
                                        isLoading = true
                                    }
                                }
                            }
                        }) {
                            Text(isLoading ? "Show Content" : "Show Placeholder")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
                        // Example content with placeholder
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Example Article")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("This is the actual content that appears after loading. You can use the skeleton placeholder to show loading states while content is being fetched.")
                                .font(.body)
                                .foregroundColor(.secondary)
                            
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .foregroundColor(.gray.opacity(0.3))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .skeletonPlaceholder(isLoading: isLoading) {
                            SkeletonCard(animation: selectedAnimation)
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Components/Loaders/")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

