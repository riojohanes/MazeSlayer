//
//  GameScene.swift
//  Maze
//
//  Created by Rio Johanes Sumolang on 19/05/23.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var hero = SKSpriteNode()
    var mage = SKSpriteNode()
    var slime = SKSpriteNode()
    var mouse = SKSpriteNode()
    var ghost = SKSpriteNode()
    
    var left = SKSpriteNode()
    var right = SKSpriteNode()
    var up = SKSpriteNode()
    var down = SKSpriteNode()
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    var heroMovesLeft = false
    var heroMovesRight = false
    var heroMovesUp = false
    var heroMovesDown = false
    
    var audioPath: URL?
    var backgroundMusic = AVAudioPlayer()
    
//    private var lastUpdateTime : TimeInterval = 0
//    private var label : SKLabelNode?
//    private var spinnyNode : SKShapeNode?
    
    enum bitMask: UInt32 {
        case character = 0b1 // 1
        case ground = 0b10 // 2
    }
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        for node in self.children{
            if(node.name == "PlatformStones"){
                if let someTileMap: SKTileMapNode = node as? SKTileMapNode {
                    giveTileMapPhysicBody(map: someTileMap)

                    someTileMap.removeFromParent()
                }
                break
            }
        }
        
        addHero()
        addMage()
        addMouse()
        addSlime()
        addGhost()
        addArrow()
        
        audioPath = Bundle.main.url(forResource: "Alexander Nakarada - Adventure Royalty Free Medieval Fantasy Music", withExtension: "mp3")
        
        do{
            backgroundMusic = try AVAudioPlayer(contentsOf: audioPath!)
        } catch {
            print("not found")
        }
        
        backgroundMusic.numberOfLoops = 0
        backgroundMusic.prepareToPlay()
        backgroundMusic.play()
    }
    
    func addArrow() {
        left = childNode(withName: "ArrowLeft") as! SKSpriteNode
        right = childNode(withName: "ArrowRight") as! SKSpriteNode
        up = childNode(withName: "ArrowUp") as! SKSpriteNode
        down = childNode(withName: "ArrowDown") as! SKSpriteNode
    }
    
    func addHero() {
        hero = childNode(withName: "Hero") as! SKSpriteNode
        
        hero.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 25, height: 25))
        hero.physicsBody?.categoryBitMask = bitMask.character.rawValue
        hero.physicsBody?.contactTestBitMask = 0
        hero.physicsBody?.collisionBitMask = bitMask.ground.rawValue
        hero.physicsBody?.allowsRotation = false
        hero.physicsBody?.affectedByGravity = false
    }
    
    func addMage() {
        mage = childNode(withName: "Mage") as! SKSpriteNode
        
        mage.physicsBody = SKPhysicsBody(texture: mage.texture!, size: mage.size)
        mage.physicsBody?.categoryBitMask = bitMask.character.rawValue
        mage.physicsBody?.contactTestBitMask = 0
        mage.physicsBody?.collisionBitMask = bitMask.ground.rawValue
        mage.physicsBody?.allowsRotation = false
        mage.physicsBody?.affectedByGravity = false
    }
    
    func addMouse() {
        mouse = childNode(withName: "Mouse") as! SKSpriteNode
        
        mouse.physicsBody = SKPhysicsBody(texture: mouse.texture!, size: mouse.size)
        mouse.physicsBody?.categoryBitMask = bitMask.character.rawValue
        mouse.physicsBody?.contactTestBitMask = 0
        mouse.physicsBody?.collisionBitMask = bitMask.ground.rawValue
        mouse.physicsBody?.allowsRotation = false
        mouse.physicsBody?.affectedByGravity = false
    }
    
    func addGhost() {
        ghost = childNode(withName: "Mouse") as! SKSpriteNode
        
        ghost.physicsBody = SKPhysicsBody(texture: ghost.texture!, size: ghost.size)
        ghost.physicsBody?.categoryBitMask = bitMask.character.rawValue
        ghost.physicsBody?.contactTestBitMask = 0
        ghost.physicsBody?.collisionBitMask = bitMask.ground.rawValue
        ghost.physicsBody?.allowsRotation = false
        ghost.physicsBody?.affectedByGravity = false
    }
    
    func addSlime() {
        slime = childNode(withName: "Slime") as! SKSpriteNode
        
        slime.physicsBody = SKPhysicsBody(texture: slime.texture!, size: slime.size)
        slime.physicsBody?.categoryBitMask = bitMask.character.rawValue
        slime.physicsBody?.contactTestBitMask = 0
        slime.physicsBody?.collisionBitMask = bitMask.ground.rawValue
        slime.physicsBody?.allowsRotation = false
        slime.physicsBody?.affectedByGravity = false
    }
    
    func giveTileMapPhysicBody(map: SKTileMapNode){
        let tileMap = map
        let startLocation: CGPoint = tileMap.position
        let tileSize = tileMap.tileSize
        let halfWidth = CGFloat(tileMap.numberOfColumns) / 2.0 * tileSize.width
        let halfHeight = CGFloat(tileMap.numberOfRows) / 2.0 * tileSize.height
        
        for col in 0..<tileMap.numberOfColumns {
            for row in 0..<tileMap.numberOfRows {

                if let tileDefinition = tileMap.tileDefinition(atColumn: col, row: row){

                    let tileArray = tileDefinition.textures
                    let tileTextures = tileArray[0]
                    let x = CGFloat(col) * tileSize.width - halfWidth + (tileSize.width / 2)
                    let y = CGFloat(row) * tileSize.height - halfHeight + (tileSize.height / 2)

                    let tileNode = SKSpriteNode(texture: tileTextures)
                    tileNode.position = CGPoint(x: x, y: y)
                    tileNode.size = CGSize(width: 30, height: 30)
                    tileNode.physicsBody = SKPhysicsBody(texture: tileTextures, size: CGSize(width: 30, height: 30))
                    tileNode.physicsBody?.categoryBitMask = bitMask.ground.rawValue
                    tileNode.physicsBody?.contactTestBitMask = 0
                    tileNode.physicsBody?.collisionBitMask = bitMask.character.rawValue
                    tileNode.physicsBody?.affectedByGravity = false
                    tileNode.physicsBody?.isDynamic = false
                    tileNode.physicsBody?.friction = 1
                    tileNode.zPosition = 20
//                    tileNode.anchorPoint = .zero

                    tileNode.position = CGPoint(x: tileNode.position.x + startLocation.x, y: tileNode.position.y + startLocation.y)
                    self.addChild(tileNode)
                }
                
            }
        }
    }
    
