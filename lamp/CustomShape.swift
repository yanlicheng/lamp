//
//  CustomShape.swift
//  lamp
//
//  Created by richard on 1/7/23.
//

import SwiftUI

struct CustomShape: Shape {
    var bottom: CGFloat = .zero
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            let center = rect.width/2
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: center-150, y: 0))
            
//            path.addLine(to: CGPoint(x: rect.width, y: 0))
//            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
//            path.addLine(to: CGPoint(x: 0, y: rect.height))
//            path.addLine(to: CGPoint(x: 0, y: 0))
            
            
//            let center = rect.width/2
//            let bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 15
            
//            path.move(to: CGPoint(x: center-150, y: 0))
            
            let to1 = CGPoint(x: center, y: bottom+70)
            let control1 = CGPoint(x: center-70, y: bottom)
            let control2 = CGPoint(x: center-70, y: bottom+70)
            let to2 = CGPoint(x: center+150, y: 0)
            let control3 = CGPoint(x: center+70, y: bottom+70)
            let control4 = CGPoint(x: center+70, y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
            
            
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CustomShape_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CustomShape()
                .fill(Color.red)
//                .stroke(Color.red, lineWidth: 10)
        }
    }
}


