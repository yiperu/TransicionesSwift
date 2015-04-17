//
//  EscenaMenu.swift
//  TransicionesSwift
//
//  Created by Henry AT on 4/16/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

//import Foundation
import SpriteKit

class EscenaMenu: SKScene {
  
  var creacionDeEscena:Bool = false
  
  override func didMoveToView(view: SKView) {
    
    if (!creacionDeEscena){
      creacionContenidoDeEscena()
      creacionDeEscena = true
    }
    
  }
  
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    
//      let toque:UITouch = touches.anyObject() as UITouch
    
/*
    for touch: AnyObject in touches {
      
      let pulsar = (touch as! UITouch).locationInNode(self)
      let nodo:SKNode = self.nodeAtPoint(pulsar)
      
      if(nodo.name == "juego"){
        let escena1 = EscenaJuego(size: size)
        //            escena1.scaleMode = scaleMode
        let reveal = SKTransition.doorsOpenVerticalWithDuration(2)
//      self.view?.presentScene(escena1, transition: reveal)
//      view?.presentScene(escena1, transition: reveal)
        view!.presentScene(escena1, transition: reveal)
      }
    }
*/
    
    
//      let toque = touches.anyObject() as UITouch

      let toque =  touches.first as? UITouch
      let pulsar = toque!.locationInNode(self)
      let nodo:SKNode = self.nodeAtPoint(pulsar)
    
      if(nodo.name == "juego"){
            let escena1 = EscenaJuego(size: size)
//            escena1.scaleMode = scaleMode
        let reveal = SKTransition.doorsOpenVerticalWithDuration(2)
        self.view?.presentScene(escena1, transition: reveal)
//             view!.presentScene(escena1, transition: reveal)
    }
    if(nodo.name == "info"){
      let escena2 = EscenaInfo(size: size)
      let reveal2 = SKTransition.doorsOpenVerticalWithDuration(2)
      self.view?.presentScene(escena2, transition: reveal2)
    }

    
  }
  
  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
  }
  
  
  // MARK: - Creacion de Funciones necesarias
  func creacionContenidoDeEscena(){
      self.backgroundColor = SKColor.blueColor()
      self.addChild(pantallaMenu())
      self.addChild(juego())
      self.addChild(botonInfo())
  }
  
  func pantallaMenu() -> SKLabelNode{
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Titulo Juego";
        myLabel.fontSize = 30;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
//        self.addChild(myLabel)
      return myLabel
  }
  
  func juego() -> SKLabelNode{
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    myLabel.text = "- Juego";
    myLabel.fontSize = 20;
    myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)-30);
    
    println("Point: \(NSStringFromCGPoint(myLabel.position))") //Prints "My method"
    println("Point: \(UIKit.NSStringFromCGPoint(myLabel.position))") //Prints "{10, 10}"

    
    myLabel.name = "juego"
    return myLabel
  }
  
  func botonInfo() -> SKLabelNode{
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    myLabel.text = "- Informacion";
    myLabel.fontSize = 20;
    myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)+30);
    myLabel.name = "info"
    return myLabel
  }
  
  
}
