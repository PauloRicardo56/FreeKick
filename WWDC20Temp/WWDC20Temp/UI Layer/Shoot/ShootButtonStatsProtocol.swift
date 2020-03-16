import Foundation


protocol ShootButtonStatsProtocol {
    
    func turnActive()
    
    func turnInactive()
}


extension ShootButton: ShootButtonStatsProtocol {
    
    func turnActive() {
        // TODO: Activate animation
        self.isUserInteractionEnabled = true
        self.alpha = 1
    }
    
    
    func turnInactive() {
        // TODO: Deactivate animation
        self.isUserInteractionEnabled = false
        self.alpha = 0.3
    }
}
