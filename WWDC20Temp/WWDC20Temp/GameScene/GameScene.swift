import Foundation
import SpriteKit


class GameScene: SKScene {
    var playerViewModel: PlayerToGameScene!
    var ballViewModel: BallToGameScene!
    var goalViewModel: GoalViewModel!
    //(GoalToGameScene & GoalToGoalkeeper & GoalToBackground)!
    var uiLayer: LayerToGameScene!
    var scrWidth: CGFloat!
    var scrHeight: CGFloat!
    var background: Background!
    var strStats: NewStats!
    var effStats: NewStats!
    var gameVC: GameVCToBall!
    
    init(size: CGSize, gameVC: GameVCToBall) {
        super.init(size: size)
        self.gameVC = gameVC
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        setup()
        loadScene()
        loadUI()
        
//        for _ in 0...1000 {
//            let ball = SKShapeNode(circleOfRadius: 10)
//            ball.fillColor = .red
//            ball.position = goalViewModel.getGoalPoint(side: Points.GoalsPoints.ValidRight())
//            addChild(ball)
//        }
    }
    
    func setup() {
        goalViewModel = GoalViewModel(goalHeight: frame.height * 0.18)
        ballViewModel = BallViewModel(goal: goalViewModel)
        ballViewModel.setGameVC = gameVC
        playerViewModel = PlayerViewModel(ballVM: ballViewModel as! BallToPlayer)
        
        scrWidth = frame.width
        scrHeight = frame.height
    }
    
//    func setupSketch() {
//        let background = SKSpriteNode(imageNamed: "bg")
//        background.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
//        background.alpha = 0.3
//        addChild(background)
//    }
}

// MARK: - Scene load
extension GameScene {
    func loadScene() {
        let goal = goalViewModel.loadGoal()
        goal.position = CGPoint(x: scrWidth*0.4, y: scrHeight*0.6)
        goal.zPosition = -1
        addChild(goal)
        
        let ball = ballViewModel.loadBall()
        ball.position = CGPoint(x: scrWidth*0.5, y: scrHeight*0.32)
        addChild(ball)
        
        let player = playerViewModel.loadPlayer()
        player.setScale(1.8)
        player.position = CGPoint(x: scrWidth*0.83, y: scrHeight*0.25)
        addChild(player)    
        
        let goalkeeper = Goalkeeper(goal: goalViewModel)
        goalkeeper.position = CGPoint(x: -goal.frame.width*0.4, y: -goal.frame.height*0.05) + goal.position
        addChild(goalkeeper)
        
        background = Background(goal: goalViewModel, goalkeeper: goalkeeper)
        background.setScale(1.8)
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        background.zPosition = -2
        addChild(background)
        
        ballViewModel.setBackground = background
    }
}

// MARK: - UI load
extension GameScene {
    func loadUI() {
//        Above the ball:
//        let strYMult: CGFloat = 0.45
//        let effYMult: CGFloat = 0.4

//        Below the ball
        let strYMult: CGFloat = 0.25
        let effYMult: CGFloat = 0.2
        
        let x: CGFloat
        uiLayer = UILayer()
        
        
        strStats = uiLayer.loadStat(statType: .str)
        x = scrWidth/2 - strStats.size.width/2
        strStats.position = CGPoint(x: x, y: scrHeight * strYMult)
        ballViewModel.setBallNewStats["str"] = strStats
        addChild(strStats)
        
        effStats = uiLayer.loadStat(statType: .eff)
        effStats.position = CGPoint(x: x, y: scrHeight * effYMult)
        addChild(effStats)
        ballViewModel.setBallNewStats["eff"] = effStats
        
        uiLayer.setButtonStats(stats: [strStats, effStats])
        background.stats = [strStats, effStats]
        
        loadButton()
        loadDirections(stats: [strStats, effStats])
    }
    
    func loadButton() {
        let button = uiLayer.loadButton(color: .green, size: CGSize(width: 120, height: 120), player: playerViewModel as! PlayerToShootButton)
        button.position = CGPoint(x: 1200, y: 100)
        addChild(button)
    }
    
    func loadDirections(stats: [NewStats]) {
        let left = DirectionButton(isLeft: true, background: background)
        left.position = CGPoint(x: 80, y: 100)
        addChild(left)
        left.newStats = stats
        
        let right = DirectionButton(isLeft: false, background: background)
        right.position = CGPoint(x: 250, y: 100)
        addChild(right)
        right.newStats = stats
    }
}
