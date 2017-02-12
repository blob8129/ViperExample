//
//  RecipeSearchTVC.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 10/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class RecipeSearchTVC: UITableViewController {

    var presenter: RecipeSearchPresenterInput?
    private var timer: Timer?

    private let searchController = UISearchController(searchResultsController: nil)
    fileprivate let activityIndicator: UIActivityIndicatorView = { indicator in
        indicator.color = .red
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true
        return indicator
    }(UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge))
    
    private func setSearch() {
        searchController.dimsBackgroundDuringPresentation = false
        searchController.loadViewIfNeeded()
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearch()
    
      //  navigationItem.titleView = activityIndicator
      //  navigationController?.setToolbarHidden(true, animated: true)
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace,
                                    target: nil,
                                    action: nil)
        let item = UIBarButtonItem(customView: activityIndicator)
        setToolbarItems([space, item, space], animated: false)
    }
}

extension RecipeSearchTVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        presenter?.searchTermChanged(to: searchController.searchBar.text!)
    }
}

extension RecipeSearchTVC { // UITableView DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        cell.textLabel?.text = presenter?.titleFor(row: indexPath.row)
        cell.imageView?.image = presenter?.imageFor(row: indexPath.row) 
        return cell 
    }
}

extension RecipeSearchTVC { // UITableView Delegate
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter?.willDisplayCellFor(row: indexPath.row)
    }
}

extension RecipeSearchTVC: RecipeSearchPresenterOutput {
    
    func update() {
        tableView.reloadData()
    }
    
    func update(row: Int) {
        tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .none)
    }
    
    func showActivityIndictor() {
        navigationController?.setToolbarHidden(false, animated: true)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndictor() {
        navigationController?.setToolbarHidden(true, animated: true)
        activityIndicator.stopAnimating()
    }
}
