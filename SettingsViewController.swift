//  SettingsViewController.swift
//  BurnOut

import UIKit
import Firebase
import FirebaseAuth
import MessageUI
import SafariServices

class SettingsViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var ageInput: UITextField!
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var activityInput: UISegmentedControl!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var genderInput: UISegmentedControl!
    @IBOutlet weak var poundChangeInput: UISegmentedControl!
    @IBOutlet weak var poundChangeTextInput: UITextField!
    
    @IBOutlet weak var firstNameOutput: UILabel!
    @IBOutlet weak var lastNameOutput: UILabel!
    @IBOutlet weak var ageOutput: UILabel!
    @IBOutlet weak var genderOutput: UILabel!
    @IBOutlet weak var activityOutput: UILabel!
    @IBOutlet weak var poundChangeOutput: UILabel!
    
    var age = 0
    var ageText = ""
    var gender = ""
    var firstName = ""
    var lastName = ""
    var activity = ""
    var poundChangeState = ""
    var poundChangeNum : Float = 0.0
    var baseCalories : Float = 500.0
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePickerView()
        ageInput.delegate = self
        firstNameInput.delegate = self
        lastNameInput.delegate = self
        poundChangeTextInput.delegate = self
        
    }
    
    //updates meter in tracker meter to the settings combination selected
    override func viewWillDisappear(_ animated: Bool) {
        let tabbar = tabBarController as! BaseTabBarController
        if(genderInput.selectedSegmentIndex == 1 && age >= 4 && age <= 8 && activityInput.selectedSegmentIndex == 0){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 1200
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0.0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1200 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1200 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 9 && age <= 13 && activityInput.selectedSegmentIndex == 0){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 1600
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1600 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1600 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 14 && age <= 18 && activityInput.selectedSegmentIndex == 0){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 1800
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1800 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1800 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 19 && age <= 30 && activityInput.selectedSegmentIndex == 0){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2000
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2000 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2000 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 31 && age <= 50 && activityInput.selectedSegmentIndex == 0){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 1800
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1800 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1800 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 51 && activityInput.selectedSegmentIndex == 0){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 1600
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1600 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1600 + poundChangeNum)
                }
            }
        }
        
        //female, activity at moderate
        if(genderInput.selectedSegmentIndex == 1 && age >= 4 && age <= 8 && activityInput.selectedSegmentIndex == 1){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 1500
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1500 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1500 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 9 && age <= 13 && activityInput.selectedSegmentIndex == 1){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 1800
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1800 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1800 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 14 && age <= 18 && activityInput.selectedSegmentIndex == 1){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2000
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2000 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2000 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 19 && age <= 30 && activityInput.selectedSegmentIndex == 1){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2100
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2100 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2100 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 31 && age <= 50 && activityInput.selectedSegmentIndex == 1){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2000
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2000 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2000 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 51 && activityInput.selectedSegmentIndex == 1){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 1800
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1800 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1800 + poundChangeNum)
                }
            }
        }
        
        //female, activity at high
        if(genderInput.selectedSegmentIndex == 1 && age >= 4 && age <= 8 && activityInput.selectedSegmentIndex == 2){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 1600
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1600 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1600 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 9 && age <= 13 && activityInput.selectedSegmentIndex == 2){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2000
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2000 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2000 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 14 && age <= 18 && activityInput.selectedSegmentIndex == 2){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2400
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2400 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2400 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 19 && age <= 30 && activityInput.selectedSegmentIndex == 2){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2400
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2400 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2400 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 31 && age <= 50 && activityInput.selectedSegmentIndex == 2){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2200
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2200 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2200 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 1 && age >= 51 && activityInput.selectedSegmentIndex == 2){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2100
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2100 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2100 + poundChangeNum)
                }
            }
        }
        
        //male, activity at low
        if(genderInput.selectedSegmentIndex == 0 && age >= 4 && age <= 8 && activityInput.selectedSegmentIndex == 0){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 1400
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1400 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1400 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 9 && age <= 13 && activityInput.selectedSegmentIndex == 0){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 1800
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1800 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1800 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 14 && age <= 18 && activityInput.selectedSegmentIndex == 0){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2200
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2200 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2200 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 19 && age <= 30 && activityInput.selectedSegmentIndex == 0){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2400
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2400 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2400 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 31 && age <= 50 && activityInput.selectedSegmentIndex == 0){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2200
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2200 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2200 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 51 && activityInput.selectedSegmentIndex == 0){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2000
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2000 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2000 + poundChangeNum)
                }
            }
        }
        
        //male, activity at moderate
        if(genderInput.selectedSegmentIndex == 0 && age >= 4 && age <= 8 && activityInput.selectedSegmentIndex == 1){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 1500
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1500 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1500 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 9 && age <= 13 && activityInput.selectedSegmentIndex == 1){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2100
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2100 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2100 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 14 && age <= 18 && activityInput.selectedSegmentIndex == 1){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2600
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2600 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2600 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 19 && age <= 30 && activityInput.selectedSegmentIndex == 1){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2700
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2700 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2700 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 31 && age <= 50 && activityInput.selectedSegmentIndex == 1){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2500
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2500 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2500 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 51 && activityInput.selectedSegmentIndex == 1){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2300
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2300 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2300 + poundChangeNum)
                }
            }
        }
        
        //male, activity at high
        if(genderInput.selectedSegmentIndex == 0 && age >= 4 && age <= 8 && activityInput.selectedSegmentIndex == 2){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 1800
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1800 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(1800 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 9 && age <= 13 && activityInput.selectedSegmentIndex == 2){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2300
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2300 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2300 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 14 && age <= 18 && activityInput.selectedSegmentIndex == 2){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 3000
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(3000 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(3000 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 19 && age <= 30 && activityInput.selectedSegmentIndex == 2){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 3000
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(3000 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(3000 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 31 && age <= 50 && activityInput.selectedSegmentIndex == 2){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2900
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2900 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2900 + poundChangeNum)
                }
            }
        }
        if(genderInput.selectedSegmentIndex == 0 && age >= 51 && activityInput.selectedSegmentIndex == 2){
            if(poundChangeTextInput.text! == "0"){
                tabbar.caloricIntake = 2600
            }
            else{
                if(poundChangeInput.selectedSegmentIndex == 0){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2600 - poundChangeNum)
                }
                if(poundChangeInput.selectedSegmentIndex == 1){
                    poundChangeNum = Float(poundChangeTextInput.text!) ?? 0
                    poundChangeNum = baseCalories * poundChangeNum
                    tabbar.caloricIntake = Int(2600 + poundChangeNum)
                }
            }
        }
    }
    
    //saves the settings entered and updates calorie meter, also display selected settings on settings page
    @IBAction func saveSettingsButton(_ sender: Any) {
        firstName = "\(firstNameInput.text!)"
        self.firstNameOutput.text = firstName
        
        lastName = "\(lastNameInput.text!)"
        self.lastNameOutput.text = lastName
        
        gender = "\(String(describing: genderInput.titleForSegment(at: genderInput.selectedSegmentIndex) ?? "nil"))"
        self.genderOutput.text = gender
        
        self.ageOutput.text = ageText
        
        activity = "\(String(describing: activityInput.titleForSegment(at: activityInput.selectedSegmentIndex) ?? "nil"))"
        self.activityOutput.text = activity
        
        poundChangeState = "\(String(describing: poundChangeInput.titleForSegment(at: poundChangeInput.selectedSegmentIndex) ?? "nil"))"
        self.poundChangeOutput.text = "\(poundChangeState) - \(poundChangeTextInput.text!) lbs"
        
    }
    
    //adds calender to age text field
    func createDatePickerView() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        if #available(iOS 13.4, *){
            datePicker.preferredDatePickerStyle = .wheels
        }
        
        ageInput.inputAccessoryView = toolbar
        ageInput.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    //display birth date and shows age on settings page
    @objc func donePressed() {
        
        ageInput.textAlignment = .center
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        ageInput.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
        let gregorian = Calendar(identifier: .gregorian)
        let ageComponents = gregorian.dateComponents([.year], from: datePicker.date, to: Date())
        age = ageComponents.year!
        
        ageText = String(age)
        
    }
    
    //goes to contact form link
    @IBAction func contactButton(_ sender: Any) {
        if MFMailComposeViewController.canSendMail(){
            let vc = MFMailComposeViewController()
            vc.delegate = self
            vc.setSubject("Contact Us")
            vc.setToRecipients(["aryan.saini@sjsu.edu"])
            vc.setMessageBody("App has bugs!", isHTML: true)
            present(UINavigationController(rootViewController: vc), animated: true)
        }
        else {
            guard let url = URL(string: "https://forms.gle/DKMrtLTQgWhC68p38") else {
                return
            }
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
    }
    
    //sets up email with default mail app
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        controller.dismiss(animated: true, completion: nil)
    }

    //goes to log in page
    @IBAction func signOutButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginController = storyboard.instantiateViewController(withIdentifier: "login")
        loginController.modalPresentationStyle = .overFullScreen
        self.present(loginController, animated: true)
    }
}
