//
//  ViewController.swift
//  Planets
//
//  Created by Ivan Ken Tiu on 23/09/2017.
//  Copyright © 2017 Ivan Ken Tiu. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
        self.sceneView.showsStatistics = true
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    // make sure the view appeared!
    override func viewDidAppear(_ animated: Bool) {
        let earth = SCNNode()
        earth.geometry = SCNSphere(radius: 0.2)
        earth.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Earth day")
        earth.geometry?.firstMaterial?.specular.contents = #imageLiteral(resourceName: "Earth Specular")
        earth.geometry?.firstMaterial?.emission.contents = #imageLiteral(resourceName: "Earth Emission")
        earth.geometry?.firstMaterial?.normal.contents = #imageLiteral(resourceName: "Earth Normal")
        earth.position = SCNVector3(0, 0, -1)
        self.sceneView.scene.rootNode.addChildNode(earth)
        
        // takes 8 secs(duration) the rotate fully around itself
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 8)
        
        // make animation last forever
        let forever = SCNAction.repeatForever(action)
        
        // make sure run the action
        earth.runAction(forever)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180 }
}