//    override func sceneDidLoad() {
//
//        self.lastUpdateTime = 0
//
//        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
//
//        // Create shape node to use during mouse interaction
//        let w = (self.size.width + self.size.height) * 0.05
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let position = touch.location(in: self)
            let touchNode = self.nodes(at: position)
            
            for node in touchNode {
                if node.name == "ArrowLeft"{
                    heroMovesLeft = true
//                    node.position = CGPoint(x: camera!.position.x - 200, y: node.position.y)
                }
                
                if node.name == "ArrowRight"{
                    heroMovesRight = true
//                    node.position = CGPoint(x: camera!.position.x - 100, y: node.position.y)
                }
                
                if node.name == "ArrowUp"{
                    heroMovesUp = true
//                    node.position = CGPoint(x: camera!.position.x - 150, y: node.position.y + 50)
                }
                
                if node.name == "ArrowDown"{
                    heroMovesDown = true
//                    node.position = CGPoint(x: camera!.position.x - 150, y: node.position.y)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let position = touch.location(in: self)
            _ = self.nodes(at: position)
            
            heroMovesUp = false
            heroMovesDown = false
            heroMovesRight = false
            heroMovesLeft = false
            
//            for node in touchNode {
//                if node.name == "ArrowLeft"{
//                    heroMovesLeft = false
//                }
//
//                if node.name == "ArrowRight"{
//                    heroMovesRight = false
//                }
//
//                if node.name == "ArrowUp"{
//                    heroMovesUp = false
//                }
//
//                if node.name == "ArrowDown"{
//                    heroMovesDown = false
//                }
//            }
        }
    }
    
//    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
//    }
//
//    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//    }
//
//    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
//    }
    
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
    
    override func update(_ currentTime: TimeInterval) {
        let cameraPosition = camera?.position ?? .zero
        if heroMovesLeft == true {
            hero.position.x -= 1
            camera?.position.x = hero.position.x
//            left.position.x = camera!.position.x - 200
        }
        
        if heroMovesRight == true {
            hero.position.x += 1
            camera?.position.x = hero.position.x
        }
        
        if heroMovesUp == true {
            hero.position.y += 1
            camera?.position.y = hero.position.y
        }
        
        if heroMovesDown == true {
            hero.position.y -= 1
            camera?.position.y = hero.position.y
        }
        
        left.position.x = cameraPosition.x - 300
        left.position.y = cameraPosition.y - 150
        right.position.x = cameraPosition.x - 200
        right.position.y = cameraPosition.y - 150
        up.position.x = cameraPosition.x - 250
        up.position.y = cameraPosition.y - 100
        down.position.x = cameraPosition.x - 250
        down.position.y = cameraPosition.y - 150
    }

}
