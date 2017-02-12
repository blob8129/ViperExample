//
//  RecipeSearchPresenterOutput.swift
//  Mobile-case
//
//  Created by Andrey Volobuev on 12/02/2017.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation


protocol RecipeSearchPresenterOutput: class {
    func update()
    func update(row: Int)
    func showActivityIndictor()
    func hideActivityIndictor()
}
