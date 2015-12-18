import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalLabel2: UILabel!
    @IBOutlet weak var totalLabel3: UILabel!
    @IBOutlet weak var totalLabel4: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var allTotals: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        totalLabel2.text = "$0.00"
        totalLabel3.text = "$0.00"
        totalLabel4.text = "$0.00"
        allTotals.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.15, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        let total2 = (billAmount + tip)/2
        let total3 = (billAmount + tip)/3
        let total4 = (billAmount + tip)/4
        
        if billAmount != 0 {
            UIView.animateWithDuration(0.3, animations: {
                self.allTotals.alpha = 1
                self.allTotals.frame = CGRect(x: 0, y: 220, width: 375, height: 500)
                self.tipControl.frame = CGRect(x: 20, y: 170, width: 280, height: 30)
                self.billField.frame = CGRect(x: 20, y:65, width:280, height: 50)

            })
        }
        else {
            UIView.animateWithDuration(0.3, animations: {
                self.allTotals.alpha = 0
            })
        }
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalLabel2.text = String(format: "$%.2f",total2)
        totalLabel3.text = String(format: "$%.2f",total3)
        totalLabel4.text = String(format: "$%.2f",total4)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}