import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
         NavigationStack {
            VStack(alignment: .center, spacing: 0) {
                Text("Hello brave adventurer!")
                    .font(.system(size: 32))
                    .padding(.bottom, 30)
                    .padding(.top, 20)
                Image("lumii_no_background")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding(.top, 30)
                NavigationLink(destination: TimeOfMomentView()) {
                    VStack {
                        Text("Capture a difficult moment")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20, weight: .bold))
                            .padding(.horizontal, 32)
                            .padding(.vertical, 8)
                        Text("Express and capture your raw emotions during difficult or beautiful moments in your life.")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                            .padding(.vertical, 8)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.white, lineWidth: 2)
                    )
                    .frame(maxWidth: 350)
                }
                .buttonStyle(.plain)
            }
            .frame(minWidth: 1000, minHeight: 600, maxHeight: .infinity, alignment: .center)
            .padding(.top, 50)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
