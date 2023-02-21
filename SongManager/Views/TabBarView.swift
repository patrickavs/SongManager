//
//  TabBar.swift
//  SongManager
//
//  Created by Patrick Alves on 20.02.23.
//

import SwiftUI

struct TabBarView: View {
    @State private var current = 2
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                TabView(selection: $current) {
                    Text("Library")
                        .tag(0)
                        .tabItem {
                            Label("Library", systemImage: "rectangle.stack.fill")
                        }
                    
                    Text("Playlist")
                        .tag(1)
                        .tabItem {
                            Label("Playlist", systemImage: "play.rectangle.on.rectangle.fill")
                        }
                    
                    Text("Radio")
                        .tag(2)
                        .tabItem {
                            Label("Radio", systemImage: "dot.radiowaves.left.and.right")
                        }
                    
                    SearchView()
                        .tag(3)
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                }
                .tint(Color("AppColor"))
                
                MiniPlayer()
                    .frame(height: 80)
                    .padding(.bottom, proxy.safeAreaInsets.bottom)
                    .padding(.bottom)
                    .onTapGesture {
                        print("Miniplayer tapped")
                    }
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
