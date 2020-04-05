import Foundation
import SpriteKit


public class GameScene: SKScene {
    // MARK: Models
    var playerViewModel: PlayerViewModel!
    var ballViewModel: BallViewModel!
    var goalViewModel: GoalViewModel!
    var background: Background!
    var placar: Placar!
    var barreira: BarreiraViewModel!
    // MARK: UI
    var uiLayer: LayerToGameScene!
    var playerStats: [NewStats] = []
    var directionButtons: [DirectionButton] = []
    // MARK: Utils
    var scrWidth: CGFloat!
    var scrHeight: CGFloat!
    
    public override init(size: CGSize) {
        super.init(size: size)
        placar = .init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didMove(to view: SKView) {
        setup()
        loadScene()
        loadUI()
    }
    
    func setup() {
        goalViewModel = .init(goalHeight: frame.height * 0.18)
        ballViewModel = .init(goal: goalViewModel)
        ballViewModel.placar = placar
        playerViewModel = .init(ballVM: ballViewModel)
        
        scrWidth = frame.width
        scrHeight = frame.height
    }
}

// MARK: - GameSceneToBall
extension GameScene: GameSceneToBall {
    
    func restart() {
        let scene = GameScene(size: view!.frame.size)
        scene.scaleMode = .aspectFill
        view!.presentScene(scene)
    }
}

// MARK: - Scene load
extension GameScene {
    func loadScene() {
        let goal = goalViewModel.loadGoal()
        goal.zPosition = -1
        goal.position = .init(x: scrWidth*0.4, y: scrHeight*0.6)
        addChild(goal)
        
        let ball = ballViewModel.loadBall()
        ball.zPosition = 3
        ball.position = .init(x: scrWidth*0.5, y: scrHeight*0.32)
        ballViewModel.gameScene = self
        addChild(ball)
        
        let player = playerViewModel.loadPlayer()
        player.zPosition = 4
        player.setScale(1.8)
        player.position = .init(x: scrWidth*0.83, y: scrHeight*0.25)
        addChild(player)
        
        let goalkeeper = Goalkeeper(goal: goalViewModel)
        zPosition = 0
        goalkeeper.position = .init(x: -goal.frame.width*0.2, y: goal.frame.height*0.3) + goal.position
        addChild(goalkeeper)
        playerViewModel.setGoalkeeper = goalkeeper
        ballViewModel.setGoalkeeper = goalkeeper
        
        background = Background(goal: goalViewModel, goalkeeper: goalkeeper)
        background.zPosition = -2
        background.setScale(1.8)
        background.position = .init(x: frame.size.width/2, y: frame.size.height/2)
        addChild(background)
        ballViewModel.setBackground = background
        
        setPlacar()
        placar.zPosition = 9
        
        let label = LabelViewModel()
        label.zPosition = 10
        label.position = .init(x: size.width/2, y: size.height/2)
        ballViewModel.setLabel = label
        addChild(label)
        
        barreira = .init(imageNamed: Assets.barreira)
        barreira.zPosition = 2
        barreira.setScale(0.9)
        barreira.anchorPoint = .init(x: 0.5, y: 0)
        barreira.position = .init(x: size.width*0.55, y: size.height*0.5)
        addChild(barreira)
        background.barreira = barreira
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
