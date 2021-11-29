//
//  SignUpViewController.swift
//  BurnOut
//
//  Created by Rosey on 10/31/21.
//

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


/*
 
 public var completionHandler: ((String?) -> Void)?
 
 //completionHandler?(emailInput.text)
 
 //let settings = self.storyboard?.instantiateViewController(withIdentifier: "setting") as! SettingsViewController
 //settings.email = emailInput.text!
 
 //let newViewController = SettingsViewController()
 //newViewController.email = emailInput.text!
 //present(newViewController, animated: true)
 
 //signUp()
 let storyboard = UIStoryboard(name: "Main", bundle: nil)
 let vc = storyboard.instantiateViewController(withIdentifier: "setting") as! SettingsViewController
 //let vc = storyboard.instantiateViewController(withIdentifier: "setting")
 //vc.modalPresentationStyle = .overFullScreen
 vc.email = emailInput.text!
 vc.password = passwordInput.text!
 //self.tabBarController?.present(vc, animated: true, completion: nil)
 //vc.modalPresentationStyle = .fullScreen
 self.present(vc, animated: true)
 //self.tabBarController?.tabBar.isHidden = false
 
 
 
 
 
 NotificationCenter.default.post(name: Notification.Name("text"), object: emailInput.text)
 signUp()
 let vc = storyboard?.instantiateViewController(withIdentifier: "setting") as! SettingsViewController
 vc.modalPresentationStyle = .overFullScreen
 present(vc, animated: true)
 
 
 
 
 let vc = SettingsViewController(nibName: "SettingsViewController", bundle: nil)
 vc.email = emailInput.text!
 navigationController?.pushViewController(vc, animated: true)
 
 
 
 let stroyboard = UIStoryboard(name: "Main", bundle: nil)
 let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainhome")
 vc?.modalPresentationStyle = .overFullScreen
 self.present(vc!, animated: true)
 
 
 
 
 let vc = storyboard?.instantiateViewController(withIdentifier: "setting") as! SettingsViewController
 vc.modalPresentationStyle = .fullScreen
 present(vc, animated: true)
 
 
 
 
 
 if emailInput.text?.isEmpty == true{
     print("No text in email field")
     return
 }
 
 if passwordInput.text?.isEmpty == true {
     print("No text in password field")
     return
 }
 
 
 
 
 
 
 NotificationCenter.default.post(name: Notification.Name("text"), object: emailInput.text)
 signUp()
 let vc = storyboard?.instantiateViewController(withIdentifier: "setting") as! SettingsViewController
 vc.modalPresentationStyle = .overFullScreen
 present(vc, animated: true)
 */
