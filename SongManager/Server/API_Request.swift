//
//  API_Request.swift
//  SongManager
//
//  Created by Patrick Alves on 25.02.23.
//

import Foundation
import Combine

public class API_Request {
    public func getAlbumData(method: String, artist: String, song: String) {
        let api_key = "4f2e17301459a08ec39eefc446f15d8f"
        let album = song
        let format = "json"
        
        var cancellables = Set<AnyCancellable>()
        
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "ws.audioscrobbler.com"
        components.path = "/2.0/"
        
        let queryItemMethod = URLQueryItem(name: "method", value: method)
        let queryItemAPIKey = URLQueryItem(name: "api_key", value: api_key)
        let queryItemArtist = URLQueryItem(name: "artist", value: artist)
        let queryItemSong = URLQueryItem(name: "album", value: album)
        let queryItemFormat = URLQueryItem(name: "format", value: format)
        
        let queryItems = [queryItemMethod, queryItemAPIKey, queryItemArtist, queryItemSong, queryItemFormat]
        
        components.queryItems = queryItems
        
        guard let url = components.url else { return }
        print(url)
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map{$0.data}
            .decode(type: Album.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                case .finished:
                    print("finished")
                }
            } receiveValue: { album in
                let songs = Song(album: album)
                print(songs.artist)
            }
            .store(in: &cancellables)
    }
}
