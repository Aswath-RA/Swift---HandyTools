//
//  ViewController.swift
//  alertVC
//
//  Created by Mohamed Ashik Buhari on 02/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    let alertService = AlertService()

    @IBOutlet var Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
    }


    @IBAction func TapButton(_ sender: Any) {
        
        
        let alertVC = alertService.alert(title: "CONGRATULATION", body: "ARE YOU WANT TO MAKE CHANGES ?", buttonTitle: "OK", secondTitle: "CANCEL") {
            print("NOT CANCELED")
            self.Label.text = "Ok Tapped"
        } completion2: {
            print("Canceled")
            self.Label.text = "CANCEL Tapped"
            
        }

        
        present( alertVC, animated: true)
        
        
    }
}

