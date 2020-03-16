import Foundation


protocol ShootButtonStatsProtocol {
    
    func turnActive()
}


extension ShootButton: ShootButtonStatsProtocol {
    
    func turnActive() {
        // TODO: Activate animation
        self.isUserInteractionEnabled = true
        self.alpha = 1
    }
}
