//
//  ViewController.swift
//  UV Analyser
//
//  Created by Tim Snow on 21/05/2015.
//  Copyright (c) 2015 Tim Snow. All rights reserved.
//
//  Equations from: http://en.wikipedia.org/wiki/Beer–Lambert_law
//

import Cocoa


class ViewController: NSViewController, NSTextFieldDelegate {

    
    // Delcaring IBOutlets from the storyboard
    @IBOutlet weak var absReadingInputField: NSTextField!
    @IBOutlet weak var concentrationInputField: NSTextField!
    
    @IBOutlet weak var absReadingLabel: NSTextField!
    @IBOutlet weak var concentrationLabel: NSTextField!
    
    @IBOutlet weak var cellPathLengthInputField: NSTextField!
    @IBOutlet weak var extinctionCoefficientInputField: NSTextField!
    @IBOutlet weak var molecularWeightInputField: NSTextField!
   

    // If the view loaded, let's initialise with some default values and start listening...
    override func viewDidLoad() {
        super.viewDidLoad()
        
        absReadingInputField.delegate = self
        absReadingInputField.stringValue = "1"
        
        concentrationInputField.delegate = self
        concentrationInputField.stringValue = "1"
        
        absReadingLabel.stringValue = "1"
        concentrationLabel.stringValue = "1"
        
        cellPathLengthInputField.delegate = self
        cellPathLengthInputField.stringValue = "1"
        
        extinctionCoefficientInputField.delegate = self
        extinctionCoefficientInputField.stringValue = "1"
 
        molecularWeightInputField.delegate = self
        molecularWeightInputField.stringValue = "1"
        
        absFromConcentration()
        concentrationFromAbs()
    }
  
    
    override var representedObject: AnyObject? {
        didSet {
        }
    }
    

    override func controlTextDidChange (notification: NSNotification) {
        // Listen for NSNotifications when the input field values change and handle them
        if notification.object?.description == absReadingInputField.description {
            concentrationFromAbs()
        }
        
        if notification.object?.description == concentrationInputField.description {
            absFromConcentration()
        }
        
        if notification.object?.description == cellPathLengthInputField.description {
            absFromConcentration()
            concentrationFromAbs()
        }
        
        if notification.object?.description == extinctionCoefficientInputField.description {
            absFromConcentration()
            concentrationFromAbs()
        }
        
        if notification.object?.description == molecularWeightInputField.description {
            absFromConcentration()
            concentrationFromAbs()
        }
    }

    
    func absFromConcentration() {
        // Do some maths based on the user input
        // Start by getting the values from the input fields and converting them to floats
        var cellPathLengthFloat = (cellPathLengthInputField.stringValue as NSString).floatValue
        var extinctionCoefficientFloat = (extinctionCoefficientInputField.stringValue as NSString).floatValue
        var concentrationInputFloat = (concentrationInputField.stringValue as NSString).floatValue
        var molecularWeightFloat = (molecularWeightInputField.stringValue as NSString).floatValue

        // Then do the maths
        var result = cellPathLengthFloat * extinctionCoefficientFloat * (concentrationInputFloat / molecularWeightFloat)
 
        // Then update the label appropriately
        absReadingLabel.stringValue = String(format: "%5.3f", result)
    }
    
    
    func concentrationFromAbs() {
        // Do some maths based on the user input
        // Start by getting the values from the input fields and converting them to floats
        var cellPathLengthFloat = (cellPathLengthInputField.stringValue as NSString).floatValue
        var extinctionCoefficientFloat = (extinctionCoefficientInputField.stringValue as NSString).floatValue
        var absReadingInputFloat = (absReadingInputField.stringValue as NSString).floatValue
        var molecularWeightFloat = (molecularWeightInputField.stringValue as NSString).floatValue

        // Then do the maths
        var result = (absReadingInputFloat / (cellPathLengthFloat * extinctionCoefficientFloat)) * molecularWeightFloat
        
        // Then update the label appropriately
        concentrationLabel.stringValue = String(format: "%5.3f", result)
    }
    
    
}