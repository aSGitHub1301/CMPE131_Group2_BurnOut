//  LogInViewController.swift
//  BurnOut

import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet var loginStatus: UILabel!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //removes keyboard from screen when tapped
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    //checks if user account credentials have entered and that they are valid, goes to tracker page
    @IBAction func loginButton(_ sender: Any) {
        let email = emailInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                self.loginStatus.isHidden = false
            }
            else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let homController = storyboard.instantiateViewController(withIdentifier: "mainhome")
                homController.modalPresentationStyle = .overFullScreen
                self.present(homController, animated: true)
            }
        }
    }
    
    //goes to sign up page
    @IBAction func signUpButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
}
