//
//  Album.swift
//  SongManager
//
//  Created by Patrick Alves on 25.02.23.
//

import Foundation

// MARK: - Album
struct Album: Codable {
    let album: AlbumClass
}

// MARK: - AlbumClass
struct AlbumClass: Codable {
    let artist: String
    let mbid: String
    let tags: Tags
    let playcount: String
    let image: [AlbumImage]
    let tracks: Tracks
    let url: String
    let name, listeners: String
    let wiki: Wiki
}

// MARK: - Image
struct AlbumImage: Codable {
    let size: String
    let text: String

    enum CodingKeys: String, CodingKey {
        case size
        case text = "#text"
    }
}

// MARK: - Tags
struct Tags: Codable {
    let tag: [Tag]
}

// MARK: - Tag
struct Tag: Codable {
    let url: String
    let name: String
}

// MARK: - Tracks
struct Tracks: Codable {
    let track: [Track]
}

// MARK: - Track
struct Track: Codable {
    let streamable: Streamable
    let duration: Int
    let url: String
    let name: String
    let attr: Attr
    let artist: ArtistClass

    enum CodingKeys: String, CodingKey {
        case streamable, duration, url, name
        case attr = "@attr"
        case artist
    }
}

// MARK: - ArtistClass
struct ArtistClass: Codable {
    let url: String
    let name: String
    let mbid: String
}

// MARK: - Attr
struct Attr: Codable {
    let rank: Int
}

// MARK: - Streamable
struct Streamable: Codable {
    let fulltrack, text: String

    enum CodingKeys: String, CodingKey {
        case fulltrack
        case text = "#text"
    }
}

// MARK: - Wiki
struct Wiki: Codable {
    let published, summary, content: String
}
