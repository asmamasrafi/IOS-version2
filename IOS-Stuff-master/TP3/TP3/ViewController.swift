//
//  ViewController.swift
//  TP3
//
//  Created by user on 1/17/23.
//  Copyright © 2023 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Stepper: UIStepper!
   
    @IBOutlet weak var sliderbar: UISlider!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var SegmentDizaines: UISegmentedControl!
    @IBOutlet weak var SegmentUnites: UISegmentedControl!
    
    @IBOutlet weak var SwitchASCI: UISwitch!
    @IBOutlet weak var RAZ: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitleAndLine()
        // Do any additional setup after loading the view.
     
        self.Stepper.autorepeat = true;
        self.Stepper.isContinuous = true;
        self.Stepper.minimumValue = 0;
        self.Stepper.maximumValue = 100;
        self.Stepper.stepValue = 1;
        self.sliderbar.minimumValue = 0;
        self.sliderbar.value = 0;
        self.sliderbar.maximumValue = 100;
        SwitchASCI.isOn = false;
        print("Hell")
       
        
    }
    
    
    func addTitleAndLine() {
        // Add title label
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 50))
        titleLabel.text = "Exercice 3"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(titleLabel)
        
        // Add line below the title
        let lineView = UIView(frame: CGRect(x: 20, y: titleLabel.frame.maxY + 5, width: view.frame.width - 40, height: 1))
        lineView.backgroundColor = .black
        view.addSubview(lineView)
    }
    @IBAction func Stepperaction(_ sender: Any) {
        SegmentDizaines.selectedSegmentIndex = Int(Stepper.value / 10)
        SegmentUnites.selectedSegmentIndex = (Int(Stepper.value) % 10)
        update()
        
    }
    @IBAction func ActionASCI(_ sender: Any) {
        update()
    }
    
    @IBAction func SliderAction(_ sender: Any) {
        Stepper.value = Double(sliderbar.value);
        SegmentDizaines.selectedSegmentIndex = Int(Stepper.value / 10)
        SegmentUnites.selectedSegmentIndex = (Int(Stepper.value) % 10)
        
        update()
    }
    @IBAction func Reset(_ sender: Any) {
        value.text = String(0);
        Stepper.value = 0;
        sliderbar.value = 0;
        SegmentDizaines.selectedSegmentIndex = 0;
        SegmentUnites.selectedSegmentIndex = 0;
    }
    @IBAction func ChangedDizaines(_ sender: Any) {
        update()
    }
    @IBAction func ChangedUnites(_ sender: Any) {
        update()
    }
    func update(){
        let hex=String(format:"%X", SegmentDizaines.selectedSegmentIndex * 10 + SegmentUnites.selectedSegmentIndex)
        let int=String(SegmentDizaines.selectedSegmentIndex * 10 + SegmentUnites.selectedSegmentIndex)
        if SwitchASCI.isOn{
            value.text = hex
        } else {
            value.text = int
        }
        sliderbar.setValue(Float((int as NSString).floatValue), animated: true);
        Stepper.value = Double(sliderbar.value);

    }
    
    
}
