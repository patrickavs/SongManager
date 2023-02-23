//
//  TabBar.swift
//  SongManager
//
//  Created by Patrick Alves on 20.02.23.
//

import SwiftUI

struct TabBarView: View {
    @State private var current = 2
    @State private var expand = false
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                TabView(selection: $current) {
                    if !expand {
                        LibraryView()
                            .tag(0)
                            .tabItem {
                                Label("Library", systemImage: "rectangle.stack.fill")
                            }
                        
                        PlaylistView()
                            .tag(1)
                            .tabItem {
                                Label("Playlist", systemImage: "play.rectangle.on.rectangle.fill")
                            }
                        
                        RadioView()
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
                }
                .tint(Color("AppColor"))
                
                MiniPlayer(expand: $expand)
                    .padding(.bottom, !expand ? proxy.safeAreaInsets.bottom - 2 : 0)
                    .padding(!expand ? .bottom : .init(rawValue: 0))
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
