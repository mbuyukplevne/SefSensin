//
//  AboutViewController.swift
//  SefSensin
//
//  Created by Mehdican Büyükplevne on 28.02.2023.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var aboutMainLabel: UILabel!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var aboutInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutView.layer.cornerRadius = 40
        aboutMainLabel.text = "Şef Sensin"
        aboutInfoLabel.text = " Şef Sensin uygulaması, dünya çapında popüler olan yemek tariflerinin bir araya getirildiği bir platformdur. Aklınıza gelebilecek olan tüm ülkelerdeki yemek tariflerinin içeriklerine ve yapılışlarına tek tıkla ulaşabileceksiniz, Uzun uzun internet üzerinde aramanıza gerek olmadan zengin bir içeriğe erişebileceksiniz. Şef Sensin sayesinde artık mutfak tutkunları denemek istedikleri her yemeğe daha basit ve daha çabuk erişim sağlayacak."
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
}
