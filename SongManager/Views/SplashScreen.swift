//
//  SplashScreen.swift
//  SongManager
//
//  Created by Patrick Alves on 23.02.23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var opacity = 0.5
    @State private var scale = 0.8
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Image(systemName: "music.quarternote.3")
                    .font(.system(size: 100))
                    .foregroundColor(Color("AppColor"))
                    .opacity(opacity)
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            opacity = 1.0
                            scale = 1.0
                        }
                    }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
