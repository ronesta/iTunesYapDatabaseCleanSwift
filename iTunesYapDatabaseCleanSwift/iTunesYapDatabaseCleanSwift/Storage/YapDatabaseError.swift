//
//  YapDatabaseError.swift
//  iTunesYapDatabaseCleanSwift
//
//  Created by Ибрагим Габибли on 12.02.2025.
//

import Foundation

enum YapDatabaseError: Error {
    case databaseInitializationFailed
    case encodingFailed(Error)
    case decodingFailed(Error)
}
