//
//  XylophoneController.swift
//  ProjUI
//
//  Created by 李威 on 2021/11/10.
//

import UIKit

class XylophoneController: UIViewController, NibLoadable {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let playView = XylophoneView.loadFromNib()
        view.addSubview(playView)
        
    }

}
