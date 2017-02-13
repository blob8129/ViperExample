//
//  RecipeDetailsVC.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 13/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class RecipeDetailsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        // Dispose of any resources that can be recreated.
    }

    @IBAction func infoAction(_ sender: Any) {
        
    }
}

extension RecipeDetailsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath)
        
        return cell
    }
}

