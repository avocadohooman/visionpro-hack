import SwiftUI

struct DescribeMoment: View {
    @State private var momentDescription: String = "" // State for text input
    private let maxLength = 500 // Maximum character limit
    @FocusState private var isFocused: Bool // Focus state for TextEditor

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .opacity(0.1)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isFocused = false // Dismiss keyboard
                    }
                
                VStack(spacing: 20) {
                    Text("Describe the Situation")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)

                    Text("Guiding Questions:")
                        .font(.headline)
                        .padding(.bottom, 5)

                    VStack(spacing: 10) {
                        Text("1) What happened?")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text("2) What was your need in this situation?")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    TextEditor(text: $momentDescription)
                        .focused($isFocused) // Bind focus state
                        .frame(height: 200)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .frame(width: 600)
                        .onChange(of: momentDescription) { newValue in
                            // Ensure the text doesn't exceed maxLength
                            if newValue.count > maxLength {
                                momentDescription = String(newValue.prefix(maxLength))
                            }
                        }

                    HStack {
                        Text("\(momentDescription.count)/\(maxLength) letters")
                            .font(.footnote)
                            .foregroundColor(momentDescription.count == maxLength ? .red : .gray)
                    }
                    
                    ZStack {
                        if !momentDescription.isEmpty {
                            NavigationLink(destination: TransformAndShowVideo()) {
                                Text("Continue")
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                    .frame(height: 40)
                    Spacer()
                }
                .padding(.top, 100)
                .frame(maxWidth: .infinity, alignment: .top)
            }
        }
    }
}

#Preview {
    DescribeMoment()
        .environment(AppModel())
}
