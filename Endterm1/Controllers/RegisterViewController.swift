//
//  RegisterViewController.swift
//  Endterm1
//
//  Created by Dias Karimov on 14.05.2022.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Wrong format", message: "The email address/password is badly formatted", preferredStyle: .alert)
                let actionDefault = UIAlertAction(title: "OK", style: .default)
                
                alert.addAction(actionDefault)
                
                let email = emailTextField.text!
                let password = passwordTextField.text!
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let e = error {
                        print(e)
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        Auth.auth().currentUser?.sendEmailVerification()
                    self.performSegue(withIdentifier: "goToRegistration", sender: self)
                    }
                }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
