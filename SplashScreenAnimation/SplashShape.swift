//
//  SplashShape.swift
//  SplashScreenAnimation
//
//  Created by 1 on 24/10/21.
//

import SwiftUI

struct SplashShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{ path  in
            let mid = rect.width / 2
            let height = rect.height
            
            // 80 = 40: Arc Radius...
            path.move(to: CGPoint(x: mid - 80, y: height))
            
            path.addArc(center: CGPoint(x: mid - 40, y: height),
                        radius: 40,
                        startAngle: .init(degrees: 180),
                        endAngle: .zero,
                        clockwise: true)
            
            path.addLine(to: CGPoint(x: mid, y: 0))
            
            path.addArc(center: CGPoint(x: mid + 40, y: 0),
                        radius: 40,
                        startAngle: .init(degrees: -180),
                        endAngle: .zero,
                        clockwise: false)
        }
    }
}


