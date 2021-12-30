//
//  QuotesRouter.swift
//  QuotesApp
//
//  Created by Boris Bolshakov on 30.12.21.
//

import UIKit

final class QuotesRouter: QuotesPresenterToRouterProtocol{
    
    class func createModule() -> UINavigationController {
        
        let view = QuotesViewController()
        let navigationController = UINavigationController(rootViewController: view)
        
        let presenter: QuotesViewToPresenterProtocol & QuotesInteractorToPresenterProtocol = QuotesPresenter()
        
        let interactor: QuotesPresentorToInteractorProtocol = QuotesInteractor()
        let router: QuotesPresenterToRouterProtocol = QuotesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return navigationController
    }
    
}
