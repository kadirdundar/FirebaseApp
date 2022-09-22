//
//  Post.swift
//  fotografpaylasmauygulamasi
//
//  Created by Kadir Dündar on 22.09.2022.
//

import Foundation

class Post {
    
    var email : String
    var fotografUrl : String
    var yorum : String
    
    init(email: String, fotografUrl: String, yorum: String) {
        self.email = email
        self.fotografUrl = fotografUrl
        self.yorum = yorum
    }
}
