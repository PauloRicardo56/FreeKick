import Foundation
import SpriteKit


extension GameScene {
    
    
    
    func loadUI() {
        
        uiLayer = UILayer()
        
        var rect = CGRect(x: 800, y: 100, width: scrWidth*0.15, height: scrHeight*0.05)
        loadStat(rect, playerPoint: Points.PlayerPoints.thigh, statsPoint: Points.StatsPoints.strength)
        
        rect = CGRect(x: 400, y: 100, width: scrWidth*0.15, height: scrHeight*0.05)
        loadStat(rect, playerPoint: Points.PlayerPoints.knee, statsPoint: Points.StatsPoints.knee)

        rect = CGRect(x: 400, y: 150, width: scrWidth*0.15, height: scrHeight*0.05)
        loadStat(rect, playerPoint: Points.PlayerPoints.feet, statsPoint: Points.StatsPoints.effect)
        
        loadButton()
    }
    
    
    func loadButton() {
        
        let button = uiLayer.loadButton(color: .green, size: CGSize(width: 80, height: 80), player: playerViewModel as! PlayerShootButtonProtocol)
        button.position = CGPoint(x: 100, y: 100)
        addChild(button)
    }
    
    
    func loadStat(_ rect: CGRect, playerPoint: Points.PlayerPoints, statsPoint: Points.StatsPoints) {
        
        let strenghtStat = uiLayer.loadStat(rect: rect)
        view!.addSubview(strenghtStat)
        
        let playerFrame = playerViewModel.getPlayerFrame()
        let converted = convertPoint(toView: strenghtStat.frame.origin)
        let statusFrame = CGRect(origin: converted, size: strenghtStat.frame.size)
        
        let strengthLine = uiLayer.drawLine(start: statsPoint.getPos(statusFrame: statusFrame), end: playerPoint.getPos(playerFrame: playerFrame))
        
        addChild(strengthLine)
    }
}
