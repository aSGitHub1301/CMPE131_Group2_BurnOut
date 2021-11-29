//  SignUpViewController.swift
//  BurnOut

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet var emailInput: UITextField!
    @IBOutlet var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //goes to tracker page after successful sign up
    @IBAction func signUpButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "mainhome")
        vc?.modalPresentationStyle = .overFullScreen
        present(vc!, animated: true)
        signUp()
    }
    
    //goes to login page
    @IBAction func logInButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "login")
        vc?.modalPresentationStyle = .overFullScreen
        present(vc!, animated: true)
    }
    
    //creates account in firebase database using the entered credentials
    func signUp(){
        Auth.auth().createUser(withEmail: emailInput.text!, password: passwordInput.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
        }
    }
}
