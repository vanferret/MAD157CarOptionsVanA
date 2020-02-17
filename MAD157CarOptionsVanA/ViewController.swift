//
//  ViewController.swift
//  MAD157CarOptionsVanA
//
//  Created by student on 2/17/20.
//  Copyright © 2020 vanderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var hitchSwitch: UISwitch!
    @IBOutlet weak var rackSwitch: UISwitch!
    @IBOutlet weak var upholsterySeg: UISegmentedControl!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var colorPick: UIImageView!
    

    @IBAction func aColorIsChosen(_ sender: UISegmentedControl) {
        let option = sender.selectedSegmentIndex
        
        if option == 0{
            //change to the black car pick
            let yourImage: UIImage = UIImage(named: "black")!
            colorPick.image = yourImage
        } else if option == 1{
            //change the picture to Silver
            let yourImage: UIImage = UIImage(named: "silver")!
            colorPick.image = yourImage
        } else {
            //change the picture to Olive
            let yourImage: UIImage = UIImage(named: "olive")!
            colorPick.image = yourImage
        }
    }
    
    
    @IBAction func onSliderChange(_ sender: UISlider) {
        let option = lroundf(sender.value)
        
        if option == 0 {
            sliderLabel.text = "Hamster on a wheel"
        } else if option == 1 {
            sliderLabel.text = "2.4 Liter"
        } else {
            sliderLabel.text = "2.4 Liter TURBO"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hitchSwitch.isOn = false
        rackSwitch.isOn = false
        sliderLabel.text = "2.4 Liter"
        
    }
    @IBAction func toggleVegan(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            //Tell them they have made a good choice
            let alertController = UIAlertController(title: "iOScreator", message:
                "Good Choice!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        } else {
            //enter the action sheet to question their decision
            let controller = UIAlertController(title: "Are You Sure?",message:nil, preferredStyle:.actionSheet)
            let yesAction = UIAlertAction(title: "Yes, I'm Sure!",style: .destructive,handler:{action in
                let msg = "Okay, fine."
                let controller2 = UIAlertController(
                    title: "A Choice was made....", message: msg, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Reconsider!", style: .cancel, handler: nil)
                controller2.addAction(cancelAction)
                self.present(controller2,animated: true,completion: nil)
            })
            let noAction = UIAlertAction(title: "No, thanks!", style: .cancel, handler: {action in self.pressed()})
            controller.addAction(yesAction)
            controller.addAction(noAction)
            if let ppc = controller.popoverPresentationController{
                ppc.sourceView = sender
                ppc.sourceRect = sender.bounds
            }
            present(controller,animated: true,completion: nil)
        }
    }
    
    func pressed(){
        upholsterySeg.selectedSegmentIndex = 0
    }
    

}

