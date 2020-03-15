import Foundation
import UIKit


extension PlayerStats: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let _ = Int(textField.text!) {
            if self.checkActiveFields() { shootButton.turnActive() }
        } else {
            textField.text = ""
            textField.placeholder = "Only numeric entries."
        }
    }
}
