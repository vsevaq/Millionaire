import UIKit

class WinOrLoseViewController: UIViewController {
    
    @IBOutlet weak var attempts: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var winSumm: Int = 0
    var engine: GameEngine?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        moneyLabel.text = "\(winSumm) рублей"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        engine?.stopSound()
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        let GameVC = self.storyboard?.instantiateViewController(withIdentifier: "GameVC") as! GameVC
        self.navigationController?.pushViewController(GameVC, animated: true)
    }
}
