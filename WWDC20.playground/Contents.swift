/*: # Free Kick
 * A Free Kick is a method of restarting play in soccer. It is awarded after an infringement of the laws by the opposing team.
 * The free kick is taken from the place where the infringemente ocurred.
 - - -
 ![FreeKick](ball/ballFrame-4.png)
 * In this scene, you are playing a game in the last minute, your team was losing by 3 - 0 and one player was sent off (red card).
 * But, by some miracle, your team could tie the game, and at the last minute you won a Free Kick.
 * This is your chance to score a goal and be a hero for your teammates and for 20 milions fans in the world!

 ![FreeKick2](player/frame-8.png)
 ## Instructions
 * The left and right arrows are for you to choose which side of the goal you are aiming.
 * The slides are the stats of the player, red is the strength of the kick and blue is the effect applied on the ball. **Here you need to put each slide on top of the green bar.**
 * And finally, the **kick button**, click on it to stop the current slider, when you set both sliders, the player will kick the ball with the stats you took. Easy right?
 
 ![FreeKick3](barreira/barreira.png)
*/
import PlaygroundSupport
import SpriteKit


let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 800, height: 600))
let scene = GameScene(size: sceneView.frame.size)

scene.scaleMode = .aspectFill
sceneView.presentScene(scene)

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
