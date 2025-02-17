//
//  SearchHistoryWorker.swift
//  iTunesYapDatabaseCleanSwift
//
//  Created by Ибрагим Габибли on 17.02.2025.
//

import Foundation

final class SearchHistoryWorker: SearchHistoryWorkerProtocol {
    var storageManager: StorageManagerProtocol

    init(storageManager: StorageManagerProtocol) {
        self.storageManager = storageManager
    }

    func loadSearchHistory() -> [String] {
        let history = storageManager.getSearchHistory()

        return history
    }
}
