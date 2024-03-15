
import UIKit

class ViewController: UIViewController {

    var colorZone: UIView!
     var stepper: UIStepper!
     var colors: [UIColor] = [.systemTeal, .red, .black, .yellow] // Define your colors here
     var currentColorIndex = 0
     
   
     override func viewDidLoad() {
         super.viewDidLoad()
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 50))
        titleLabel.text = "Exercice 2"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(titleLabel)
        
        // Add line below the title
        let lineView = UIView(frame: CGRect(x: 20, y: titleLabel.frame.maxY + 5, width: view.frame.width - 40, height: 1))
        lineView.backgroundColor = .black
        view.addSubview(lineView)
        
        // Create a view for the color zone
         colorZone = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
         colorZone.backgroundColor = colors[currentColorIndex] // Set initial color
         view.addSubview(colorZone)
         
         // Create a stepper
         stepper = UIStepper(frame: CGRect(x: 150, y: 450, width: 100, height: 50))
         stepper.minimumValue = 0
         stepper.maximumValue = Double(colors.count - 1)
         stepper.stepValue = 1
         stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
         view.addSubview(stepper)
     }
     
     @objc func stepperValueChanged() {
         let index = Int(stepper.value)
         colorZone.backgroundColor = colors[index]
     }
    
    
    
}

