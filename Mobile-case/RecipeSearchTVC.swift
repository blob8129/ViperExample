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
    var timer: Timer?
    
    private let searchController = UISearchController(searchResultsController: nil)

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
    }
    
    func searchTermChanged() {
        let text = searchController.searchBar.text!
        presenter?.searchTermChanged(to: text)
        print("timer for text \(text)")
    }
    
    fileprivate func debounceAndSerch() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(searchTermChanged),
                                     userInfo: nil, repeats: false)
        RunLoop.main.add(timer!, forMode: .commonModes)
    }
}

extension RecipeSearchTVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text!
        text == "" ?
            presenter?.searchTermChanged(to: text) : debounceAndSerch()
    }
}

extension RecipeSearchTVC { // UITableView DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        cell.textLabel?.text = presenter?.titleFor(row: indexPath.row) 
        return cell 
    }
}

extension RecipeSearchTVC: RecipeSearchPresenterOutput {
    
    func update() {
        tableView.reloadData()
    }
}
