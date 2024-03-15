//
//  ViewController.swift
//  ColorChooser
//
//  Created by user on 2/22/24.
//  Copyright © 2024 Abdelghani El Mouak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var red: UISlider!
    @IBOutlet weak var green: UISlider!
    @IBOutlet weak var blue: UISlider!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var actualColor: UIView!
    @IBOutlet weak var prevColor: UIView!
    @IBOutlet weak var beforePrevColor: UIView!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var web: UISwitch!
    
    var color = UIColor(red:0, green:0, blue:0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initColor()
        
    }

    @IBAction func saveColor(_ sender: Any) {
        saveColor();
    }
    func initColor(){
        red.setValue(0.0, animated: true)
        green.setValue(0.0, animated: true)
        blue.setValue(0.0, animated: true)

        let redVal = CGFloat(red.value)
        let greenVal = CGFloat(green.value)
        let blueVal = CGFloat(blue.value)
        
        color = UIColor(red: redVal, green: greenVal, blue: blueVal, alpha: 1.0)
        actualColor.backgroundColor = color
        prevColor.backgroundColor = color
        saveColor()
    }
    @IBAction func sliderValChanged(_ sender: UISlider) {
        if web.isOn{
            sender.setValue(roundf(sender.value/0.1) * 0.1, animated: true)
//            sender.setValue(sender.value * 0.1, animated: true)
        }
        updateColor()
    }
    func updateColor(){
        let redVal = CGFloat(red.value)
        let greenVal = CGFloat(green.value)
        let blueVal = CGFloat(blue.value)
        
        color = UIColor(red: redVal, green: greenVal, blue: blueVal, alpha: 1.0)
        actualColor.backgroundColor = color
    }
    func saveColor(){
        beforePrevColor.backgroundColor = prevColor.backgroundColor
        prevColor.backgroundColor = color
        
    }
    @IBAction func reset(_ sender: Any) {
        initColor()
    }
}

