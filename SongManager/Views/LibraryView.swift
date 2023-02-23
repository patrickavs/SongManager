//
//  LibraryView.swift
//  SongManager
//
//  Created by Patrick Alves on 23.02.23.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(1...10, id: \.self) { index in
                    Text("Song \(index)")
                }
                .onDelete { indexSet in
                    print("onDelete")
                }
                .onMove { indexSet, index in
                    print("onMove")
                }
            }
            .listStyle(.inset)
            .navigationTitle("Library")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
