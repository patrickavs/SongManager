//
//  TabBar.swift
//  SongManager
//
//  Created by Patrick Alves on 20.02.23.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var vm: SongManagerViewModel
    @State private var current = 0
    @State private var expand = false
    @State private var closeMiniPlayer = false
    @State private var tabbarInvisisble = false
    @Binding var recognizing: Bool
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                TabView(selection: $current) {
                    if !expand {
                        LibraryView(vm: SongManagerViewModel(), tabbarInvisisble: $tabbarInvisisble, closeMiniPlayer: $closeMiniPlayer)
                            .tag(0)
                            .tabItem {
                                Label("Library", systemImage: "rectangle.stack.fill")
                            }
                        
                        RadioView()
                            .tag(1)
                            .tabItem {
                                Label("Radio", systemImage: "dot.radiowaves.left.and.right")
                            }
                        
                        ShaZaMView()
                            .tag(2)
                            .tabItem {
                                Label("ShaZaM", systemImage: "iphone.homebutton.radiowaves.left.and.right")
                            }
                        
                        SearchView()
                            .tag(3)
                            .tabItem {
                                Label("Search", systemImage: "magnifyingglass")
                            }
                    }
                }
                .tint(Color("AppColor"))
                
                MiniPlayer(expand: $expand, closeMiniPlayer: $closeMiniPlayer, recognizing: $recognizing)
                    .padding(.bottom, !expand ? proxy.safeAreaInsets.bottom - 2 : 0)
                    .padding(!expand ? .bottom : .init(rawValue: 0))
                    .opacity(closeMiniPlayer ? 0 : 1)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(vm: SongManagerViewModel(), recognizing: .constant(true))
    }
}
