import Foundation


protocol ShootButtonStatsProtocol {
    
    func turnActive()
}


extension ShootButton: ShootButtonStatsProtocol {
    
    func turnActive() {
        //TODO: Activate animation
        self.alpha = 1
    }
}
