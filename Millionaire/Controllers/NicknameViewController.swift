//
//  NicknameViewController.swift
//  Millionaire
//
//  Created by Dmitriy Babichev on 06.02.2023.
//

import UIKit

class NicknameViewController: UIViewController {

    @IBOutlet weak var nicknameTextField: UITextField!

    var users = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func registerPressed(_ sender: UIButton) {
        if let user = nicknameTextField.text {
            if !user.isEmpty {
                users.append(user)
            }
        }

        print(users)
    }
}
