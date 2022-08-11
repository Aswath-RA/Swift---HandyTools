//
//  AlertService.swift
//  alertVC
//
//  Created by Mohamed Ashik Buhari on 02/08/22.
//

import UIKit


class AlertService{
    
    func alert(title: String,body: String,buttonTitle: String,secondTitle: String, completion: @escaping() -> Void,completion2: @escaping() -> Void) -> AlertViewController {
        let storyboard = UIStoryboard(name: "AlertViewController", bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(withIdentifier: "AlertVC") as!
        AlertViewController
        
        
        alertVC.alertTitle = title
        alertVC.alertBody = body
        alertVC.actionButtonTitle = buttonTitle
        alertVC.cancelActionTitle = secondTitle
        alertVC.buttonAction = completion
        alertVC.cancelAction = completion2
        
        return alertVC
        }
}
    
    
    
    
    
    
    

