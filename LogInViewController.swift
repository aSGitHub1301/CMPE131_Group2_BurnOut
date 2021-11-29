//
//  LogInViewController.swift
//  BurnOut
//
//  Created by Rosey on 10/31/21.
//

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

/*
 
 func showCreateAccount(){
     let alert = UIAlertController(title: "Create Account", message: "Would you like to create an account", preferredStyle: .alert)
     alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in }))
     alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in }))
     
     present(alert, animated: true)
 }
 
 
 let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
 view.addGestureRecognizer(tap)
 
 override func viewDidAppear(_ animated: Bool) {
     emailInput.becomeFirstResponder()
 }
 
 guard let email = emailInput.text, !email.isEmpty, let password = passwordInput.text, !password.isEmpty else {
     return
 }
 
 FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
     guard let strongSelf = self else {
         return
     }
     
     guard error == nil else {
         //strongSelf.showCreateAccount()
         return
     }
     strongSelf.loginStatus.isHidden = true
     strongSelf.emailInput.resignFirstResponder()
     strongSelf.passwordInput.resignFirstResponder()
 })
 
 
 
 
 func validateFields(){
     if emailInput.text?.isEmpty == true{
         print("No text in email field")
         return
     }
     
     if passwordInput.text?.isEmpty == true {
         print("No text in password field")
         return
     }
     logIn()
 }
 
 
 
 
 func logIn(){
     Auth.auth().signIn(withEmail: emailInput.text!, password: passwordInput.text!) { [weak self] authResult, error in
         guard let strongSelf = self else {return}
         if let error = error {
             print(error.localizedDescription)
             //strongSelf.loginStatus.isHidden = false
         }
         self!.checkUserInfo()
     }
 }
 
 func checkUserInfo(){
     if Auth.auth().currentUser != nil {
         print(Auth.auth().currentUser?.uid)
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyboard.instantiateViewController(withIdentifier: "mainhome")
         vc.modalPresentationStyle = .overFullScreen
         self.present(vc, animated: true)
     }
 }
 */
