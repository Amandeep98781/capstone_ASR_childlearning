//
//  Alert.swift
//  ChildLearning
//
//  Created by Rakinder on 05/04/21.
//

import UIKit

class Alert: NSObject {

    static func addAlertController(strTittle: String, strMessage: String,viewC: UIViewController){
        
        let alertController = UIAlertController(title: strTittle, message: strMessage, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
        }
        alertController.addAction(OKAction)
        viewC.present(alertController, animated: true)
    }
    
    
}
