import Foundation
import UIKit
import SpriteKit


class PlayerStats: NSObject {
    
    var activeFields: [UITextField]
    var activeLines: [SKShapeNode]
    var shootButton: ShootButtonStatsProtocol!
    var fadeOutDuration: TimeInterval = 1.2
    
    
    override init() {
        self.activeFields = []
        self.activeLines = []
    }
    
    
    func checkActiveFields() -> Bool {
        
        if activeFields.count == 3 {
            for fields in activeFields {
                if fields.text!.isEmpty { return false }
            }
            return true
        }
        return false
    }
}
