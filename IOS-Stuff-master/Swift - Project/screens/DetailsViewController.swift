//
//  DetailsViewController.swift
//  ProjectSwift
//
//  Created by user on 3/5/24.
//  Copyright © 2024 hassan. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var titleLabel = UILabel(frame: CGRect(x: 20, y: 100, width:200, height: 50))
    var capital = UILabel(frame: CGRect(x: 20, y: 100, width:200, height: 50))
    var countryTitle: String = ""
    var CountryDescription: String = ""
    
    
 
    //let descriptionLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        titleLabel.text = countryTitle
        capital.textAlignment = .center
        capital.text = CountryDescription
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        view.addSubview(capital)
        
    }
    
    /*func setupImage() {
        view.addSubview(imageCountry)
        imageCountry.translatesAutoresizingMaskIntoConstraints = false
        
        // set image
        imageCountry.image = UIImage(named: "")
        
        // add constraint
        NSLayoutConstraint.activate([
            imageCountry.widthAnchor.constraint(equalToConstant: 300),
            imageCountry.heightAnchor.constraint(equalToConstant: 300),
            imageCountry.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageCountry.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        imageCountry.contentMode = .scaleToFill
        imageCountry.clipsToBounds = true
    }
    func setupTitle() {
        // Do any additional setup after loading the view.
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        // set your title
        titleLabel.text = "Morocco"
        //add constraints
        NSLayoutConstraint.activate([
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: imageCountry.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ])
        //
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
    }*/


}
