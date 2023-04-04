//
//  SettingsTableViewCell.swift
//  SefSensin
//
//  Created by Mehdican Büyükplevne on 1.03.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    static let identifier = "SettingsTableViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var settingsLabelName: UILabel!
    
    // MARK: - Nib Func.
    static func nib() -> UINib {
        return UINib(nibName: "SettingsTableViewCell", bundle: nil)
    }
    
    // MARK: - Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        settingsView.layer.cornerRadius = 8
    }
}
