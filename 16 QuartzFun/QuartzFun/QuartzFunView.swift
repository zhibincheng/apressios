//
//  QuartzFunView.swift
//  QuartzFun
//
//  Created by 张晶 on 2019/1/7.
//  Copyright © 2019 Apress. All rights reserved.
//

import UIKit

//扩展UIColor，获得randomColor
extension UIColor {
    class func randomColor() -> UIColor {
        let red = CGFloat(Double(arc4random_uniform(255))/255)
        let green = CGFloat(Double(arc4random_uniform(255))/255)
        let blue = CGFloat(Double(arc4random_uniform(255))/255)
        return UIColor(red: red, green: green, blue: blue, alpha:1.0)
    }
}

//可以绘制的形状
enum Shape : UInt {
    case line = 0, rect, ellipse, image
}

// 颜色枚举
enum DrawingColor : UInt {
    case red = 0, blue, yellow, green, random
}

class QuartzFunView: UIView {
    // 可以在App里设置的属性
    var shape = Shape.line
    var currentColor = UIColor.red
    var useRandomColor = false
    
    // 内部私有属性
    private let image = UIImage(named:"iphone")
    private var firstTouchLocation = CGPoint.zero
    private var lastTouchLocation = CGPoint.zero
    private var redrawRect = CGRect.zero
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            print(1)
            if useRandomColor {
                currentColor = UIColor.randomColor()
            }
            firstTouchLocation = touch.location(in: self)
            lastTouchLocation = firstTouchLocation
            redrawRect = CGRect.zero

        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            print(2)
            lastTouchLocation = touch.location(in: self)
            //这部分是性能优化
            if shape == .image {
                let horizontalOffset = image!.size.width / 2
                let verticalOffset = image!.size.height / 2
                redrawRect = redrawRect.union(CGRect(x: lastTouchLocation.x - horizontalOffset,
                                                     y: lastTouchLocation.y - verticalOffset,
                                                     width: image!.size.width, height: image!.size.height))
            }else {
                redrawRect = redrawRect.union(currentRect())
            }
            setNeedsDisplay(redrawRect)

        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            print(3)
            lastTouchLocation = touch.location(in: self)
            
            //这部分是性能优化
            if shape == .image {
                let horizontalOffset = image!.size.width / 2
                let verticalOffset = image!.size.height / 2
                redrawRect = redrawRect.union(CGRect(x: lastTouchLocation.x - horizontalOffset,
                                                     y: lastTouchLocation.y - verticalOffset,
                                                     width: image!.size.width, height: image!.size.height))
            } else {
                redrawRect = redrawRect.union(currentRect())
            }
            setNeedsDisplay(redrawRect)

        }
    }
    
    
    
    override func draw(_ rect: CGRect) {
        print(4)
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(currentColor.cgColor)
        context?.setFillColor(currentColor.cgColor)
        
        switch shape {
        case .line:
            context?.move(to: CGPoint(x: firstTouchLocation.x, y: firstTouchLocation.y))
            context?.addLine(to: CGPoint(x: lastTouchLocation.x, y: lastTouchLocation.y))
            context?.strokePath()
            
        case .rect:
            context?.addRect(currentRect())
            context?.drawPath(using: .fillStroke)
            
        case .ellipse:
            context?.addEllipse(in: currentRect())
            context?.drawPath(using: .fillStroke)
            
        case .image:
            let horizontalOffset = image!.size.width / 2
            let verticalOffset = image!.size.height / 2
            let drawPoint =
                CGPoint(x: lastTouchLocation.x - horizontalOffset,
                        y: lastTouchLocation.y - verticalOffset)
            image!.draw(at: drawPoint)
        }
    }
    
    
    func currentRect() -> CGRect {
        return CGRect(x: firstTouchLocation.x,
                      y: firstTouchLocation.y,
                      width: lastTouchLocation.x - firstTouchLocation.x,
                      height: lastTouchLocation.y - firstTouchLocation.y)
    }
    
}
