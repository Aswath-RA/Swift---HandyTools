//
//  GetCurrentWifiName.swift
//  gettingCurrentWifiName
//
//  Created by Aswath Ravichandran on 12/09/22.
//

import Foundation
import UIKit
import SystemConfiguration.CaptiveNetwork
import CoreLocation


var CurrentSSID = ""
class GetCurrentWifiName : NSObject ,CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var currentNetworkInfos: Array<NetworkInfo>? {
        get {
            return SSID.fetchNetworkInfo()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            updateWiFi()
        }
      }
    
    func toLoad(){
        if #available(iOS 13.0, *) {
                let status = CLLocationManager.authorizationStatus()
                if status == .authorizedWhenInUse {
                    updateWiFi()
                } else {
                    locationManager.delegate = self
                    locationManager.requestWhenInUseAuthorization()
                }
            } else {
                updateWiFi()
            }
    }
    
    func updateWiFi() {
       // print("SSID: \(currentNetworkInfos?.first?.ssid ?? "")")
        CurrentSSID = (currentNetworkInfos?.first?.ssid ?? "")
        
    }
}

public class SSID {
class func fetchNetworkInfo() -> [NetworkInfo]? {
    if let interfaces: NSArray = CNCopySupportedInterfaces() {
        var networkInfos = [NetworkInfo]()
        for interface in interfaces {
            let interfaceName = interface as! String
            var networkInfo = NetworkInfo(interface: interfaceName,
                                          success: false,
                                          ssid: nil,
                                          bssid: nil)
            if let dict = CNCopyCurrentNetworkInfo(interfaceName as CFString) as NSDictionary? {
                networkInfo.success = true
                networkInfo.ssid = dict[kCNNetworkInfoKeySSID as String] as? String
                networkInfo.bssid = dict[kCNNetworkInfoKeyBSSID as String] as? String
            }
            networkInfos.append(networkInfo)
        }
        return networkInfos
    }
    return nil
  }
}

struct NetworkInfo {
var interface: String
var success: Bool = false
var ssid: String?
var bssid: String?
}
