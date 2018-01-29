//
//  ViewController.swift
//  AndroidProj1InSwift
//
//  Created by Robert Wais on 1/27/18.
//  Copyright © 2018 Robert Wais. All rights reserved.
//

import UIKit
import Toast_Swift

class ViewController: UIViewController {

    @IBOutlet var scoreLbl: UILabel!
    var timeAlert = 0
    var numOne = 0
    var numTwo = 0
    var runningTotal = 0
    @IBOutlet var btnTwo: UIButton!
    @IBOutlet var btnOne: UIButton!
    @IBOutlet var alertBtn: UIButton!
    @IBOutlet var mainView: UIView!
    @IBOutlet var touchView: UIView!
    @IBOutlet var popView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initial Random Numbers generated
        changeVals()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnPressed(button: UIButton){
        let nameBtn = button.tag
        let tempTotal = runningTotal
        switch nameBtn {
            
        case 1:
            if numOne > numTwo {
                if numOne > numTwo {
                    scoreLbl.text = String(runningTotal + 1)
                    runningTotal = runningTotal + 1
                }else{
                    scoreLbl.text = String(runningTotal - 1)
                    runningTotal = runningTotal - 1
                }
            }
        case 2:
            if numOne < numTwo {
                scoreLbl.text = String( runningTotal + 1)
                runningTotal = runningTotal + 1
            }else{
                scoreLbl.text = String( runningTotal - 1)
                runningTotal = runningTotal - 1
            }
        default:
            print("error")
            
        }
        
        (tempTotal<runningTotal) ? self.view.makeToast("Correct!", duration: 1.5, position: .center) : self.view.makeToast("Wrong", duration: 1.5, position: .center)
        
        changeVals()
    }
    
    func changeVals(){
        numOne = Int(arc4random_uniform(10))
        numTwo = Int(arc4random_uniform(10))
        btnOne.setTitle(String(numOne), for: .normal)
        btnTwo.setTitle(String(numTwo), for: .normal)
        
    }
}

