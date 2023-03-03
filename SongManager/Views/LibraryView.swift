//
//  LibraryView.swift
//  SongManager
//
//  Created by Patrick Alves on 23.02.23.
//

import SwiftUI
import SlidingTabView

struct LibraryView: View {
    @State private var tabIndex = 0
    @State private var toolbarTapped = false
    @Binding var tabbarInvisisble: Bool
    @Binding var closeMiniPlayer: Bool
    var tabs: [String] = ["Songs", "Playlists", "Artists"]
    var body: some View {
        NavigationStack {
            ZStack {
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
                //.opacity(toolbarTapped ? 0.2 : 1)
                .navigationTitle("SongManager")
                .toolbar(toolbarTapped ? .hidden : .visible, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                toolbarTapped = true
                                tabbarInvisisble = true
                                closeMiniPlayer = true
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(Color("AppColor"))
                        }
                    }
                }
                SideBarView(toolbarTapped: $toolbarTapped)
                    
            }
        }
    }
}


struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView(tabbarInvisisble: .constant(true), closeMiniPlayer: .constant(true))
    }
}
