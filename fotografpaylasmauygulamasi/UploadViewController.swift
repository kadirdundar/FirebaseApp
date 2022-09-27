//
//  UploadViewController.swift
//  fotografpaylasmauygulamasi
//
//  Created by Kadir Dündar on 5.09.2022.
//

import UIKit
import FirebaseFirestore
import FirebaseCore
import FirebaseStorage
import FirebaseAuth

class UploadViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var yorumTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Fotoğrafa tıklandığında algılama
        imageView.isUserInteractionEnabled = true
        let gestuRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        imageView.addGestureRecognizer(gestuRecognizer)
        
        // Do any additional setup after loading the view.
    }
    

    @objc func gorselSec()
    {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func uploadButtonTiklandi(_ sender: Any) {
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        
        let mediaFolder = storageReferance.child("media")
        let uuid = UUID().uuidString
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            let imageReferance = mediaFolder.child("\(uuid).jpg")
            imageReferance.putData(data, metadata: nil) { storagemetadata, error in
                if error != nil {
                    self.hatamesaji(title: "hata", message: error?.localizedDescription ?? "hata aldınız")
                    
                }
                else {
                    imageReferance.downloadURL { url, error in
                        if error == nil {
                            let imageURL = url?.absoluteString
                           
                            if let imageURL = imageURL{
                                
                                let firestoreDatabase = Firestore.firestore()
                                let firestorePost = ["gorselurl" : imageURL, "yorum" : self.yorumTextField.text! ,"email" : Auth.auth().currentUser!.email, "time" : FieldValue.serverTimestamp()] as [String : Any]
                                
                                firestoreDatabase.collection("post").addDocument(data: firestorePost) {
                                    (error) in
                                    if error != nil{
                                        self.hatamesaji(title: "hata", message: error?.localizedDescription ?? "hata aldınız tekrar deneyiniz")
                                    }
                                    else{
                                        self.imageView.image = UIImage(named: "Drawing")
                                        self.yorumTextField.text = ""
                                        self.tabBarController?.selectedIndex = 0
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
                        }
        }
    func hatamesaji(title : String, message : String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    
        
    }
    

