//
//  ViewController.swift
//  UV Analyser
//
//  Created by Tim Snow on 21/05/2015.
//  Copyright (c) 2015 Tim Snow. All rights reserved.
//


import Cocoa


class ViewController: NSViewController, NSTextFieldDelegate {

    
    @IBOutlet weak var absReadingInput: NSTextField!
    @IBOutlet weak var concentrationInput: NSTextField!
    
    @IBOutlet weak var absReadingOutput: NSTextField!
    @IBOutlet weak var concentrationOutput: NSTextField!
    
    @IBOutlet weak var cellPathLength: NSTextField!
    @IBOutlet weak var extinctionCoefficient: NSTextField!
    @IBOutlet weak var molecularWeight: NSTextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        absReadingInput.delegate = self
        absReadingInput.stringValue = "1"
        
        concentrationInput.delegate = self
        concentrationInput.stringValue = "1"
        
        absReadingOutput.stringValue = "1"
        concentrationOutput.stringValue = "1"
        
        cellPathLength.delegate = self
        cellPathLength.stringValue = "1"
        
        extinctionCoefficient.delegate = self
        extinctionCoefficient.stringValue = "1"
 
        molecularWeight.delegate = self
        molecularWeight.stringValue = "1"
        
        absFromConcentration()
        concentrationFromAbs()
    }
  
    
    override var representedObject: AnyObject? {
        didSet {
        }
    }
    

    override func controlTextDidChange (notification: NSNotification) {
        if notification.object?.description == absReadingInput.description {
            concentrationFromAbs()
        }
        
        if notification.object?.description == concentrationInput.description {
            absFromConcentration()
        }
        
        if notification.object?.description == cellPathLength.description {
            absFromConcentration()
            concentrationFromAbs()
        }
        
        if notification.object?.description == extinctionCoefficient.description {
            absFromConcentration()
            concentrationFromAbs()
        }
        
        if notification.object?.description == molecularWeight.description {
            absFromConcentration()
            concentrationFromAbs()
        }
    }

    
    func absFromConcentration() {
        var cellPathLengthFloat = (cellPathLength.stringValue as NSString).floatValue
        var extinctionCoefficientFloat = (extinctionCoefficient.stringValue as NSString).floatValue
        var concentrationInputFloat = (concentrationInput.stringValue as NSString).floatValue
        var molecularWeightFloat = (molecularWeight.stringValue as NSString).floatValue
        
        var result = cellPathLengthFloat * extinctionCoefficientFloat * (concentrationInputFloat / molecularWeightFloat)
        
        absReadingOutput.stringValue = String(format: "%5.3f", result)
    }
    
    
    func concentrationFromAbs() {
        var cellPathLengthFloat = (cellPathLength.stringValue as NSString).floatValue
        var extinctionCoefficientFloat = (extinctionCoefficient.stringValue as NSString).floatValue
        var absReadingInputFloat = (absReadingInput.stringValue as NSString).floatValue
        var molecularWeightFloat = (molecularWeight.stringValue as NSString).floatValue
        
        var result = (absReadingInputFloat / (cellPathLengthFloat * extinctionCoefficientFloat)) * molecularWeightFloat
        
        concentrationOutput.stringValue = String(format: "%5.3f", result)
    }
    
    
}