import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    var round: Int = 1
    var score: Int = 0
    
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
        var message = "You scored \(points) points"
        
        
        let alert = UIAlertController(
            title: "Hello, Oskar",
            message: message,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
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
        outletTarget.text = "\(targetValue)"
        currentValue = 50
        outletSlider.value = Float(currentValue)
        outletRound.text = "\(round)"
        outletScore.text = "\(score)"
    }
}
