//
//  SignUpViewController.swift
//  ChildLearning
//
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtFName: UITextField!
    @IBOutlet weak var txtFEmail: UITextField!
    @IBOutlet weak var txtFPassword: UITextField!
    var ref: DatabaseReference!
    var users: [Users] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()
        fetchAllUsers()
        self.navigationController?.navigationBar.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    func signupObserverFirebase(email: String,name: String, password: String){ // Like handling in Firebase

        let data = ["name": name,
                    "email": email,
                    "password" : password] as [String : Any]
        
        if users.contains(where: {$0.email == email }){
            Alert.addAlertController(strTittle: "", strMessage: "Email alreday registered", viewC: self)
        }
        else{
            ref.child(Constant.FirebaseData.User).childByAutoId().setValue(data)
            let vc = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func fetchAllUsers(){
        /*
         Get the all data from Firebase
         */
        ref.child(Constant.FirebaseData.User).observe(.value, with: { snapshot in
       
            for eachPlace in (snapshot.children){
                let place = Users(snapshot: eachPlace as! DataSnapshot)
                self.users.append(place)
                
            }
           
        })
    }
    
    
    @IBAction func signUpcClicked(_ sender: Any) {
        if txtFName.text?.count == 0{
            Alert.addAlertController(strTittle: "", strMessage: "Please add the name ", viewC: self)
        }
        else if txtFEmail.text?.count == 0{
            Alert.addAlertController(strTittle: "", strMessage: "Please add the email ", viewC: self)
        }
        else  if txtFPassword.text?.count == 0{
            Alert.addAlertController(strTittle: "", strMessage: "Please add the password ", viewC: self)
        }
        else if !CommonFunctions.isValidEmail(testStr: txtFEmail.text ?? ""){
            Alert.addAlertController(strTittle: "", strMessage: "Please add valid email", viewC: self)
        }
        else{
            signupObserverFirebase(email: txtFEmail.text ?? "", name: txtFName.text ?? "", password: txtFPassword.text ?? "")
        }
        
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
