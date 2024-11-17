import SwiftUI
import AVKit

struct TransformAndShowVideo: View {
    @State private var isTransforming = true // State to manage loading and video display

    var body: some View {
        ZStack {
            if isTransforming {
                // Loading Screen
                VStack {
                    Text("Transforming moment into fictional story...")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .padding()

                    // Simple Animation
                    ProgressView()
                        .scaleEffect(1.5)
                        .padding(.top, 20)
                }
                .transition(.opacity)
                .onAppear {
                    // Wait for 5 seconds, then switch to video
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation {
                            isTransforming = false
                        }
                    }
                }
            } else {
                // Video Player
                VideoPlayer(player: AVPlayer(url: URL(string: "https://storage.googleapis.com/lumii-media/video/yc_demo_2.mov")!))
                    .ignoresSafeArea()
            }
        }
        .background(Color(.systemBackground))
    }
}

#Preview {
    TransformAndShowVideo()
        .environment(AppModel())
}
