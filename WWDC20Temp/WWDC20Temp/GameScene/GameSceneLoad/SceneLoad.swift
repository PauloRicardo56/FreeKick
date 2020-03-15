import Foundation
import SpriteKit


extension GameScene {
    
    func loadScene() {
        
        let goal = goalViewModel.loadGoal()
        goal.position = CGPoint(x: scrWidth*0.45, y: scrHeight*0.49)
        addChild(goal)
        
        let ball = ballViewModel.loadBall()
        ball.position = CGPoint(x: scrWidth*0.5, y: scrHeight*0.32)
        addChild(ball)
        
        let player = playerViewModel.loadPlayer()
        player.position = CGPoint(x: scrWidth*0.83, y: scrHeight*0.25)
        addChild(player)
    }
}
