//
//  Search.swift
//  iTunesYapDatabaseCleanSwift
//
//  Created by Ибрагим Габибли on 17.02.2025.
//

import Foundation

enum Search {
    struct Request {
        var searchTerm: String
    }

    struct Response {
        var albums: [Album]
    }

    struct ViewModel {
        var albums: [Album]
    }
}
