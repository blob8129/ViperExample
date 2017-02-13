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

       // self.title = recipe.title
        presenter?.viewDidLoad()
    //    self.publisherNameLabel.text = recipe.publisher
   //     self.socialRankLabel.text = "Social rank: \(String(format: "%.2f", recipe.socialRank))"
//        service.loadData(url: recipe.imageUrl) { result in
//            switch result {
//            case .sucess(let data, _):
//                let image = UIImage(data: data)
//                DispatchQueue.main.sync {
//                    self.recipeImageView.image = image
//                }
//            case .error(let error):
//                break
//            }
//        }
        
        
//        service.loadRecipeBy(id: recipe.recipeId) { result in
//            switch result {
//            case .sucess(let data, _):
//                let recipieById = try! Resourse<RecipeById>(data: data).getItem()
//                DispatchQueue.main.sync {
//                    recipieById.ingredients.map {
//                        let label = UILabel()
//                        label.text = $0
//                     //   self.ingredientsStackView.remove
//                        self.ingredientsStackView.addArrangedSubview(label)
//                    }
//                }
//            case .error(let error):
//                break
//            }
//        }
    }

    @IBAction func instructiosAction(_ sender: UIButton) {
     //   UIApplication.shared.openURL(recipe.instructions)
    }

    @IBAction func originalAction(_ sender: UIButton) {
     //   UIApplication.shared.openURL(recipe.original)
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
}
