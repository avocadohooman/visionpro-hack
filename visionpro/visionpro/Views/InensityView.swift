import SwiftUI

struct IntensityView: View {
    @State private var intensity: CGFloat = 0.0 // Initial intensity (0.0 to 1.0)
    @State private var pointB: CGPoint = CGPoint(x: 250, y: 250) // Control point centered
    
    @State private var showContinueButton: Bool = false

    let emotion: String // Passed in as a parameter

    var body: some View {
        NavigationStack {
            
            ZStack {
                VStack {
                    Text("How intense was the emotion?") // Fixed typo in "emotion"
                        .font(.system(size: 32, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                    Text("Drag the point away from the center to increase intensity")
                        .font(.system(size: 28, weight: .medium))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                    ZStack {
                        // Orb
                        Circle()
                            .fill(dynamicOrbColor(for: intensity))
                            .frame(width: 150 + intensity * 300, height: 150 + intensity * 300)
                            .shadow(color: dynamicOrbColor(for: intensity).opacity(0.8), radius: 40)
                            .offset(
                                x: intensity > 0.7 ? CGFloat.random(in: -5...5) : 0,
                                y: intensity > 0.7 ? CGFloat.random(in: -5...5) : 0
                            ) // Vibration effect
                            .animation(
                                intensity > 0.7 ? .easeInOut(duration: 0.1).repeatForever(autoreverses: true) : .default,
                                value: intensity
                            )
                        
                        // Intensity Label
                        Text(intensityLabel(for: intensity))
                            .font(intensity <= 0.25 ? .title3 : .title2)
                            .foregroundColor(.black)                            .padding(.top, 16)
                        
                        // Control point that can be dragged away from center
                        Circle()
                            .fill(Color.white)
                            .frame(width: 30, height: 30)
                            .position(pointB)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        pointB = value.location
                                        updateIntensity()
                                    }
                                    .onEnded { value in
                                        showContinueButton = true
                                    }
                            )
                    }
                    .frame(width: 600, height: 600) // Larger frame for drag area
                    
                    // Fixed height container for continue button
                    ZStack {
                        if showContinueButton {
                            NavigationLink(destination: DescribeMoment()                             ) {
                                Text("Continue")                            }
                            .buttonStyle(.bordered)
                        }
                    }
                    .frame(height: 40) // Fixed height for button area
                    
                }
            }
        }
    }

    // Update intensity based on distance from center
    private func updateIntensity() {
        let center = CGPoint(x: 300, y: 300) // Center of the frame
        let distance = sqrt(pow(pointB.x - center.x, 2) + pow(pointB.y - center.y, 2))
        let maxDistance: CGFloat = 300 // Maximum possible distance from center
        
        withAnimation(.easeInOut) {
            intensity = min(distance / maxDistance, 1.0)
        }
    }

    // Dynamic orb color based on intensity and emotion
    private func dynamicOrbColor(for intensity: CGFloat) -> Color {
        let baseColor = ThemeService.getColor(for: emotion)
        return baseColor.opacity(0.7 + intensity * 0.3)
    }

    // Label for intensity levels
    private func intensityLabel(for intensity: CGFloat) -> String {
        switch intensity {
        case 0.0..<0.25: return "Slightly Intense"
        case 0.25..<0.5: return "Intense"
        case 0.5..<0.75: return "Very Intense"
        default: return "Overwhelming"
        }
    }
}

#Preview {
    IntensityView(emotion: "joy")
        .environment(AppModel())
}
