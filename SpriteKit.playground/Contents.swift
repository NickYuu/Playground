//: Playground - noun: a place where people can play
//: Playground - noun: a place where people can play
/*
 README
 just copy & paste the code into an iOS playground of Xcode 7.3+
 click display timeline to play in the liveview
 */

import UIKit
import SpriteKit
import XCPlayground
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


struct CollisionMask {
    static let None : UInt32 = 0
    static let Ball : UInt32 = 0b1
    static let Basket : UInt32 = 0b10
    static let Sensor : UInt32 = 0b100
}

class BasketBallNode : SKLabelNode {
    var dragStart:CGPoint?
    
    override init() {
        super.init()
        text = "🏀"
        fontColor = UIColor.black
        fontSize = 200
        physicsBody = SKPhysicsBody(circleOfRadius: 95, center: CGPoint(x: 0, y: 75))
        physicsBody?.affectedByGravity = false
        physicsBody?.restitution = 0.8
        physicsBody?.categoryBitMask =  CollisionMask.Ball
        physicsBody?.collisionBitMask = CollisionMask.Basket
        appearBeforeRing = true
    }
    
    var appearBeforeRing:Bool {
        set { zPosition = newValue ? 1 : -1 }
        get { return zPosition == 1 }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touches
        guard dragStart == nil else { return }
        dragStart = touches.first?.location(in: self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let start = dragStart else { return }
        let end = touches.first!.location(in: self)
        shoot(start, to: end)
        dragStart = nil
    }
    
    func shoot(_ from:CGPoint, to:CGPoint){
        let dx = (to.x-from.x)/2.5
        let dy = to.y-from.y
        let norm = sqrt(pow(dx, 2) + pow(dy, 2))
        let base:CGFloat = 2000
        physicsBody?.affectedByGravity = true
        let impulse = CGVector(dx: base * (dx/norm), dy: base * (dy/norm))
        physicsBody?.applyImpulse(impulse)
        let scale:CGFloat = 0.5
        let scaleDuration:TimeInterval = 1.1
        run(SKAction.scale(by: scale, duration: scaleDuration))
    }
    func reset(_ pos:CGPoint){
        physicsBody?.affectedByGravity = false
        physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        physicsBody?.angularVelocity = 0
        zPosition = 1
        zRotation = 0
        position = pos
        xScale = 1
        yScale = 1
        appearBeforeRing = true
    }
}


class Basket:SKNode {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    let rad:CGFloat = 200
    let h:CGFloat = 10
    var ring:SKShapeNode?
    override init() {
        super.init()
        initRing()
        initScoreSensor()
    }
    
    var sensor:SKNode?
    func initScoreSensor() {
        sensor = SKNode()
        let phy = SKPhysicsBody(circleOfRadius: 3*h, center: CGPoint(x: rad/2, y: -rad/2))
        phy.affectedByGravity = false
        phy.isDynamic = false
        phy.collisionBitMask = CollisionMask.None
        phy.contactTestBitMask = CollisionMask.Ball
        phy.categoryBitMask = CollisionMask.Sensor
        sensor!.physicsBody = phy
        addChild(sensor!)
    }
    
    func initRing() {
        ring = SKShapeNode(rect: CGRect(x: 0, y: 0, width: rad, height: 2*h))
        ring!.fillColor = UIColor.red
        let l = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: 2*h), to: CGPoint(x: 3*h, y: 2*h))
        let r = SKPhysicsBody(edgeFrom: CGPoint(x: rad-3*h, y: 2*h), to: CGPoint(x: rad, y: 2*h))
        ring!.physicsBody = SKPhysicsBody(bodies: [l,r])
        ring!.physicsBody?.affectedByGravity = false
        ring!.physicsBody?.isDynamic = false
        ringEnabled = false
        addChild(ring!)
    }
    var ringEnabled:Bool {
        set {
            ring?.physicsBody?.collisionBitMask = newValue ? CollisionMask.Ball : CollisionMask.None
            ring?.physicsBody?.categoryBitMask = newValue ? CollisionMask.Basket : CollisionMask.None
        }
        get {
            return ring?.physicsBody?.collisionBitMask == CollisionMask.Ball
        }
    }
}

class BasketBallScene: SKScene, SKPhysicsContactDelegate {
    var contentCreated:Bool = false
    var ball:BasketBallNode?
    var basket:Basket?
    var scoreText:SKLabelNode?
    var score:Int = 0 {
        didSet {
            scoreText?.text = "Score: \(score)"
        }
    }
    override func didMove(to view: SKView) {
        guard !contentCreated else { return }
        createContent()
        contentCreated = true
    }
    
    func createContent(){
        backgroundColor = SKColor.white
        self.scaleMode = .aspectFit
        addChild(newBallNode())
        addChild(newBasketNode())
        addChild(newScoreText())
        physicsWorld.contactDelegate = self
    }
    
    func ballPosition() -> CGPoint {
        return CGPoint(x: frame.midX, y: 50)
    }
    
    func newScoreText() -> SKLabelNode {
        let n = SKLabelNode()
        scoreText = n
        n.fontSize = 70
        n.fontName = "helvetica"
        n.fontColor = UIColor.black
        n.text = "Score: 0"
        n.zPosition = -2
        n.position = CGPoint(x: frame.midX, y: 500)
        return n
    }
    
    func newBasketNode() -> Basket {
        let basket = Basket()
        self.basket = basket
        basket.position = CGPoint(x: frame.midX - basket.rad/2, y: 700)
        return basket
    }
    
    func newBallNode() -> SKLabelNode {
        let node = BasketBallNode()
        ball = node
        node.position = ballPosition()
        node.isUserInteractionEnabled = true
        return node
    }
    
    func resetBall() {
        ball?.reset(ballPosition())
        basket?.ringEnabled = false
    }
    
    func ballAboveRing()->Bool {
        return basket?.position.y < ball?.position.y
    }
    
    override func update(_ currentTime: TimeInterval) {
        if ballAboveRing() {
            basket?.ringEnabled = true
            ball?.appearBeforeRing = false
        }
        if ball?.position.y < -300 {
            resetBall()
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        guard basket!.ringEnabled else { return }
        score += 1
    }
}

class BasketBallController: UIViewController {
}

var vc = BasketBallController()
let view = SKView(frame: vc.view.frame)
vc.view = view
vc.view.backgroundColor = UIColor.white
XCPlaygroundPage.currentPage.liveView = vc
view.showsFPS = true
view.showsNodeCount = true
view.showsPhysics = true
let size = CGSize(width: 768,height: 1024)
let scene = BasketBallScene(size: size)
view.presentScene(scene)
