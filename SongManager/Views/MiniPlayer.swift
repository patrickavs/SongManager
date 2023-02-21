//
//  MiniPlayer.swift
//  SongManager
//
//  Created by Patrick Alves on 20.02.23.
//

import SwiftUI

/// Miniplayer for current song
struct MiniPlayer: View {
    @State private var artistName = "Paddi Maddi"
    @State private var songTitle = "Moood"
    @State private var pauseButton = false
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image("p2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(artistName)
                        .font(.title2)
                    Text(songTitle)
                        .font(.callout)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "arrow.left.to.line")
                        .font(.title)
                        .foregroundColor(Color("AppColor"))
                }
                
                Button {
                    pauseButton.toggle()
                } label: {
                    Image(systemName: pauseButton ? "pause.fill" : "play.fill")
                        .font(.title)
                        .foregroundColor(Color("AppColor"))
                }
                
                Button(action: {}) {
                    Image(systemName: "arrow.right.to.line")
                        .font(.title)
                        .foregroundColor(Color("AppColor"))
                }
            }
            .padding(.vertical)
            .padding(.horizontal, 10)
            .background(
                VStack(spacing: 0) {
                    BlurView()
                    
                    Divider()
                })
        }
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayer()
    }
}
