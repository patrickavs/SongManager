//
//  VM.swift
//  SongManager
//
//  Created by Patrick Alves on 20.02.23.
//

import Foundation

final class SongManagerViewModel: ObservableObject {
    @Published var songs: [Song] = []
}
