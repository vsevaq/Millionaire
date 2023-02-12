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
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.popAction))
        view.addGestureRecognizer(gesture)
        switch qNumberToFlash {
        case 1:
            q1Label.image = UIImage(named: "rectGreen")
        case 2:
            q2Label.image = UIImage(named: "rectGreen")
        case 3:
            q3Label.image = UIImage(named: "rectGreen")
        case 4:
            q4Label.image = UIImage(named: "rectGreen")
        case 5:
            q5Label.image = UIImage(named: "rectGreen")
        case 6:
            q6Label.image = UIImage(named: "rectGreen")
        case 7:
            q7Label.image = UIImage(named: "rectGreen")
        case 8:
            q8Label.image = UIImage(named: "rectGreen")
        case 9:
            q9Label.image = UIImage(named: "rectGreen")
        case 10:
            q10Label.image = UIImage(named: "rectGreen")
        case 11:
            q11Label.image = UIImage(named: "rectGreen")
        case 12:
            q12Label.image = UIImage(named: "rectGreen")
        case 13:
            q13Label.image = UIImage(named: "rectGreen")
        case 14:
            q14Label.image = UIImage(named: "rectGreen")
        case 15:
            self.navigationItem.hidesBackButton = true
            q15Label.image = UIImage(named: "rectGreen")
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                let winOrLoseViewController = self.storyboard?.instantiateViewController(withIdentifier: "WinOrLoseViewController") as! WinOrLoseViewController
                winOrLoseViewController.winSumm = 1000000
                self.navigationController?.pushViewController(winOrLoseViewController, animated: true)
            }
        default:
            print("Нет ответа. Ошибка.")
        }
    }
    
    @objc func popAction(sender : UITapGestureRecognizer) {
        self.navigationController!.popViewController(animated: true)
    }
}
