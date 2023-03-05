//
//  VM.swift
//  SongManager
//
//  Created by Patrick Alves on 20.02.23.
//

import Foundation
import Combine

final class SongManagerViewModel: ObservableObject {
    @Published var songs: [Song] = []
    let api = API_Request()
    fileprivate var subscription : AnyCancellable!
    
    init() {
        
    }
    
    func getAlbumInfo() {
        api.getAlbumData(method: "album.getinfo", artist: "Cher", song: "Believe")
    }
}
