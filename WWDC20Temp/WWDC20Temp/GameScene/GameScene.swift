import Foundation
import SpriteKit


class GameScene: SKScene {
    // MARK: Models
    var playerViewModel: PlayerViewModel!
    var ballViewModel: BallViewModel!
    var goalViewModel: GoalViewModel!
    var background: Background!
    var placar: Placar!
    // MARK: UI
    var uiLayer: LayerToGameScene!
    var playerStats: [NewStats] = []
    var directionButtons: [DirectionButton] = []
    // MARK: Delegates
    var gameVC: GameVCToBall!
    // MARK: Utils
    var scrWidth: CGFloat!
    var scrHeight: CGFloat!
    
    init(size: CGSize, gameVC: GameVCToBall) {
        super.init(size: size)
        self.gameVC = gameVC
        self.placar = .init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        setup()
        loadScene()
        loadUI()
        
//        let label = LabelViewModel()
//        label.position = .init(x: size.width/2, y: size.height/2)
//        label.zPosition = 10
//        addChild(label)
//
//        label.animate()
        
        
//        for _ in 0...100 {
//            let ball = SKShapeNode(circleOfRadius: 10)
//            ball.fillColor = .blue
//            ball.position = goalViewModel.getGoalPoint(side: Points.GoalsPoints.GkDefenseLeft())
//            addChild(ball)
//        }
//        for _ in 0...100 {
//            let ball = SKShapeNode(circleOfRadius: 10)
//            ball.fillColor = .red
//            ball.position = goalViewModel.getGoalPoint(side: Points.GoalsPoints.GkDefenseRight())
//            addChild(ball)
//        }
    }
    
    func setup() {
        goalViewModel = .init(goalHeight: frame.height * 0.18)
        ballViewModel = .init(goal: goalViewModel)
        ballViewModel.setGameVC = gameVC
        ballViewModel.placar = placar
        playerViewModel = .init(ballVM: ballViewModel)
        
        scrWidth = frame.width
        scrHeight = frame.height
    }
}

// MARK: - Scene load
extension GameScene {
    func loadScene() {
        let goal = goalViewModel.loadGoal()
        goal.position = .init(x: scrWidth*0.4, y: scrHeight*0.6)
        goal.zPosition = -1
        addChild(goal)
        
        let ball = ballViewModel.loadBall()
        ball.position = .init(x: scrWidth*0.5, y: scrHeight*0.32)
        addChild(ball)
        
        let player = playerViewModel.loadPlayer()
        player.setScale(1.8)
        player.position = .init(x: scrWidth*0.83, y: scrHeight*0.25)
        addChild(player)    
        
        let goalkeeper = Goalkeeper(goal: goalViewModel)
        goalkeeper.position = .init(x: -goal.frame.width*0.2, y: goal.frame.height*0.3) + goal.position
        addChild(goalkeeper)
        playerViewModel.setGoalkeeper = goalkeeper
        ballViewModel.setGoalkeeper = goalkeeper
        goalkeeper.gameVC = gameVC
        
        background = Background(goal: goalViewModel, goalkeeper: goalkeeper)
        background.setScale(1.8)
        background.position = .init(x: frame.size.width/2, y: frame.size.height/2)
        background.zPosition = -2
        addChild(background)
        ballViewModel.setBackground = background
        
        setPlacar()
        
        let label = LabelViewModel()
        label.position = .init(x: size.width/2, y: size.height/2)
        label.zPosition = 10
        ballViewModel.setLabel = label
        addChild(label)
    }
    
    func setPlacar() {
        placar.position = .init(x: size.width/2, y: size.height*0.9)
        addChild(placar)
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
        
        
        playerStats.append(uiLayer.loadStat(statType: .str))
        playerStats[0].activate()
        x = scrWidth/2 - playerStats[0].size.width/2
        playerStats[0].position = .init(x: x, y: scrHeight * strYMult)
        ballViewModel.setBallNewStats["str"] = playerStats[0]
        addChild(playerStats[0])
        
        playerStats.append(uiLayer.loadStat(statType: .eff))
        playerStats[1].position = .init(x: x, y: scrHeight * effYMult)
        addChild(playerStats[1])
        ballViewModel.setBallNewStats["eff"] = playerStats[1]
        
        uiLayer.setButtonStats(stats: [playerStats[0], playerStats[1]])
        background.stats = [playerStats[0], playerStats[1]]
        
        loadDirections()
        loadButton()
    }
    
    func loadButton() {
        let button = uiLayer.loadButton(directions: directionButtons, player: playerViewModel)
        button.position = .init(x: 1200, y: 100)
        addChild(button)
    }
    
    func loadDirections() {
        directionButtons.append(DirectionButton(isLeft: true, background: background))
        directionButtons[0].position = .init(x: 80, y: 100)
        addChild(directionButtons[0])
        directionButtons[0].newStats = playerStats
        
        directionButtons.append(DirectionButton(isLeft: false, background: background))
        directionButtons[1].position = .init(x: 250, y: 100)
        addChild(directionButtons[1])
        directionButtons[1].newStats = playerStats
    }
}
