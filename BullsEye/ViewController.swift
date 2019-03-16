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
        let title = getTitle(miss:miss)
        let points = calculatePoints(miss: miss)
        let message = "You scored \(points) points"
        
        score += points
        round += 1
        showAlert(title: title, message: message)
    }
    
    @IBAction func restartGame(){
        round = 1
        score = 0
        startNewRound()
    }
    
    func calculatePoints(miss: Int) -> Int {
        if miss == 0 {
            return 200
        } else if miss == 1 {
            return 150
        }
        return 100 - miss
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func getTitle(miss: Int) -> String {
        if(miss == 0){
            return "Perfect!"
        } else if (miss < 5) {
            return "You almost had it"
        } else {
            return "Not even close"
        }
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
