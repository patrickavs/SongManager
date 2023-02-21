//
//  MiniPlayer.swift
//  SongManager
//
//  Created by Patrick Alves on 20.02.23.
//

import SwiftUI

struct MiniPlayer: View {
    var body: some View {
        VStack {
            HStack {
                Image("david")
                    .resizable()
                    .offset(y: 12)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            }
        }
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayer()
    }
}
