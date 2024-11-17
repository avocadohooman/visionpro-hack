import SwiftUI
struct ChooseEmotionView: View {
    let emotions = ["anger", "sadness", "shame", "fear", "joy"] // Image names

    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Text("Which emotion resonates with you the most?")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.primary)
                    .padding(.bottom, 20)

                // Top row: 3 images
                HStack(spacing: 50) {
                    ForEach(emotions.prefix(3), id: \.self) { emotion in
                        EmotionButton(emotion: emotion)
                    }
                }

                // Bottom row: 2 images
                HStack(spacing: 50) {
                    ForEach(emotions.suffix(2), id: \.self) { emotion in
                        EmotionButton(emotion: emotion)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0))
        }
    }
}

struct EmotionButton: View {
    let emotion: String
    @State private var isHovered = false

    var body: some View {
        NavigationLink(destination: IntensityView(emotion: emotion)) {
            VStack {
                Image(emotion)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: isHovered ? 220 : 200, height: isHovered ? 220 : 200) // Scale up
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .scaleEffect(isHovered ? 1.1 : 1.0) // Additional scaling
                    .animation(.easeInOut(duration: 0.3), value: isHovered)

                Text(emotion.capitalized)
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.primary)
                    .padding(.top, 8)
            }
            .onHover { hovering in
                isHovered = hovering
            }
            .focusable(true) // Enables focus for VisionOS
        }
        .buttonStyle(.plain) // Prevents default button styling
    }
}

struct EmotionDetailView: View {
    let emotion: String

    var body: some View {
        VStack {
            Text("\(emotion.capitalized) Details")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ThemeService.getColor(for: emotion))
    }
}

#Preview(windowStyle: .automatic) {
    ChooseEmotionView()
        .environment(AppModel())
}
