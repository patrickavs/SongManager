//
//  LibraryView.swift
//  SongManager
//
//  Created by Patrick Alves on 23.02.23.
//

import SwiftUI

struct LibraryView: View {
    @Namespace var topID
    @Namespace var bottomID
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Button {
                    withAnimation {
                        proxy.scrollTo(bottomID)
                    }
                } label: {
                    Text("scrollBottom")
                }
                .id(topID)
                
                VStack {
                    ForEach(1...100, id: \.self) { index in
                        Text("Song \(index)")
                    }
                    .onDelete { indexSet in
                        print("onDelete")
                    }
                    .onMove { indexSet, index in
                        print("onMove")
                    }
                }
                
                Button {
                    withAnimation {
                        proxy.scrollTo(topID)
                    }
                } label: {
                    Text("scrollTop")
                }
                .id(bottomID)
            }
            
            //.navigationTitle("Library")
            /*.toolbar {
             ToolbarItem(placement: .navigationBarTrailing) {
             EditButton()
             }
             
             ToolbarItem(placement: .navigationBarLeading) {
             Button {
             proxy.scrollTo(bottomID)
             } label: {
             Text("Scroll to Bottom")
             }
             .id(topID)
             }
             
             ToolbarItem(placement: .bottomBar) {
             Button {
             proxy.scrollTo(topID)
             } label: {
             Text("scroll to top")
             }
             .id(bottomID)
             }
             }*/
        }
    }
}


struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
