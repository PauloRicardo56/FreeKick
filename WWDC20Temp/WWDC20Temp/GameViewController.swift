import GameplayKit

class GameViewController: UIViewController {
    var scene: GameScene!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            scene = GameScene(size: view.frame.size, gameVC: self)
            
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = true
        }
    }
}

extension GameViewController: GameVCToBall {
    func restart() {
        if let view = self.view as! SKView? {
            scene = GameScene(size: view.frame.size, gameVC: self)
            view.presentScene(scene, transition: .crossFade(withDuration: 1))
        }
    }
}
