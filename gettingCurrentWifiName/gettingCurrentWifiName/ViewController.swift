
import UIKit
import SystemConfiguration.CaptiveNetwork
import CoreLocation

class ViewController: UIViewController{
 
 override func viewDidLoad() {
     super.viewDidLoad()
     
     GetCurrentWifiName().toLoad()
     print(CurrentSSID)
     
     if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                showPermissionAlert()
            case .authorizedAlways, .authorizedWhenInUse:
                print("Allowed")
            }
        } else {
            showPermissionAlert()
        }
     
 }
    func showPermissionAlert() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let alertController = UIAlertController(title: "Location Permission Required", message: "Please enable location permissions in settings.", preferredStyle: UIAlertController.Style.alert)

            let okAction = UIAlertAction(title: "Settings", style: .default, handler: {(cAlertAction) in
                //Redirect to Settings app
                UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
            })

            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
            alertController.addAction(cancelAction)

            alertController.addAction(okAction)

            self.present(alertController, animated: true, completion: nil)
        }

    }
    
}
