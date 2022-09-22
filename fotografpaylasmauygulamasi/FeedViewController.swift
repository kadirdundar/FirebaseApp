//
//  FeedViewController.swift
//  fotografpaylasmauygulamasi
//
//  Created by Kadir Dündar on 5.09.2022.
//

import UIKit
import FirebaseFirestore
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var postDizisi = [Post]()
   // var yorumdizisi = [String]()
    //var gorseldizisi = [String]()
    //var emaildizisi = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        firebaseverilerial()
    }
    
    func firebaseverilerial(){
        
        let firestoredatabase = Firestore.firestore()
        firestoredatabase.collection("post")
            .order(by: "time", descending: true).addSnapshotListener{ (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
                
            }
            else {
                if snapshot?.isEmpty != true  &&  snapshot != nil{
                    //self.gorseldizisi.removeAll(keepingCapacity: false)
                    //self.yorumdizisi.removeAll(keepingCapacity: false)
                    //self.emaildizisi.removeAll(keepingCapacity: false)
                    self.postDizisi.removeAll(keepingCapacity: false)
                    for document in snapshot!.documents{
                        
                        if let gorselURL = document.get("gorselurl") as? String{
                            if let yorum = document.get("yorum") as? String{
                                if let email = document.get("email") as? String{
                                    let post = Post(email: email, fotografUrl: gorselURL, yorum: yorum)
                                    self.postDizisi.append(post)
                        }
                       
                            
                        }
                       
                        }
                        
                    }
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! feedCellTableViewCell
        cell.emailText.text = postDizisi[indexPath.row].email
        cell.kullaniciyorum.text = postDizisi[indexPath.row].yorum
        cell.postImage.sd_setImage(with: URL(string: self.postDizisi[indexPath.row].fotografUrl))
        
        
        return cell
    }

}
