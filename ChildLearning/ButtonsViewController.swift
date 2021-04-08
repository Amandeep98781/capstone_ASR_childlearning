//
//  ButtonsViewController.swift
//  ChildLearning
//
//

import UIKit
import FirebaseFirestore

class ButtonsViewController: UIViewController {

    @IBOutlet weak var collectionVWords: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var arr = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAlphabets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func fetchAlphabets(){
        let db = Firestore.firestore()
        db.collection(Constant.FirebaseData.Alphabets).getDocuments { (query, error) in
            if let err = error {
                   print("Error getting documents: \(err)")
               } else {
                   for document in query!.documents {
                       print("\(document.documentID) => \(document.data())")
                    if let doc = document.data() as? [String: Any]{
                        if let value =  doc["name"] as? String{
                            print("value ------ \(value)")
                            self.arr.append(value)
                            self.arr = self.arr.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
                            self.collectionVWords.reloadData()
                        }
                       
                    }
                   }
               }
        }
       
    }
}

extension ButtonsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCollectionViewCell", for: indexPath) as! ButtonCollectionViewCell
        cell.lblName.text = arr[indexPath.row]
        cell.layer.cornerRadius = 5.0
        return cell
    }
}

extension ButtonsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: self.view.frame.width/2 - 20, height: self.view.frame.width/2 - 20)
       
    }
}
