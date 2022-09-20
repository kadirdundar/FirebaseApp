//
//  FeedViewController.swift
//  fotografpaylasmauygulamasi
//
//  Created by Kadir Dündar on 5.09.2022.
//

import UIKit
import FirebaseFirestore

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var yorumdizisi = [String]()
    var gorseldizisi = [String]()
    var emaildizisi = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        firebaseverilerial()
    }
    
    func firebaseverilerial(){
        
        let firestoredatabase = Firestore.firestore()
        firestoredatabase.collection("Post").addSnapshotListener{(snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
                
            }
            else {
                if snapshot?.isEmpty != true  &&  snapshot != nil{
                    for document in snapshot!.documents{
                        
                        if let gorselURL = document.get("gorselurl") as? String{
                            self.gorseldizisi.append(gorselURL)
                                                    
                        }
                        if let yorum = document.get("yorum") as? String{
                            self.yorumdizisi.append(yorum)
                        }
                        if let email = document.get("email") as? String{
                            self.emaildizisi.append(email)
                        }
                        
                    }
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emaildizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! feedCellTableViewCell
        cell.emailText.text = emaildizisi[indexPath.row]
        cell.kullaniciyorum.text = yorumdizisi[indexPath.row]
        cell.postImage.image = UIImage(named: "Drawing")
        
        
        return cell
    }

}
