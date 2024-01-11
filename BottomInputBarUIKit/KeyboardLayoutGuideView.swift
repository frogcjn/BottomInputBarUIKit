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


class SafeAreaGuideView : UIView {
    let guideView: UIView!
    init() {
        
        self.guideView = {
            let guideView = UIView()
            guideView.layer.borderColor = UIColor.red.cgColor
            guideView.layer.borderWidth = 1
            guideView.backgroundColor = .red.withAlphaComponent(0.5)
            guideView.translatesAutoresizingMaskIntoConstraints = false
            guideView.isUserInteractionEnabled = false
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
        guard let superview = superview?.superview else { return }

        /*
        guard let rootView1 = superview?.superview else { return }
        guard let rootView2 = superview?.superview?.superview else { return }

        //print(1, superview) // BottomBar.HosingController, and its view
        //print(2, superview?.superview) // view Problem!
        //print(3, superview?.superview?.superview) // SwiftUI.NavigationStackHostingController, and its view

        //superview?.superview?.backgroundColor = .black
        //rootView.keyboardLayoutGuide.usesBottomSafeArea = false
        superview?.clipsToBounds = false
        rootView1.clipsToBounds = false
        rootView2.clipsToBounds = false*/
        //rootView1.translatesAutoresizingMaskIntoConstraints = false
        //rootView2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            guideView.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor),
            guideView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            guideView.topAnchor.constraint(equalTo: superview.topAnchor),
            guideView.bottomAnchor.constraint(equalTo: superview.keyboardLayoutGuide.bottomAnchor)
        ])
        
    }

}
