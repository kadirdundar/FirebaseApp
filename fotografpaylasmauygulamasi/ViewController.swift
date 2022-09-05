//
//  ViewController.swift
//  fotografpaylasmauygulamasi
//
//  Created by Kadir Dündar on 2.09.2022.
//

import UIKit

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
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
}

