//
//  LibraryView.swift
//  SongManager
//
//  Created by Patrick Alves on 23.02.23.
//

import SwiftUI
import SlidingTabView

struct LibraryView: View {
    @ObservedObject var vm: SongManagerViewModel
    @State private var tabIndex = 0
    @State private var navigationbarTapped = false
    @Binding var tabbarInvisisble: Bool
    @Binding var closeMiniPlayer: Bool
    var body: some View {
        NavigationStack {
            ZStack {
                MainLibraryView(tabIndex: $tabIndex)
                SideBarView(toolbarTapped: $navigationbarTapped, tabbarInvisisble: $tabbarInvisisble, closeMiniPlayer: $closeMiniPlayer)
            }
            //.opacity(toolbarTapped ? 0.2 : 1)
            .navigationTitle("SongManager")
            .toolbar(navigationbarTapped ? .hidden : .visible, for: .navigationBar)
            .toolbar(tabbarInvisisble ? .hidden : .visible, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            navigationbarTapped = true
                            tabbarInvisisble = true
                            closeMiniPlayer = true
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(Color("AppColor"))
                    }
                }
            }
        }
    }
}

struct MainLibraryView: View {
    @Binding var tabIndex: Int
    //@Binding var toolbarTapped: Bool
    //@Binding var tabbarInvisisble: Bool
    //@Binding var closeMiniPlayer: Bool
    var tabs: [String] = ["Songs", "Playlists", "Artists"]
    var body: some View {
        VStack {
            SlidingTabView(selection: $tabIndex, tabs: tabs, animation: .easeInOut, activeAccentColor: Color("AppColor"), selectionBarColor: Color("AppColor"))
            
            Spacer()
            
            switch tabIndex {
            case 0:
                Text("Songs")
            case 1:
                PlaylistView()
            case 2:
                Text("Artists")
            default:
                Text("")
            }
            
            Spacer()
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView(vm: SongManagerViewModel(), tabbarInvisisble: .constant(true), closeMiniPlayer: .constant(true))
    }
}
