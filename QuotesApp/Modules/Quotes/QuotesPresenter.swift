//
//  QuotesPresenter.swift
//  QuotesApp
//
//  Created by Boris Bolshakov on 29.12.21.
//

import UIKit

final class QuotesPresenter: QuotesViewToPresenterProtocol {

    // MARK: - Properties
    weak var view: QuotesPresenterToViewProtocol?
    var interactor: QuotesPresentorToInteractorProtocol?
    var router: QuotesPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateView() {
        interactor?.fetchQuotes()
    }
    
    func getQuotesCount() -> Int? {
        return interactor?.quotes.count
    }
    
    func getQuotes(index: Int) -> Quote? {
        return interactor?.quotes[index]
    }
}

// MARK: - LiveNewsListInteractorToPresenterProtocol
extension QuotesPresenter: QuotesInteractorToPresenterProtocol {
    func quotesFetched() {
        view?.showQuotes()
    }
    
    func quotesFetchedFailed() {
        view?.showError()
    }
    
}
