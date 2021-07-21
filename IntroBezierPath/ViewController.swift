//
//  ViewController.swift
//  IntroBezierPath
//
//  Created by Maurice Tin on 17/07/21.
//

import UIKit


class ViewController: UIViewController {
    
    var demoView: DemoView?
    var zoomScale: CGFloat = 1.0
    var lastLocation = CGPoint(x: 0.0, y: 0.0)
    
    var panRecognizer: UIPanGestureRecognizer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(detectPlan))
        
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(panRecognizer!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let width: CGFloat = 240.0
        let height: CGFloat = 160.0
        
        demoView = DemoView(frame: CGRect(x: self.view.frame.size.width/2 - width/2, y: self.view.frame.size.height/2 - height/2, width: width, height: height))
        
        self.view.addSubview(demoView!)
//        self.demoView?.transform = CGAffineTransform(translationX: 100.0, y: 100.0)
    }
    
    @IBAction func zoomInTapped(_ sender: UIButton) {
        
//        switch self.currentAnimation {
//        case 0:
//            self.demoView?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//            self.currentAnimation = 1
//            break
//        case 1:
//            self.demoView?.transform = .identity
//            break
//        default:
//            break
//        }
        zoomScale += 0.1
        zoom()
    }
    
    @IBAction func zoomOutTapped(_ sender: UIButton){
        zoomScale -= 0.1
        zoom()
    }
    
    func zoom(){
        self.demoView?.transform = CGAffineTransform(scaleX: zoomScale , y: zoomScale)
    }
    
    @objc func detectPlan(_ recognizer: UIPanGestureRecognizer){
        let translation = recognizer.translation(in: view)
        demoView?.center = CGPoint(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Remember original location
        lastLocation = demoView!.center
    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first
//        guard let point = touch?.location(in: view) else {return}
////        print("old point: \(point)")
//
//        initialPoint = point
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first
//        guard let point = touch?.location(in: view) else {return}
//
//        guard let initialPoint = initialPoint else {return}
//
//        let xTranslated = point.x - initialPoint.x
//        let yTranslated = point.y - initialPoint.y
//        self.demoView?.transform = CGAffineTransform(translationX: xTranslated, y: yTranslated)
//
//
//        self.initialPoint = point
//        print("moved point: \(point)")
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
////        print("end point: \(touches.first?.location(in: view))")
////        let touch = touches.first
////        guard let point = touch?.location(in: view) else {return}
////
////        guard let initialPoint = initialPoint else {return}
////
////        let xTranslated = point.x - initialPoint.x
////        let yTranslated = point.y - initialPoint.y
////        self.demoView?.transform = CGAffineTransform(translationX: xTranslated, y: yTranslated)
////
////
////        self.initialPoint = point
//    }
}

