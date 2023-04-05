//
//  RecipeDetailViewController.swift
//  SefSensin
//
//  Created by Mehdican Büyükplevne on 23.03.2023.
//

import UIKit


class RecipeDetailViewController: UIViewController {
    
    // MARK: - Properties
    private var data = WebServiceViewModel()
    var viewModel: Recipe?
    
    // MARK: - Outlets
    @IBOutlet weak var foodHeaderImageView: UIImageView!
    @IBOutlet weak var seperatorView: UIView!
    @IBOutlet weak var desingableView: UIView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodMinLabel: UILabel!
    @IBOutlet weak var foodKcalLabel: UILabel!
    @IBOutlet weak var selectSegmented: UISegmentedControl!
    @IBOutlet weak var directions: UITextView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        configure(model: viewModel!)
        selectSegmented.selectedSegmentIndex = 0
        directions.text = viewModel?.recipeIngredients.joined(separator: "\n\n")
        desingableView.translatesAutoresizingMaskIntoConstraints = false
        desingableView.layer.cornerRadius = 20
        seperatorView.layer.cornerRadius = 20
    }
    
    // MARK: - Configure
    public func configure(model: Recipe) {
        foodHeaderImageView.setImage(with: model.foodDetailImage)
        foodNameLabel.text = model.foodName
        foodMinLabel.text = model.cookingTime
        foodKcalLabel.text = "\(model.calories) Kcal"
    }
    
    // MARK: - Segmented Controller Action
    @IBAction func detailSegmented(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            directions.text = viewModel?.recipeIngredients.joined(separator: "\n\n")
        case 1:
            directions.text = viewModel?.recipeMaking.joined(separator: "\n\n")
        default:
            break
        }
    }
}
