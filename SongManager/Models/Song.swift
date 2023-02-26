//
//  Song.swift
//  SongManager
//
//  Created by Patrick Alves on 20.02.23.
//

import Foundation

struct Song: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let image: String
    
    init(album: Album) {
        self.title = album.album.name
        self.artist = album.album.artist
        self.image = album.album.image.first?.text ?? "No image available"
    }
}

enum Genre: CaseIterable {
    case rock
    case pop
    case techno
    case jazz
    case hiphop
    case classic
    case metal
    case soul
}
