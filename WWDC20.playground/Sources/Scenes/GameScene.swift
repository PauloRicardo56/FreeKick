import Foundation
import SpriteKit


class GameScene: SKScene {
    
    var playerViewModel: PlayerViewModelProtocol!
    var ballViewModel: BallViewModelProtocol!
    
    var scrWidth: CGFloat!
    var scrHeight: CGFloat!
    var goal: SKSpriteNode!
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func didMove(to view: SKView) {
        
        playerViewModel.loadPlayer()
        
        self.scrWidth = self.frame.width
        self.scrHeight = self.frame.height
        
        setupSketch()
        setupField()
    }
    
    
    func setup() {
        self.ballViewModel = BallViewModel(scene: self)
        self.playerViewModel = PlayerViewModel(ballVM: self.ballViewModel)
    }
    
    
    func showPlayer(playerNode: SKNode) {
        playerNode.position = CGPoint(x: scrWidth*0.83, y: scrHeight*0.25)
        addChild(playerNode)
    }
    
    
    func setupSketch() {
        
        let background = SKSpriteNode(imageNamed: "bg")
        background.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        addChild(background)
    }
    
    
    func showBall(ballNode: SKNode) {
        ballNode.position = CGPoint(x: scrWidth*0.5, y: scrHeight*0.32)
        addChild(ballNode)
    }
    
    
    
    func setupField() {
        
        var scrWidth = self.frame.width
        var scrHeight = self.frame.height
        var goalHeight: CGFloat! = 80
        var goalWidth: CGFloat! {
            return goalHeight*3
        }
        
        goal = SKSpriteNode(color: .white, size: CGSize(width: goalWidth, height: goalHeight))
        
        goal.position = CGPoint(x: scrWidth*0.45, y: scrHeight*0.48)
        goal.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        addChild(goal)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }
    
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }
    
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
