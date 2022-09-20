//
//  feedCellTableViewCell.swift
//  fotografpaylasmauygulamasi
//
//  Created by Kadir Dündar on 12.09.2022.
//

import UIKit

class feedCellTableViewCell: UITableViewCell {
   
    
    @IBOutlet weak var kullaniciyorum: UILabel!
    
    @IBOutlet weak var emailText: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
            
       
        // Configure the view for the selected state
    }
    
 

}


