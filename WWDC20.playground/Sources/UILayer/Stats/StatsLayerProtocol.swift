import Foundation
import UIKit
import SpriteKit


protocol StatsLayerProtocol {
    
    var setButton: ShootButtonStatsProtocol { get set }
    
    func loadStat(rect: CGRect) -> UITextField
    
    func drawLine(start: CGPoint, end: CGPoint) -> SKShapeNode
}


extension PlayerStats: StatsLayerProtocol {
    
    var setButton: ShootButtonStatsProtocol {
        get { return shootButton }
        set { shootButton = newValue }
    }
    
    func loadStat(rect: CGRect) -> UITextField {
        
        let textField = UITextField(frame: rect)
        textField.delegate = self
        textField.backgroundColor = .green
        activeFields.append(textField)
        return textField
    }
    
    
    func drawLine(start: CGPoint, end: CGPoint) -> SKShapeNode {
        
        let line = SKShapeNode()
        let path = CGMutablePath()

        path.move(to: start)
        path.addLine(to: end)
        line.path = path
        line.strokeColor = .red
        activeLines.append(line)

        return line
    }
}
