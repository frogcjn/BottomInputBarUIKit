//
//  ViewController.swift
//  BottomInputBarUIKit
//
//  Created by Cao, Jiannan on 1/8/24.
//

import UIKit



class TableNC: UINavigationController {

    @IBOutlet
    weak var backdrop: UIVisualEffectView!
    
    @IBOutlet
    weak var textField: UITextField!
    
    let guideView =  KeyboardLayoutGuideView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure subviews
        textField.translatesAutoresizingMaskIntoConstraints = false
        backdrop.translatesAutoresizingMaskIntoConstraints = false

        // add subviews
        view.addSubview(backdrop)
        view.addSubview(textField)
        view.addSubview(guideView)
        
        view.keyboardLayoutGuide.usesBottomSafeArea = false

        let constraints = [
            textField.topAnchor.constraint(equalToSystemSpacingBelow: backdrop.topAnchor, multiplier: 1.0),
            backdrop.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1.0),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: backdrop.leadingAnchor, multiplier: 1.0),
            backdrop.trailingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1.0),
        
            backdrop.leadingAnchor.constraint(equalTo: view.keyboardLayoutGuide.leadingAnchor),
            backdrop.trailingAnchor.constraint(equalTo: view.keyboardLayoutGuide.trailingAnchor),
            backdrop.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),

            textField.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor),
            textField.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor),
            textField.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateHeight()
    }
    
    func updateHeight() {
        let height = backdrop.frame.height
        
        print(height)
        
        // keyboardDismissPadding
        view.keyboardLayoutGuide.keyboardDismissPadding = height
        
        // additionalSafeAreaInsets
        topViewController?.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
    }
    
}
