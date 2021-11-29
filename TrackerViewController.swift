//  TrackerViewController.swift
//  BurnOut

import UIKit

class TrackerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userItemInput: UITextField!
    @IBOutlet weak var userCaloriesInput: UITextField!
    @IBOutlet weak var userMealInput: UITextField!
    
    @IBOutlet weak var calorieCount: UILabel!
    @IBOutlet weak var calorieLimitWarning: UILabel!
    
    @IBOutlet weak var catalogTableView: UITableView!
    
    var catalogEntry = [""]
    var calorieMax = 0
    var calorieValue = 0
    var newCalorieValue = ""
    var gender = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userMealInput.delegate = self
        userItemInput.delegate = self
        userCaloriesInput.delegate = self
        catalogTableView.dataSource = self
        catalogTableView.delegate = self
        let tabbar = tabBarController as! BaseTabBarController
        calorieCount.text = String(describing: tabbar.caloricIntake)
        calorieMax = Int(calorieCount.text!) ?? 0
    }
    
    //updates calorie meter from settings page
    override func viewDidAppear(_ animated: Bool) {
        let tabbar = tabBarController as! BaseTabBarController
        calorieCount.text = String(describing: tabbar.caloricIntake)
        calorieMax = Int(calorieCount.text!) ?? 0
    }
    
    //adds food item to table and updates calorie meter
    @IBAction func AddFoodButton(_ sender: Any) {
        
        let meal = "\(userMealInput.text!)"
        let item = "\(userItemInput.text!)"
        let calories = "\(userCaloriesInput.text!)"
        self.catalogEntry.append("\(meal) - \(item) - \(calories) calories")
        
        calorieValue = Int(userCaloriesInput.text!) ?? 0
        
        calorieMax = calorieMax - calorieValue
        newCalorieValue = "\(calorieMax)"
        self.calorieCount.text = newCalorieValue
        
        if (calorieMax < 0){
            calorieLimitWarning.isHidden = false
        }
        
        self.catalogTableView.reloadData()
        scrollToBottom()
    }
    
    //counts table rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.catalogEntry.count
    }
    
    //updates row index after new entry
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.catalogEntry[indexPath.row]
        return cell
    }
    
    //allows rows to be removed and adds back calories to meter, also shows warning if meter is exceeded
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            catalogEntry.remove(at: indexPath.row)
            catalogTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            calorieMax = calorieMax + calorieValue
            newCalorieValue = "\(calorieMax)"
            self.calorieCount.text = newCalorieValue
            if (calorieMax >= 0){
                calorieLimitWarning.isHidden = true
            }
        }
    }
    
    //table can be scrolled if exceeds page
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.catalogEntry.count-1, section: 0)
            self.catalogTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    //enables touch on calorie input
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userCaloriesInput.resignFirstResponder()
    }
}

//enables touch on text fields
extension UIViewController : UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
