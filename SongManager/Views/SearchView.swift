//
//  SearchView.swift
//  SongManager
//
//  Created by Patrick Alves on 21.02.23.
//

import SwiftUI

/// Search-View
struct SearchView: View {
    @State private var searchText = ""
    var colums = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 18) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        
                        TextField("Search", text: $searchText)
                    }
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    
                    LazyVGrid(columns: colums, spacing: 20) {
                        ForEach(1...10, id: \.self) { index in
                            Image("p\(index)")
                                .resizable()
                                .cornerRadius(15)
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 180, alignment: .center)
                            
                        }
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 80)
                    
                }
                .padding()
            }
            .navigationTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
