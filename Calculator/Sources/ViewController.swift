
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    var currentInput: String = "0"
    var firstOperand: Double?
    var operation: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDisplay()
    }

    @IBAction func numberButtonTapped(_ sender: UIButton) {
        guard let numberText = sender.currentTitle else { return }
        if currentInput == "0" {
            currentInput = numberText
        } else {
            currentInput += numberText
        }
        updateDisplay()
    }

    @IBAction func operationButtonTapped(_ sender: UIButton) {
        guard let op = sender.currentTitle else { return }
        firstOperand = Double(currentInput)
        operation = op
        currentInput = "0"
    }

    @IBAction func equalsButtonTapped(_ sender: UIButton) {
        guard let operation = operation, let firstOperand = firstOperand, let secondOperand = Double(currentInput) else { return }

        var result: Double = 0
        switch operation {
        case "+":
            result = firstOperand + secondOperand
        case "-":
            result = firstOperand - secondOperand
        case "*":
            result = firstOperand * secondOperand
        case "/":
            result = firstOperand / secondOperand
        default:
            break
        }

        currentInput = "\(result)"
        self.operation = nil
        self.firstOperand = nil
        updateDisplay()
    }

    @IBAction func clearButtonTapped(_ sender: UIButton) {
        currentInput = "0"
        firstOperand = nil
        operation = nil
        updateDisplay()
    }

    func updateDisplay() {
        displayLabel.text = currentInput
    }
}
