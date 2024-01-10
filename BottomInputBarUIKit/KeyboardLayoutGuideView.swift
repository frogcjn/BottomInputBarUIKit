//
//  KeyboardLayoutGuideView.swift
//  BottomInputBarUIKit
//
//  Created by Cao, Jiannan on 1/10/24.
//

import UIKit

class KeyboardLayoutGuideView : UIView {
    let guideView: UIView!
    init() {
        
        self.guideView = {
            let guideView = UIView()
            guideView.layer.borderColor = UIColor.red.cgColor
            guideView.layer.borderWidth = 1
            guideView.backgroundColor = .red
            guideView.translatesAutoresizingMaskIntoConstraints = false
            return guideView
        }()
        
        super.init(frame: .zero)
        
        // configure self
        backgroundColor = .yellow
        isUserInteractionEnabled = false
        
        // add subviews
        addSubview(guideView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        NSLayoutConstraint.deactivate(guideView.constraints)
        
        guard let rootView = window?.rootViewController?.view else { return }
        
        rootView.keyboardLayoutGuide.usesBottomSafeArea = false
        NSLayoutConstraint.activate([
            guideView.leadingAnchor.constraint(equalTo: rootView.keyboardLayoutGuide.leadingAnchor),
            guideView.trailingAnchor.constraint(equalTo: rootView.keyboardLayoutGuide.trailingAnchor),
            guideView.topAnchor.constraint(equalTo: rootView.keyboardLayoutGuide.topAnchor),
            guideView.bottomAnchor.constraint(equalTo: rootView.keyboardLayoutGuide.bottomAnchor)
        ])
    }
}
