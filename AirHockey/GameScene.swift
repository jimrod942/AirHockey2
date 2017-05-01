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
    var leftScore = SKLabelNode()
    var rightScore = SKLabelNode()
    var leftScoreCounter = 0
    var rightScoreCounter = 0
    
    override func didMove(to view: SKView)
    {
        rightPaddle = self.childNode(withName: "rightPaddle") as! SKSpriteNode
        leftPaddle = self.childNode(withName: "leftPaddle") as! SKSpriteNode
        puck = self.childNode(withName: "puck") as! SKSpriteNode
        rightGoal = self.childNode(withName: "rightGoal") as! SKSpriteNode
        leftGoal = self.childNode(withName: "leftGoal") as! SKSpriteNode

        
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
        for touch in touches {
            let location = touch.location(in: self)
            if location.x > 0 && location.y < 234{
                rightPaddle.run(SKAction.move(to: location, duration: 0.1))
            }
            if location.x < 0 && location.y < 234 {
                leftPaddle.run(SKAction.move(to: location, duration: 0.1))
            }
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if location.x > 0 && location.y < 234{
                rightPaddle.run(SKAction.move(to: location, duration: 0.1))
            }
            if location.x < 0 && location.y < 234 {
                leftPaddle.run(SKAction.move(to: location, duration: 0.1))
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == goalCategory {
            if contact.bodyA == leftGoal {
                leftScoreCounter += 1
                leftScore = SKLabelNode(text: "\(leftScoreCounter)")
            }
            else if contact.bodyA == rightGoal {
                rightScoreCounter += 1
                rightScore = SKLabelNode(text: "\(rightScoreCounter)")
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
