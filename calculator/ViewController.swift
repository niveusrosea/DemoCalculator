//
//  ViewController.swift
//  calculator
//
//  Created by Andy on 09/12/2015.
//  Copyright © 2015 niveusrosea. All rights reserved.
//

import Cocoa

let stringValueDefault = "0.0"

class ViewController: NSViewController
{
    
    @IBOutlet var outputLabel: NSTextField!

    typealias op_t = (Double, Double) -> Double
    
    var lhs: Double = 0.0
    var op: op_t?
    var rhs: String = stringValueDefault
    
    @IBAction func clearClick(button: NSButton)
    {
        lhs = 0.0
        op = nil
        rhs = stringValueDefault
        outputLabel.stringValue = rhs
    }
    
    @IBAction func additionClick(button: NSButton)
    {
        registerOperation { lhs, rhs in
            return lhs + rhs
        }
    }
    
    @IBAction func subtractionClick(button: NSButton)
    {
        registerOperation { lhs, rhs in
            return lhs - rhs
        }
    }
    
    @IBAction func multiplicationClick(button: NSButton)
    {
        registerOperation { lhs, rhs in
            return lhs * rhs
        }
    }
    
    @IBAction func divisionClick(button: NSButton)
    {
        registerOperation { lhs, rhs in
            return lhs / rhs
        }
    }
    
    @IBAction func resultClick(button: NSButton)
    {
        perform()
    }
    
    func perform()
    {
        guard let value = Double(rhs), op = op where value > 0 else
        {
            return
        }
        lhs = op(lhs, Double(rhs)!)
        rhs = stringValueDefault
        outputLabel.stringValue = String(lhs)
    }
    
    func registerOperation(op: op_t)
    {
        perform()
        if let rhs = Double(rhs) where rhs > 0
        {
            lhs = rhs
            self.rhs = stringValueDefault
        }
        self.op = op
    }
    
    @IBAction func numberClick(button: NSButton)
    {
        rhs = Double(rhs) == 0 ? button.title : rhs + button.title
        outputLabel.stringValue = rhs
    }

}

