//
//  QuotesInteractor.swift
//  QuotesApp
//
//  Created by Boris Bolshakov on 30.12.21.
//

import UIKit

final class QuotesInteractor: QuotesPresentorToInteractorProtocol {

    // MARK: - Properties
    weak var presenter: QuotesInteractorToPresenterProtocol?
    var quotes: [Quote?] = []
    
    // MARK: - Methods
    func fetchQuotes() {
        let url = URL(string: "https://thesimpsonsquoteapi.glitch.me/quotes?count=10")!
       
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    print(error)
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode([Quote].self, from: data)
                self.quotes = result
                self.presenter?.quotesFetched()
            } catch {
                print(error)
            }
        }
        task.resume()
        
    }
}
