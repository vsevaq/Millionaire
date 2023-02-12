//
//  NicknameViewController.swift
//  Millionaire
//
//  Created by Dmitriy Babichev on 06.02.2023.
//

import UIKit

class NicknameViewController: UIViewController {

    @IBOutlet weak var nicknameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func registerPressed(_ sender: UIButton) {
        let secondVC = UIViewController()
        present(secondVC, animated: true)
    }

    func setupUI() {
        nicknameTextField.borderStyle = .line
        nicknameTextField.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
    }
}
