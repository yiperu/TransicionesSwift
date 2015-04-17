//
//  EscenaInfo.swift
//  TransicionesSwift
//
//  Created by Henry AT on 4/16/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

//import Foundation
import SpriteKit

class EscenaInfo: SKScene {
  
  var creacionDeEscena:Bool = false
  
  override func didMoveToView(view: SKView) {
    
    if (!creacionDeEscena){
      creacionContenidoDeEscena()
      creacionDeEscena = true
    }
    
  }
  
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    
    let toque =  touches.first as? UITouch
    let pulsar = toque!.locationInNode(self)
    let nodo:SKNode = self.nodeAtPoint(pulsar)
    
    if(nodo.name == "volver"){
      let escena1 = EscenaMenu(size: size)
      //      let reveal = SKTransition.doorsOpenVerticalWithDuration(2)
      let reveal = SKTransition.doorsCloseVerticalWithDuration(2)
      self.view?.presentScene(escena1, transition: reveal)
    }
    
    
  }
  
  override func update(currentTime: CFTimeInterval) {
    
  }
  
  
  // MARK: - Creacion de Funciones necesarias
  func creacionContenidoDeEscena(){
    self.backgroundColor = SKColor.greenColor()
    self.addChild(volver())
    
  }
  
  func volver() -> SKLabelNode{
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    myLabel.text = "Volver";
    myLabel.fontSize = 30;
    myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
    myLabel.name = "volver";
    
    return myLabel
  }
  
  
}
