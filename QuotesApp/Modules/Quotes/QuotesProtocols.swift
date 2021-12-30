//
//  QuotesProtocols.swift
//  QuotesApp
//
//  Created by Boris Bolshakov on 30.12.21.
//

import UIKit

protocol QuotesPresenterToViewProtocol: AnyObject {
    func showQuotes()
    func showError()
    func setupTableView()
}

protocol QuotesInteractorToPresenterProtocol: AnyObject {
    func quotesFetched()
    func quotesFetchedFailed()
}

protocol QuotesPresentorToInteractorProtocol: AnyObject {
    var presenter: QuotesInteractorToPresenterProtocol? { get set }
    var quotes: [Quote?] { get }
    
    func fetchQuotes()
}

protocol QuotesViewToPresenterProtocol: AnyObject {
    var view: QuotesPresenterToViewProtocol? { get set }
    var interactor: QuotesPresentorToInteractorProtocol? { get set }
    var router: QuotesPresenterToRouterProtocol? { get set }

    func updateView()
    func getQuotesCount() -> Int?
    func getQuotes(index: Int) -> Quote?
}

protocol QuotesPresenterToRouterProtocol: AnyObject {
    static func createModule() -> UINavigationController
}
