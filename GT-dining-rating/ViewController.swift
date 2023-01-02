//
//  ViewController.swift
//  iOS_project
//
//  Created by Jing Liu on 1/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var majorNameTextField: UITextField!
    @IBOutlet weak var diningHallNameTextField: UITextField!
    
    @IBOutlet weak var foodQualitySegmentedControl: UISegmentedControl!
    @IBOutlet weak var foodRatingStepper: UIStepper!
    @IBOutlet weak var numberOfRating: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var willComeBackSwitch: UISwitch!

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numberOfRating.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        let goldColor = UIColor(red: 255/255, green: 215/255, blue: 0/255, alpha: 1.0)
        numberOfRating.textColor = goldColor
    }

    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfRating.text = "\(Int(sender.value))"
    }

    @IBAction func submitDidTapped(_ sender: UIButton) {
        
        // Let's choose the title we have selected from the segmented control
        let foodQuality = foodQualitySegmentedControl.titleForSegment(at: foodQualitySegmentedControl.selectedSegmentIndex)
        
        // Creating a variable of type string, that holds an introduction. The introduction interpolates the values from the text fields provided.
        // Currently we can only present the information in a print statement. However, this lets us verify that our app is printing out what is intended!
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and my major is \(majorNameTextField.text!). I went to \(diningHallNameTextField.text!) and I think the food was \(foodQuality!). I gave it \(numberOfRating.text!) stars.  \(commentTextView.text!). It is \(willComeBackSwitch.isOn) that I will come back."
        
        // Creates the alert where we pass in our message, which our introduction.
        let alertController = UIAlertController(title: "My Review", message: introduction, preferredStyle: .alert)
        
        // A way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Thanks for reviewing", style: .default, handler: nil)
        
        // Passing this action to the alert controller so it can be dismissed
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}

