//
//  ShaZaMView.swift
//  SongManager
//
//  Created by Patrick Alves on 23.02.23.
//

import SwiftUI

struct ShaZaMView: View {
    @State private var recognizing = false
    var body: some View {
        VStack {
            Image(systemName: "dot.radiowaves.left.and.right")
                .font(.system(size: 150))
                .foregroundColor(Color("AppColor"))
                .scaleEffect(recognizing ? 1.5 : 1.0)
                .onTapGesture {
                    withAnimation {
                        recognizing.toggle()
                    }
                }
        }
    }
}

struct ShaZaMView_Previews: PreviewProvider {
    static var previews: some View {
        ShaZaMView()
    }
}
