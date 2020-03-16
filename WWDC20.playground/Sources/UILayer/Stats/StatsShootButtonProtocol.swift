import Foundation
import UIKit
import SpriteKit


protocol StatsShootButtonProtocol: class {
    
    var getDuration: TimeInterval { get }
    
    func fadeOutAnimation() -> SKAction
}


extension PlayerStats: StatsShootButtonProtocol {
    
    var getDuration: TimeInterval {
        get { fadeOutDuration }
    }
    
    
    func fadeOutAnimation() -> SKAction {
        let action = SKAction.run {
            for i in 0...self.activeFields.count-1 {
                
                UIView.animate(withDuration: self.fadeOutDuration) { self.activeFields[i].alpha = 0 }
//                self.activeFields[i].isHidden = true
                self.activeLines[i].run(SKAction.fadeOut(withDuration: self.fadeOutDuration))
            }
        }
        return action
    }
}
