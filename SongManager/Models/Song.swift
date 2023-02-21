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
    let genre: Genre
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
