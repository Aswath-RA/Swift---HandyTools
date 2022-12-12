//
//  ViewController.swift
//  Reachability
//
//  Created by Leo Dabus on 2/9/19.
//  Copyright © 2019 Dabus.tv. All rights reserved.
//

    import UIKit
    class ViewController: UIViewController {
        var status = ""
        override func viewDidLoad() {
            super.viewDidLoad()

            callBackApi()
        }
        func callBackApi() {
           // if Network.reachability.status != .unreachable
            if Network.reachability.status == .unreachable {
                print("No InterNet ")
            }else {
                print("Yes Internet is there")
            }
            

        }
        
        
        
        @IBAction func getStatusButton(_ sender: Any) {
   
            if Network.reachability.status == .unreachable {
                print("No InterNet ")
            }else {
                print("Yes Internet is there")
            }
            
        }
        
    }
