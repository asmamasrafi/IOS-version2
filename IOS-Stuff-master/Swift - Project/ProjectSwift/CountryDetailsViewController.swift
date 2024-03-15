//
//  CountryDetailsViewController.swift
//  ProjectSwift
//
//  Created by user on 3/12/24.
//  Copyright © 2024 hassan. All rights reserved.
//
import UIKit

class CountryDetailsViewController: UIViewController {
    var countryName: String?
    var countryDescription: String?
    var countryCapital: String?
    var countryFlagImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()// Définir l'image d'arrière-plan
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background_image") // Assurez-vous d'avoir une image nommée "background_image" dans votre projet
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0) // Insérez l'image en tant que première sous-vue pour qu'elle soit en arrière-plan
        
   
        let flagImageView = UIImageView(frame: CGRect(x: 130, y: 100, width: 160, height: 100))
        flagImageView.contentMode = .scaleAspectFit
        if let countryName = countryName {
            flagImageView.image = UIImage(named: countryName)
        } else {
            flagImageView.image = UIImage(named: "unknown")
        }
        view.addSubview(flagImageView)
        
        // Configure country name label
        let nameLabel = UILabel()
        nameLabel.text = countryName
        nameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        // Configure description label
        let descriptionLabel = UILabel()
        let descriptionText = NSMutableAttributedString(string: "Description: ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        descriptionText.append(NSAttributedString(string: "\(countryDescription ?? "")", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]))
        descriptionLabel.attributedText = descriptionText
        descriptionLabel.numberOfLines = 0
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        // Configure capital label
        let capitalLabel = UILabel()
        let capitalText = NSMutableAttributedString(string: "Capital: ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        capitalText.append(NSAttributedString(string: "\(countryCapital ?? "")", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]))
        capitalLabel.attributedText = capitalText
        view.addSubview(capitalLabel)
        capitalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            capitalLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            capitalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            capitalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        
        // Configure capital image view
        let capitalImageView1 = UIImageView()
        if let countryName = countryName {
            capitalImageView1.image = UIImage(named: "\(countryName)_image1") // Assurez-vous que vos images sont nommées selon les noms des pays avec "_image1" à la fin
        } else {
            capitalImageView1.image = UIImage(named: "unknown")
        }
        capitalImageView1.contentMode = .scaleAspectFit
        view.addSubview(capitalImageView1)
        capitalImageView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            capitalImageView1.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor, constant: 20),
            capitalImageView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            capitalImageView1.widthAnchor.constraint(equalToConstant: 150), // Ajustez la largeur comme vous le souhaitez
            capitalImageView1.heightAnchor.constraint(equalToConstant: 150) // Ajustez la hauteur comme vous le souhaitez
        ])

        // Configure another capital image view
        let capitalImageView2 = UIImageView()
        if let countryName = countryName {
            capitalImageView2.image = UIImage(named: "\(countryName)_image2") // Assurez-vous que vos images sont nommées selon les noms des pays avec "_image2" à la fin
        } else {
            capitalImageView2.image = UIImage(named: "unknown")
        }
        capitalImageView2.contentMode = .scaleAspectFit
        view.addSubview(capitalImageView2)
        capitalImageView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            capitalImageView2.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor, constant: 20),
            capitalImageView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            capitalImageView2.widthAnchor.constraint(equalToConstant: 150), // Ajustez la largeur comme vous le souhaitez
            capitalImageView2.heightAnchor.constraint(equalToConstant: 150) // Ajustez la hauteur comme vous le souhaitez
        ])
    }
}
