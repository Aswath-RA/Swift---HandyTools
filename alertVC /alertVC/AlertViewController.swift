//
//  AlertViewController.swift
//  alertVC
//
//  Created by Mohamed Ashik Buhari on 02/08/22.
//

import UIKit

class AlertViewController: UIViewController {
    
    
    @IBOutlet var titleLabel: UILabel!
    
    
    @IBOutlet var bodyLabel: UILabel!
    
    @IBOutlet var okActionButton: UIButton!
    
    @IBOutlet var cancelActionButton: UIButton!
    

    
    
    var alertTitle = String()
    
    var alertBody = String()
    
    var actionButtonTitle = String()
    
    var cancelActionTitle = String()
    
    var buttonAction:(() -> Void)?
    
    var cancelAction:(() -> Void)?
    
    @IBOutlet var AlertView: UIView!
    
    @IBOutlet var imageview: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setUpView()
        
        imageview.layer.cornerRadius = 30
        AlertView.layer.cornerRadius = 23
        okActionButton.layer.cornerRadius = okActionButton.layer.frame.size.width/6
        cancelActionButton.layer.cornerRadius = cancelActionButton.layer.frame.size.width/6
        imageview.layer.borderWidth = 1.5
        imageview.layer.borderColor = UIColor.green.cgColor
        imageview.clipsToBounds = true
        //okActionButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor

        okActionButton.layer.shadowOpacity = 0.30
        cancelActionButton.layer.shadowOpacity = 0.30
        AlertView.layer.shadowOpacity = 0.25
       
    }
    
    func setUpView(){
        titleLabel.text = alertTitle
        bodyLabel.text = alertBody
        okActionButton.setTitle(actionButtonTitle, for: .normal)
        cancelActionButton.setTitle(cancelActionTitle, for: .normal)    }
    
    @IBAction func OkTapAction(_ sender: Any) {
        
        dismiss(animated: true)
        //print("Tapped")
        buttonAction?()
    }
    
  
    @IBAction func CancelTapAction(_ sender: Any) {
        
        dismiss(animated: true)
        
        cancelAction?()
    }
    
}
