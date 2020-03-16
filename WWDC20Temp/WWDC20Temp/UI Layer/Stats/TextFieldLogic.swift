import Foundation
import UIKit


extension PlayerStats: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.tag == Tags.TextFieldTags.knee.rawValue {
            if let value = Int(textField.text!), (value >= 0 && value <= 100) {
                if checkActiveFields() { shootButton.turnActive() }
            } else {
                textField.text = ""
                textField.placeholder = "0...100"
            }
            
        } else {
            if let value = Int(textField.text!), (value >= 0 && value <= 50) {
                if checkActiveFields() { shootButton.turnActive() }
            } else {
                textField.text = ""
                textField.placeholder = "0...50"
            }
        }
    }
}
