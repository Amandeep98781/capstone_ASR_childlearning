//
//  ButtonsViewController.swift
//  ChildLearning
//
//  Created by Rakinder on 05/04/21.
//

import UIKit

class ButtonsViewController: UIViewController {

    @IBOutlet weak var collectionVWords: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ButtonsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCollectionViewCell", for: indexPath) as! ButtonCollectionViewCell
        cell.layer.cornerRadius = 5.0
        return cell
    }
}


extension ButtonsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: self.view.frame.width/2 - 20, height: self.view.frame.width/2 - 20)
       
    }
}
