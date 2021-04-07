//
//  HomeViewController.swift
//  ChildLearning
//
//  Created by Rakinder on 05/04/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet var btnsHome: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in btnsHome{
            i.layer.cornerRadius = i.frame.size.height/2
            i.layer.borderWidth = 1
            i.layer.cornerRadius = i.frame.size.height/2
            i.layer.borderColor = UIColor.white.cgColor
        }
        // Do any additional setup after loading the view.
    }


}
