//
//  Dots.swift
//  lamp
//
//  Created by richard on 30/6/23.
//

import SwiftUI

struct Dots: View {
    //circle width
    var width = UIScreen.main.bounds.width / 2
    
    var body: some View {
        
        ForEach(0...10, id:\.self){ index in
            Circle()
                .fill(Color("yellow"))
                .frame(width: 10)
                .offset(x: -(width+32)/2)
                .rotationEffect(Angle(degrees: Double(index)*24))
        }
        .rotationEffect(Angle(degrees: -30))

    }
}

struct Dots_Previews: PreviewProvider {
    static var previews: some View {
        Dots()
    }
}
