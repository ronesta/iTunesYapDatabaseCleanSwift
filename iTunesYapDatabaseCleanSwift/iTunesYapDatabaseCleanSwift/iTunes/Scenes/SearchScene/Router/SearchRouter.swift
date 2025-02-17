//
//  SearchRouter.swift
//  iTunesYapDatabaseCleanSwift
//
//  Created by Ибрагим Габибли on 17.02.2025.
//

import Foundation

final class SearchRouter: NSObject, SearchRouterProtocol {
    weak var viewController: SearchViewController?

    func routeToAlbumDetail(with album: Album) {
        let albumViewController = AlbumAssembly.build(with: album)
        viewController?.navigationController?.pushViewController(albumViewController, animated: true)
    }
}
