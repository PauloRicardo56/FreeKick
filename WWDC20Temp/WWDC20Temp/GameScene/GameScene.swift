import Foundation
import SpriteKit


class GameScene: SKScene {
    var playerViewModel: PlayerToGameScene!
    var ballViewModel: BallToGameScene!
    var goalViewModel: (GoalToGameScene & GoalToGoalkeeper)!
    var uiLayer: LayerToGameScene!
    var scrWidth: CGFloat!
    var scrHeight: CGFloat!
    
    override func didMove(to view: SKView) {
        setup()
        loadScene()
        loadUI()
    }
    
    func setup() {
        goalViewModel = GoalViewModel(goalHeight: self.frame.height * 0.18)
        ballViewModel = BallViewModel(goal: goalViewModel as! GoalToBall)
        playerViewModel = PlayerViewModel(ballVM: ballViewModel as! BallToPlayer)
        
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

//MARK: - Scene load
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
        
        let goalkeeper = Goalkeeper(goal: goalViewModel)
        goalkeeper.position = CGPoint(x: -goal.frame.width*0.4, y: 0)
        goal.addChild(goalkeeper)
    }
}

//MARK: - UI load
extension GameScene {
    func loadUI() {
        self.uiLayer = UILayer()
        let statsSize = CGSize(width: self.view!.frame.width*0.45, height: 10)
        
        let str = uiLayer.loadStat(size: statsSize, statType: .strength)
        str.position = CGPoint(x: 50, y: 380)
        ballViewModel.setBallNewStats["str"] = str
        addChild(str)
        
        let eff = uiLayer.loadStat(size: statsSize, statType: .effect)
        eff.position = CGPoint(x: 50, y: 330)
        addChild(eff)
        ballViewModel.setBallNewStats["eff"] = eff
        
        self.uiLayer.setButtonStats(stats: [str, eff])
        
        loadButton()
    }
    
    func loadButton() {
        let button = uiLayer.loadButton(color: .green, size: CGSize(width: 80, height: 80), player: playerViewModel as! PlayerToShootButton)
        button.position = CGPoint(x: 100, y: 100)
        addChild(button)
    }
}
