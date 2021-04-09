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
    var isNumbers = Bool()
    var isAlphabets = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        if isNumbers{
            fetchNumbers()
        }
        else if isAlphabets{
            fetchAlphabets()
        }
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
                var list = [String]()
                   for document in query!.documents {
                       print("\(document.documentID) => \(document.data())")
                    if let doc = document.data() as? [String: Any]{
                        if let value =  doc["name"] as? String{
                            print("value ------ \(value)")
                            list.append(value)
                        }
                       
                    }
                   }
                self.arr = list.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
                    self.collectionVWords.reloadData()
               }
        }
       
    }
    
    func fetchNumbers(){
        let db = Firestore.firestore()
        print(db.collection(Constant.FirebaseData.Numbers))
        db.collection(Constant.FirebaseData.Numbers).getDocuments { (query, error) in
            if let err = error {
                   print("Error getting documents: \(err)")
               } else {
                var list = [String]()
                   for document in query!.documents {
                       print("\(document.documentID) => \(document.data())")
                    if let doc = document.data() as? [String: Any]{
                        if let value =  doc["name"] as? String{
                            print("value ------ \(value)")
                            list.append(value)
                        }
                       
                    }
                   }
                self.arr = list.sorted {$0.localizedStandardCompare($1) == .orderedAscending} 
                self.collectionVWords.reloadData()
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
        cell.lblName.text = arr[indexPath.row].capitalized
        cell.layer.cornerRadius = 5.0
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SpeakViewController") as! SpeakViewController
        vc.strWord = arr[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ButtonsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: self.view.frame.width/2 - 20, height: self.view.frame.width/2 - 20)
       
    }
}
