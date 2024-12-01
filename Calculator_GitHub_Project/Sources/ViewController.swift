
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        if displayLabel.text == "0" {
            displayLabel.text = title
        } else {
            displayLabel.text?.append(title)
        }
    }
}
