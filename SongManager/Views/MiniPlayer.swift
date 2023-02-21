//
//  MiniPlayer.swift
//  SongManager
//
//  Created by Patrick Alves on 20.02.23.
//

import SwiftUI

struct MiniPlayer: View {
    @State private var artistName = "David Guetta"
    @State private var songTitle = "Lovers on the Sun"
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image("david")
                    .resizable()
                    .offset(y: 13)
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
                        .foregroundColor(.primary)
                }
                
                Button(action: {}) {
                    Image(systemName: "pause.fill")
                        .font(.title)
                        .foregroundColor(.primary)
                }
                
                Button(action: {}) {
                    Image(systemName: "arrow.right.to.line")
                        .font(.title)
                        .foregroundColor(.primary)
                }
            }
            .padding(.vertical)
            .background(BlurView())
        }
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayer()
    }
}
