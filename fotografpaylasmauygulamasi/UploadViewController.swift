//
//  UploadViewController.swift
//  fotografpaylasmauygulamasi
//
//  Created by Kadir Dündar on 5.09.2022.
//

import UIKit

class UploadViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var yorumTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    
}
