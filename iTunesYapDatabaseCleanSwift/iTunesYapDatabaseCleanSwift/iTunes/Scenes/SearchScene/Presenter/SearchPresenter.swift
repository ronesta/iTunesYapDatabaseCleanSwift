//
//  SearchPresenter.swift
//  iTunesYapDatabaseCleanSwift
//
//  Created by Ибрагим Габибли on 17.02.2025.
//

import Foundation

final class SearchPresenter: SearchPresenterProtocol {
    weak var viewController: SearchViewProtocol?

    func presentAlbums(response: Search.Response) {
        let viewModel = Search.ViewModel(albums: response.albums)
        viewController?.displayAlbums(viewModel: viewModel)
    }

    func presentError(_ message: String) {
        viewController?.displayError(message)
    }
}
