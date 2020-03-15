import Foundation
import UIKit
import SpriteKit


protocol LayerGameSceneProtocol {
    
    func loadStat(rect: CGRect) -> UITextField
    
    func drawLine(start: CGPoint, end: CGPoint) -> SKShapeNode
    
    func loadButton(color: UIColor, size: CGSize, player: PlayerShootButtonProtocol) -> SKSpriteNode
}


extension UILayer: LayerGameSceneProtocol {
    
    func loadStat(rect: CGRect) -> UITextField {
        return playerStats.loadStat(rect: rect)
    }
    
    
    func drawLine(start: CGPoint, end: CGPoint) -> SKShapeNode {
        return playerStats.drawLine(start: start, end: end)
    }
    
    
    func loadButton(color: UIColor, size: CGSize, player: PlayerShootButtonProtocol) -> SKSpriteNode {
        
        shootButton.color = color
        shootButton.size = size
        shootButton.setPlayer = player
        return shootButton
    }
}
