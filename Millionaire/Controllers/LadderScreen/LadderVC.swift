//
//  LadderVC.swift
//  MillionaireGame
//
//  Created by Alexandr Rodionov on 8.02.23.
//

import UIKit

class LadderVC: UIViewController {
    
    var qNumberToFlash: Int = 0
    
    @IBOutlet weak var q1Label: UIImageView!
    @IBOutlet weak var q2Label: UIImageView!
    @IBOutlet weak var q3Label: UIImageView!
    @IBOutlet weak var q4Label: UIImageView!
    @IBOutlet weak var q5Label: UIImageView!
    @IBOutlet weak var q6Label: UIImageView!
    @IBOutlet weak var q7Label: UIImageView!
    @IBOutlet weak var q8Label: UIImageView!
    @IBOutlet weak var q9Label: UIImageView!
    @IBOutlet weak var q10Label: UIImageView!
    @IBOutlet weak var q11Label: UIImageView!
    @IBOutlet weak var q12Label: UIImageView!
    @IBOutlet weak var q13Label: UIImageView!
    @IBOutlet weak var q14Label: UIImageView!
    @IBOutlet weak var q15Label: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch qNumberToFlash {
        case 1:
            print("Ответ 1")
            q1Label.image = UIImage(named: "rectGreen")
        case 2:
            print("Ответ 2")
            q2Label.image = UIImage(named: "rectGreen")
        case 3:
            print("Ответ 3")
            q3Label.image = UIImage(named: "rectGreen")
        case 4:
            print("Ответ 4")
            q4Label.image = UIImage(named: "rectGreen")
        case 5:
            print("Ответ 5")
            q5Label.image = UIImage(named: "rectGreen")
        case 6:
            print("Ответ 6")
            q6Label.image = UIImage(named: "rectGreen")
        case 7:
            print("Ответ 7")
            q7Label.image = UIImage(named: "rectGreen")
        case 8:
            print("Ответ 8")
            q8Label.image = UIImage(named: "rectGreen")
        case 9:
            print("Ответ 9")
            q9Label.image = UIImage(named: "rectGreen")
        case 10:
            print("Ответ 10")
            q10Label.image = UIImage(named: "rectGreen")
        case 11:
            print("Ответ 11")
            q11Label.image = UIImage(named: "rectGreen")
        case 12:
            print("Ответ 12")
            q12Label.image = UIImage(named: "rectGreen")
        case 13:
            print("Ответ 13")
            q13Label.image = UIImage(named: "rectGreen")
        case 14:
            print("Ответ 14")
            q14Label.image = UIImage(named: "rectGreen")
        case 15:
            print("Ответ 15")
            q15Label.image = UIImage(named: "rectGreen")
        default:
            print("Нет ответа. Ошибка.")
        }
        
    }

}