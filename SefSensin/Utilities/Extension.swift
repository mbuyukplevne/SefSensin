//
//  Extension.swift
//  SefSensin
//
//  Created by Mehdican Büyükplevne on 23.03.2023.
//

import UIKit
import Kingfisher

// MARK: - Fetch Storage Images
extension UIImageView {
    func setImage(with urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}

