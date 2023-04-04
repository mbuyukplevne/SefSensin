//
//  SearchTableViewCell.swift
//  SefSensin
//
//  Created by Mehdican Büyükplevne on 25.03.2023.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    // MARK: Identifier
    static let identifier = "SearchTableViewCell"
    
    // MARK: Outlets
    @IBOutlet weak var searchFoodNameLabel: UILabel!
    @IBOutlet weak var searchFoodImage: UIImageView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var kcalLabel: UILabel!
    
    // MARK: Nib Func.
    static func nib() -> UINib {
        return UINib(nibName: "SearchTableViewCell", bundle: nil)
    }
    
    // MARK: Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        searchView.layer.cornerRadius = 20
        searchFoodImage.layer.cornerRadius = 25
    }
    
    // MARK: Search View Controller Configure
    public func configure(model: Recipe) {
        searchFoodNameLabel.text = model.foodName
        searchFoodImage.setImage(with: model.foodImage)
        minLabel.text = model.cookingTime
        kcalLabel.text = "\(model.calories)"
    }  
}
