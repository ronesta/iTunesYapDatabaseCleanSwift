//
//  SearchWorker.swift
//  iTunesYapDatabaseCleanSwift
//
//  Created by Ибрагим Габибли on 17.02.2025.
//

import Foundation
import UIKit

final class SearchWorker: SearchWorkerProtocol {
    var networkManager: NetworkManagerProtocol
    var storageManager: StorageManagerProtocol

    init(networkManager: NetworkManagerProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.networkManager = networkManager
        self.storageManager = storageManager
    }

    func searchAlbums(with term: String, completion: @escaping (Result<[Album], Error>) -> Void) {
        let savedAlbums = storageManager.loadAlbums(forTerm: term)
        if !savedAlbums.isEmpty {
            completion(.success(savedAlbums))
            return
        }

        networkManager.loadAlbums(albumName: term) { [weak self] result in
            guard let self else {
                return
            }

            switch result {
            case .success(let albums):
                DispatchQueue.main.async {
                    let sortedAlbums = albums.sorted { $0.collectionName < $1.collectionName }
                    completion(.success(sortedAlbums))
                    self.storageManager.saveAlbums(sortedAlbums)
                    self.storageManager.saveAlbumsForSearchQuery(albums: sortedAlbums, term)
                    print("Successfully loaded \(albums.count) albums.")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

    func loadImage(for album: Album, completion: @escaping (UIImage?) -> Void) {
        networkManager.loadImage(from: album.artworkUrl100, completion: completion)
    }
}
