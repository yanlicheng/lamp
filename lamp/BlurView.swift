//
//  BlurView.swift
//  lamp
//
//  Created by richard on 30/6/23.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.systemChromeMaterial))
        
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
         
    }
}

