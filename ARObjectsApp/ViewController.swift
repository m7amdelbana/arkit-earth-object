//
//  ViewController.swift
//  ARObjectsApp
//
//  Created by Mohamed Elbana on 19/11/2023.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        sceneView.scene = scene
        
        let sphere = SCNSphere(radius: 0.1)
        sphere.firstMaterial?.diffuse.contents = UIImage(named: "8k_earth_daymap.jpg")
        
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3(x: 0, y: 0, z: -0.3)
        
        sceneView.scene.rootNode.addChildNode(sphereNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    
    // Override to create and configure nodes for anchors added to the view's session.
    /*
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        
    }
}
