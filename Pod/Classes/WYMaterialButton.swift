//
//  WYMaterialButton.swift
//  WYMaterialButton
//
//  Created by Wang Yu on 9/24/15.
//
//

import UIKit
import QuartzCore

@IBDesignable
public class WYMaterialButton: UIButton {

    @IBInspectable
    public var materialEffectPercent: CGFloat = 0.8 {
        didSet {
            self.configureMaterialView()
        }
    }
    
    @IBInspectable
    public var materialColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.materialView.backgroundColor = self.materialColor
        }
    }
    
    @IBInspectable
    public var materialBackgroundColor = UIColor.whiteColor() {
        didSet {
            self.materialBackgroundView.backgroundColor = self.materialBackgroundColor
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    @IBInspectable
    var effectOverBounds: Bool = false
    @IBInspectable
    var shadowMaterialRadius: Float = 1
    @IBInspectable
    var touchLocationEnable: Bool = false
    @IBInspectable
    var shadowMaterialEnable: Bool = false
    
    let materialView = UIView()
    let materialBackgroundView = UIView()
    
    private var materialShapeLayer: CAShapeLayer? {
        get {
            if effectOverBounds == false {
                let shapeLayer = CAShapeLayer()
                shapeLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).CGPath
                return shapeLayer
            } else { return nil }
        }
    }
    
    private func configure() {
        configureMaterialView()
        configureMaterialBackgroundView()
        
        self.layer.shadowRadius = 0
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5).CGColor
    }
    
    private func configureMaterialView() {
        let materialEffectBounds: CGFloat = self.bounds.width * materialEffectPercent
        self.materialView.frame = CGRectMake(CGRectGetMidX(self.bounds) - materialEffectBounds/2, CGRectGetMaxY(self.bounds) - materialEffectBounds/2, materialEffectBounds, materialEffectBounds)
        self.materialView.backgroundColor = self.materialColor
        self.materialView.layer.cornerRadius = materialEffectBounds/2
    }
    
    private func configureMaterialBackgroundView() {
        self.materialBackgroundView.backgroundColor = self.materialBackgroundColor
        self.materialBackgroundView.frame = self.bounds
        self.layer.addSublayer(materialBackgroundView.layer)
        self.materialBackgroundView.layer.addSublayer(self.materialView.layer)
        self.materialBackgroundView.alpha = 0
    }
    
    public override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        if self.touchLocationEnable == true {
            self.materialView.center = touch.locationInView(self)
        }
        
        UIView.animateWithDuration(0.2) { () -> Void in
            self.materialBackgroundView.alpha = 1
        }
        self.materialView.transform = CGAffineTransformMakeScale(0.5, 0.5)
        
        UIView.animateWithDuration(0.8, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.materialView.transform = CGAffineTransformIdentity
            }, completion: nil)
        
        if self.shadowMaterialEnable == true {
            
        }
        
        return super.beginTrackingWithTouch(touch, withEvent: event)
    }
    
    public override func cancelTrackingWithEvent(event: UIEvent?) {
        super.cancelTrackingWithEvent(event)
    }
    
    public override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        super.cancelTrackingWithEvent(event)
    }
    
}
