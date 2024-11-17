//
//  TimeOfMomentView.swift
//  visionpro
//
//  Created by Gerhard Molin on 16.11.2024.
//

import SwiftUI

struct TimeOfMomentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Did this moment happen today?")
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
            
            HStack(spacing: 16) {
                NavigationLink(destination: ChooseEmotionView()) {
                    Text("Yes")
                }
                .buttonStyle(.bordered)
                
                NavigationLink(destination: ChooseEmotionView()) {
                    Text("No")
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    TimeOfMomentView()
		.environment(AppModel())
}
