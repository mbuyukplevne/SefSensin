//
//  FeedbackViewController.swift
//  SefSensin
//
//  Created by Mehdican Büyükplevne on 1.03.2023.
//

import UIKit
import MessageUI

class FeedbackViewController: UIViewController,MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: MFMailComposeViewController
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        switch result {
        case .sent:
            print("sent")
        case .saved:
            print("saved")
        case .failed:
            print("failed")
        case .cancelled:
            print("cancelled")
            resultAlert(title: "Taslak Silindi", message: "", titleForAction: "Çıkış")
        default:
            break
        }
    }
    
    // MARK: Helper Functions
    func resultAlert(title: String, message: String, titleForAction: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: titleForAction, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Private Functions
    private func sendMail() {
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["devmbuyukplevne@gmail.com"])
        mailComposeVC.setSubject("")
        mailComposeVC.setMessageBody("", isHTML: false)
        self.present(mailComposeVC, animated: true)
    }
    
    
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        if !MFMailComposeViewController.canSendMail() {
            let alert = UIAlertController(title: "Error", message: "Mail services are not available", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }
        self.sendMail()
    }
}
