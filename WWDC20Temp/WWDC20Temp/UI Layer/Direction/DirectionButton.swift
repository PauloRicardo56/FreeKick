import SpriteKit


class DirectionButton: SKSpriteNode {
    let isLeft: Bool!
    let background: BackgroundToDirection!
    // MARK: Delegates
    var newStats: [NewStatsToDirection]!
    
    init(isLeft: Bool, background: BackgroundToDirection) {
        self.isLeft = isLeft
        self.background = background
        super.init(texture: nil, color: .blue, size: CGSize(width: 80, height: 80))
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        background.changePosition(leftSide: isLeft)
//        newStats[0].moveGreenBar(width: <#T##CGFloat#>, x: <#T##CGFloat#>)
    }
    
    func moveGreenBar() {
        
        
    }
}
