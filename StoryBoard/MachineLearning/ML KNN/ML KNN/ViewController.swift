//
//  ViewController.swift
//  ML KNN
//
//  Created by Erkebulan Massainov on 24.01.2024.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var enterTF: UITextField!
    
    @IBOutlet weak var resultTV: UITextView!
    
    @IBOutlet weak var button: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        if let enteredText = enterTF.text, let manipulationEnterTF = Int(enteredText) {
            let manipulationKNN = KNN()
            
            // enteredText содержит текст из enterTF.text, и manipulationEnterTF содержит целое число
            // используйте manipulationEnterTF по вашему усмотрению
            resultTV.text = "\(manipulationKNN.kFinal(k: manipulationEnterTF))"
            
            
        } else {
            // Введенный текст не является целым числом
            resultTV.text = "Invalid input. Please enter an integer."
        }
    
        
    }
    
    
    
}



