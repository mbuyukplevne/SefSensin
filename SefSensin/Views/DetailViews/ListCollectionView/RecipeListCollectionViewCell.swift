//
//  RecipeListCollectionViewCell.swift
//  SefSensin
//
//  Created by Mehdican Büyükplevne on 24.03.2023.
//

import UIKit

class RecipeListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    static let identifier = "RecipeListCollectionViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var designableView: UIView!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var kcalLabel: UILabel!
    
    // MARK: - Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        designableView.layer.cornerRadius = 30
        foodImage.layer.cornerRadius = 20
    }
    
    // MARK: - Nib Func.
    static func nib() -> UINib {
        return UINib(nibName: "RecipeListCollectionViewCell", bundle: nil)
    }
    
    // MARK: - RecipeListViewController Config
    public func configure(model: Recipe) {
        foodImage.setImage(with: model.foodImage)
        foodName.text = model.foodName
        minLabel.text = model.cookingTime
        kcalLabel.text = "\(model.calories) Kcal"
    }
}
