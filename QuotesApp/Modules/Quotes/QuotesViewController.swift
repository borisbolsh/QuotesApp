//
//  QuotesViewController.swift
//  QuotesApp
//
//  Created by Boris Bolshakov on 30.12.21.
//

import UIKit

final class QuotesViewController: UIViewController {
    
    var presenter: QuotesViewToPresenterProtocol?
    private let tableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        presenter?.updateView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
}

extension QuotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getQuotesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let dataCell = presenter?.getQuotes(index: indexPath.row)
        cell.textLabel?.text = dataCell?.quote
        return cell
    }
}

extension QuotesViewController: UITableViewDelegate {
    
}

extension QuotesViewController: QuotesPresenterToViewProtocol {
 
    func showQuotes() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError() {
        print("error")
    }
    
    func setupTableView() {
        view.addSubview(self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self

    }
    
}

