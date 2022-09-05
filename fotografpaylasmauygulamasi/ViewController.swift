//
//  ViewController.swift
//  fotografpaylasmauygulamasi
//
//  Created by Kadir Dündar on 2.09.2022.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var sifreTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func girisYapTiklandi(_ sender: Any) {
    }
    
    @IBAction func kayitOlTiklandi(_ sender: Any) {
        
        if emailTextField.text != "" && sifreTextField.text != ""{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: sifreTextField.text!) { (authdataresult, error)  in
                if error != nil {
                    self.hatamesajı(titleInput: "hata", messageInput: error?.localizedDescription ?? "hata aldınız tekrar deneyiniz")
                    
                }
                else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            //kayıt olunacak
        }
        else {
            hatamesajı(titleInput: "HATA", messageInput: "Lütfen kullanıcı adı ve şifre giriniz")
        }
    }
    func hatamesajı(titleInput : String, messageInput : String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        
        let  okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
}

