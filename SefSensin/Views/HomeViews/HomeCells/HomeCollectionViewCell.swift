//
//  HomeCollectionViewCell.swift
//  SefSensin
//
//  Created by Mehdican Büyükplevne on 28.02.2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    static let identifier = "HomeCollectionViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    // MARK: - Nib Func.
    static func nib() -> UINib {
        return UINib(nibName: "HomeCollectionViewCell", bundle: nil)
    }
    
    // MARK: - Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        
    }
    
    // MARK: - Config HomeViewController
    public func configure(config: Kitchen) {
        imageView.setImage(with: config.kitchenImage)
        labelName.text = config.kitchenName
    }
}
