import Foundation
import SpriteKit


public class GameScene: SKScene {
    
    var playerViewModel: PlayerGameSceneProtocol!
    var ballViewModel: BallGameSceneProtocol!
    var goalViewModel: GoalGameSceneProtocol!
    var uiLayer: LayerGameSceneProtocol!
    var scrWidth: CGFloat!
    var scrHeight: CGFloat!
    
    
    override public func didMove(to view: SKView) {
        
        setup()
        loadScene()
        loadUI()
        
//        setupSketch()
        
        
//        let goal = goalViewModel.getGoal
//        let minX = Points.GoalsPoints.InvalidRight().minX
//        let maxX = Points.GoalsPoints.InvalidRight().maxX
//        let minY = Points.GoalsPoints.InvalidRight().minY
//        let maxY = Points.GoalsPoints.InvalidRight().maxY
//        for _ in 0...1000 {
//            let point = SKShapeNode(circleOfRadius: 6)
//            let randomX = Int.random(in: Int(goal.position.x + goal.frame.size.width*minX)...Int(goal.position.x + goal.frame.size.width*maxX))
//            let randomY = Int.random(in: Int(goal.position.y + goal.frame.size.height*minY)...Int(goal.position.y + goal.frame.size.height*maxY))
//            point.fillColor = .red
//            point.position.x = CGFloat(randomX)
//            point.position.y = CGFloat(randomY)
//            addChild(point)
//        }
    }
    
    
    func setup() {
        
        goalViewModel = GoalViewModel(goalHeight: self.frame.height * 0.18)
        ballViewModel = BallViewModel(goal: goalViewModel as! GoalBallProtocol)
        
        playerViewModel = PlayerViewModel(ballVM: ballViewModel as! BallPlayerProtocol)
        
        scrWidth = frame.width
        scrHeight = frame.height
    }
    
    
    func setupSketch() {
        
        let background = SKSpriteNode(imageNamed: "bg")
        background.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        background.alpha = 0.3
        addChild(background)
    }
}
