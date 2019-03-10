import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    var targetValue = 0
    var round = 1
    var score = 0
    
    @IBOutlet weak var outletSlider: UISlider!
    @IBOutlet weak var outletRound: UILabel!
    @IBOutlet weak var outletScore: UILabel!
    @IBOutlet weak var outletTarget: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    @IBAction func onSliderMove(){
        let roundedValue = outletSlider.value.rounded()
        currentValue = Int(roundedValue)
    }

    @IBAction func onHitMe(){
        let miss = abs(targetValue - currentValue)
        let points = 100 - miss
        let message = "You scored \(points) points"
        let title: String
        
        if(miss == 0){
            title = "Perfect!"
        } else if (miss < 5) {
            title = "You almost had it"
        } else {
            title = "Not even close"
        }
        
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        score += points
        round += 1
        
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func restartGame(){
        round = 1
        score = 0
        startNewRound()
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        outletTarget.text = String(targetValue)
        currentValue = 50
        outletSlider.value = Float(currentValue)
        outletRound.text = String(round)
        outletScore.text = String(score)
    }
}
