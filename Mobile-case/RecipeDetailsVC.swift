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
    var presenter: RecipeDetailsPresenter?
    
    @IBOutlet weak var publisherNameLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var socialRankLabel: UILabel!
    @IBOutlet weak var ingredientsStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setToolbarHidden(true, animated: false)
        presenter?.viewDidLoad()
    }

    @IBAction func instructiosAction(_ sender: UIButton) {
        if let presenter = presenter {
            UIApplication.shared.openURL(presenter.urlForInstructions())
        }
    }

    @IBAction func originalAction(_ sender: UIButton) {
        if let presenter = presenter {
            UIApplication.shared.openURL(presenter.urlForOriginal())
        }
    }

    deinit {
        print("RecipeDetailsVC denit")
    }
}

extension RecipeDetailsVC: RecipeDetailsPresenterOutput {
    
    func configure(for viewModel: RecipeDetailsViewModel) {
        self.title = viewModel.title
        self.publisherNameLabel.text = viewModel.publisher
        self.socialRankLabel.text = viewModel.socialRank
    }
    
    func show(ingredients: [String]) {
        ingredients.forEach {
            let label = UILabel()
            label.text = $0
            self.ingredientsStackView.addArrangedSubview(label)
        }
    }
    
    func show(image: UIImage?) {
         self.recipeImageView.image = image
    }
    
    func show(message: String) {
        let alert = UIAlertController(title: "Error occured",
                                      message: message,
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}
