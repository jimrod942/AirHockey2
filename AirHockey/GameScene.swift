//
//  GameScene.swift
//  AirHockey
//
//  Created by student3 on 4/25/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import SpriteKit
import GameplayKit

let puckCategory: UInt32 = 0x1 << 0
let bottomCategory: UInt32 = 0x1 << 1
let topCategory: UInt32 = 0x1 << 2
let leftCategory: UInt32 = 0x1 << 3
let rightCategory: UInt32 = 0x1 << 4
let paddleCategory: UInt32 = 0x1 << 5
let goalCategory: UInt32 = 0x1 << 6
let scoreCategory: UInt32 = 0x1 << 7

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var rightPaddle = SKSpriteNode()
    var leftPaddle = SKSpriteNode()
    var puck = SKSpriteNode()
    var rightGoal = SKSpriteNode()
    var leftGoal = SKSpriteNode()
    var leftScore = SKSpriteNode()
    var rightScore = SKSpriteNode()
    
    override func didMove(to view: SKView)
    {
        rightPaddle = self.childNode(withName: "rightPaddle") as! SKSpriteNode
        leftPaddle = self.childNode(withName: "leftPaddle") as! SKSpriteNode
        puck = self.childNode(withName: "puck") as! SKSpriteNode
        
        physicsWorld.contactDelegate = self

        let bottomLeft = CGPoint(x: frame.origin.x, y: frame.origin.y)
        let bottomRight = CGPoint(x: -frame.origin.x, y: frame.origin.y)
        let topLeft = CGPoint(x: frame.origin.x, y: 234)
        let topRight = CGPoint(x: -frame.origin.x, y: 234)
        
        let bottom = SKSpriteNode()
        bottom.name = "bottom"
        bottom.physicsBody = SKPhysicsBody(edgeFrom: bottomLeft, to: bottomRight)
        
        let left = SKSpriteNode()
        left.name = "left"
        left.physicsBody = SKPhysicsBody(edgeFrom: bottomLeft, to: topLeft)
        
        let top = SKSpriteNode()
        top.name = "top"
        top.physicsBody = SKPhysicsBody(edgeFrom: topLeft, to: topRight)
        
        let right = SKSpriteNode()
        right.name = "right"
        right.physicsBody = SKPhysicsBody(edgeFrom: topRight, to: bottomRight)
        
        addChild(bottom)
        addChild(left)
        addChild(top)
        addChild(right)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
    
    override func update(_ currentTime: TimeInterval) {

    }
}
