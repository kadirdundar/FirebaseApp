//
//  feedCellTableViewCell.swift
//  fotografpaylasmauygulamasi
//
//  Created by Kadir Dündar on 12.09.2022.
//

import UIKit
import FirebaseFirestore

class feedCellTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var emailText: UILabel!
    @IBOutlet weak var kullanıcıYorum: UIView!
    @IBOutlet weak var postImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
            
        
        tableView.delegate = self
        tableView.dataSource = self
        // Configure the view for the selected state
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
                        let documantID = document.documentID
                        print(documantID)
                    }
                }
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! feedCellTableViewCell
        return cell
    }
}


