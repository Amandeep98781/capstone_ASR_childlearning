//
//  SignUpViewController.swift
//  ChildLearning
//
//  Created by Rakinder on 02/04/21.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtFName: UITextField!
    @IBOutlet weak var txtFEmail: UITextField!
    @IBOutlet weak var txtFPassword: UITextField!
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    func likeObserverFirebase(email: String){ // Like handling in Firebase
        
        ref.child(Constant.FirebaseData.User).child(email ?? "").observe(.value, with: { snapshot in
            if let value = snapshot.value as? NSDictionary{
                          print("value ----- \(value)")
                       }
           
        })
    }
    
    @IBAction func signUpcClicked(_ sender: Any) {
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
