//
//  ConverterViewController.swift
//  Conversion Calculator UI
//
//  Created by Matthew McCarthy on 11/9/17.
//  Copyright © 2017 Matthew McCarthy. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var initialInput = "°C"
    var initialOutput = "°F"
    var numberShown: Double = 0
    var constantNumber: String = ""
    var inputConversionType = "°F"
    var inputConversionHolder = ""
    var outputConversionType = "°C"
    var outputConversionHolder = ""
    var conversionType = 0
    var count = 0
    var negative: Bool = false
    
    var converters: [converter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputDisplay.text = initialInput
        outputDisplay.text = initialOutput
        converters.append(converter(label: "fahrenheit to celcius", inputType: "°F", outputType: "°C"))
        converters.append(converter(label: "miles to kilometers", inputType: "mi", outputType: "km"))
        converters.append(converter(label: "kilometers to miles", inputType: "km", outputType: "mi"))
        converters.append(converter(label: "celcius to fahrenheit", inputType: "°C", outputType: "°F"))
    }
    
    @IBAction func convert(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Choose A Converter:", preferredStyle:
            UIAlertControllerStyle.actionSheet)
        
        for converter in converters{
            alert.addAction(UIAlertAction(title: converter.label, style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
                //                print(converter.label, "is the label", converter.inputType, converter.outputType )
                //self.inputDisplay?.text = converter.inputType
                //  self.outputDisplay?.text = converter.outputType
                
            }))
        }
        self.present(alert, animated: true, completion: nil)

    }
    
    @IBAction func zeroThruTen(_ sender: UIButton) {
        
        if(count > 0){
            let endIndexInput = inputDisplay.text?.index((inputDisplay.text?.endIndex)!, offsetBy: -2)
            inputDisplay.text = inputDisplay.text?.substring(to: endIndexInput!)
            
            let endIndexOutput = outputDisplay.text?.index((outputDisplay.text?.endIndex)!, offsetBy: -2)
            outputDisplay.text = outputDisplay.text?.substring(to: endIndexOutput!)
        }
        
            if(sender.tag == 11){
            
                inputDisplay.text = inputDisplay.text! + "." + inputConversionType
                constantNumber = constantNumber + "."
            }
            else{
                constantNumber = constantNumber + String(sender.tag-1)
               // print(constantNumber)
    
                inputDisplay.text = inputDisplay.text! + String(sender.tag-1) + inputConversionType
            }
            numberShown = Double(constantNumber)!
            conversionTypeChecker(number: conversionType)
            count = 1
        
    
    }
    
    @IBAction func clear (_ sender: Any){
        self.inputDisplay.text = inputConversionType
        self.outputDisplay.text = outputConversionType
        constantNumber = ""
        numberShown = 0;
        count = 0
        
    }

    @IBAction func positiveNegative(_ sender: UIButton) {
        //numberShown = numberShown - numberShown - numberShown
        if(constantNumber != ""){
            if(negative == false){
                let negNumber = Double(constantNumber)! - Double(constantNumber)!*2
                numberShown = negNumber
                inputDisplay.text = String(negNumber) + inputConversionType
                conversionTypeChecker(number: conversionType)
                negative = true
            }
            else{
                numberShown = Double(constantNumber)!
                print(numberShown)
                conversionTypeChecker(number: conversionType)
                inputDisplay.text = constantNumber + inputConversionType
                negative = false
            }
        }
        else{
            
        }
        
    }
    
    
    func conversionTypeChecker(number: Int){
        if(conversionType == 0){
            calculateFtoC()
        }
        if(conversionType == 1){
            calculateMtoK()
        }
        if(conversionType == 2){
            calculateKtoM()
        }
        if(conversionType == 3){
            calculateCtoF()
        }
    }
    func calculateFtoC(){
        inputDisplay.text = String(numberShown) + inputConversionType
        numberShown = (numberShown - 32)*5/9
        outputDisplay.text = String(numberShown) + outputConversionType
    }
    
    func calculateCtoF(){
        inputDisplay.text = String(numberShown) + inputConversionType
        numberShown = numberShown * 9 / 5 + 32
        outputDisplay.text = String(numberShown) + outputConversionType
    }
    
    func calculateMtoK(){
        inputDisplay.text = String(numberShown) + inputConversionType
        numberShown = numberShown / 0.62137
        outputDisplay.text = String(numberShown) + outputConversionType
    }
    
    func calculateKtoM(){
        inputDisplay.text = String(numberShown) + inputConversionType
        numberShown = numberShown * 0.62137
        outputDisplay.text = String(numberShown) + outputConversionType
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
