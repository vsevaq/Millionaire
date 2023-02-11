//
//  WinOrLoseViewController.swift
//  Millionaire
//
//  Created by Niyaz on 07.02.2023.
//

import UIKit

class WinOrLoseViewController: UIViewController {
    
    @IBOutlet weak var attempts: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    var winSumm: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        moneyLabel.text = "\(winSumm) рублей"

    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        let GameVC = self.storyboard?.instantiateViewController(withIdentifier: "GameVC") as! GameVC
        self.navigationController?.pushViewController(GameVC, animated: true)
    }
    
}
