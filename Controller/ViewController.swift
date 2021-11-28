//
//  ViewController.swift
//  Project 3
//
//  Created by Yahia Sultan on 11/8/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var repeatLabel: UILabel!
    var repeating = false;
    
    @IBAction func Repeat(_ sender: Any) {
        if repeating == false{
            repeating = true;
            repeatLabel.text = "True"
        }else{
            repeating = false
            repeatLabel.text = "False"
        }
    }
    
    
    @IBAction func startAnimation(_ sender: Any) {
        let firstView = UIView(frame: CGRect(x: 16, y: 650, width: 100, height: 100));
        firstView.backgroundColor = getColor()
        view.addSubview(firstView)
        
        let start = CGPoint(x: 66, y:650)
        let end = CGPoint(x: 66, y: -100)
        let duration: Double = 2.0
        let animate = posAni(start: start, end: end, time: duration)
        
        firstView.layer.add(animate, forKey:"position")
        if repeating == false {
            firstView.layer.position = end
        }
        firstView.layer.add(scale(to:0.3, duration: duration/2), forKey: "transform.scale")
    }
    
    @IBAction func startAniTwo(_ sender: Any) {
        let secondView = UIView(frame: CGRect(x: 274, y: 650, width: 100, height: 100));
        secondView.backgroundColor = getColor()
        view.addSubview(secondView)
        
        let start = CGPoint(x: 274, y: 650)
        let duration : Double = 2.5
        let animate = edge(start: start, time: duration)
        
        secondView.layer.add(animate, forKey: "position")
        if repeating == false{
            secondView.layer.position = CGPoint(x: -100, y: -100)
        }
        secondView.layer.add(rotate(duration: 1), forKey: "transform.rotation")
    }
    private func edge(start: CGPoint, time: Double) -> CABasicAnimation {
        let animate = CABasicAnimation(keyPath: "position")
        animate.fromValue = NSValue(cgPoint: start)
        animate.toValue = NSValue(cgPoint: CGPoint(x: 66, y: 150))
        animate.duration = time
        if repeating == true{
            animate.repeatCount = Float.infinity
            animate.autoreverses = true
        }
        return animate
    }
    private func posAni(start: CGPoint, end: CGPoint, time: Double) -> CABasicAnimation {
        let animate = CABasicAnimation(keyPath: "position")
        animate.fromValue = NSValue(cgPoint: start)
        animate.toValue = NSValue(cgPoint: end)
        animate.duration = time
        if repeating == true{
            animate.repeatCount = Float.infinity
            animate.autoreverses = true
        }
        animate.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        return animate
    }
    private func scale(to: CGFloat, duration: Double) -> CABasicAnimation{
        let scaler = CABasicAnimation(keyPath: "transform.scale")
        scaler.fromValue = 1
        scaler.toValue = to
        scaler.autoreverses = true
        return scaler
    }
    private func rotate(duration: Double) -> CABasicAnimation{
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = Double.pi * 2
        rotation.duration = duration
        rotation.repeatCount = Float.infinity
        return rotation
    }
    private func getColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}

