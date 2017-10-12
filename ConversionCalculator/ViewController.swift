//
//  ViewController.swift
//  ConversionCalculator
//
//  Created by Cameron Barker on 10/3/17.
//  Copyright © 2017 Cameron Barker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputUnitLabel: UILabel!
    @IBOutlet weak var outputField: UITextField!
    @IBOutlet weak var inputUnitLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBAction func buttonPressed(_ sender: UIButton) {
        if(sender.tag >= 0  && sender.tag <= 9){
            AppDelegate.converter.append(digit: sender.tag)
        } else if sender.tag == 10{
            AppDelegate.converter.appendDecimal()
        } else if sender.tag == 11{
            AppDelegate.converter.toggleSign()
        } else if sender.tag == 12{
            AppDelegate.converter.deleteLastDigit()
        } else if sender.tag == 13{
            AppDelegate.converter.clearInput()
        }
        updateInputField()
        AppDelegate.converter.convert()
        updateOutputField()
    }
    
    func updateInputField(){
        inputField.text = AppDelegate.converter.inputValue
        if(inputField.text?.isEmpty)!{
            inputField.text = "0"
        }
    }
    
    func updateOutputField(){
        outputField.text = String(AppDelegate.converter.outputValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateInputField()
        AppDelegate.converter.convert()
        updateOutputField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension Double
{
    func truncate(places : Int)-> Double
    {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}

