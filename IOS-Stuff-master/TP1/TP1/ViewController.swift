//
//  ViewController.swift
//  TP1
//
//  Created by user on 3/6/24.
//  Copyright © 2024 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitleAndLine()
        // Do any additional setup after loading the view.
    }
    
    
    func addTitleAndLine() {
        // Add title label
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 50))
        titleLabel.text = "Exercice 1"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(titleLabel)
        
        // Add line below the title
        let lineView = UIView(frame: CGRect(x: 20, y: titleLabel.frame.maxY + 5, width: view.frame.width - 40, height: 1))
        lineView.backgroundColor = .black
        view.addSubview(lineView)
    }
    
    
        @IBAction func change(_ sender: UIButton) {
        if text.text == "Bonjour" {
            text.text = "Bonsoir"
            button.setTitle("Bonjour", for: .normal)
        }else{
            text.text = "Bonjour"
            button.setTitle("Bonsoir", for: .normal)
        }
    }
    
}

