//
//  DiceeViewController.swift
//  ProjUI
//
//  Created by 李威 on 2021/11/9.
//

import UIKit
import SnapKit

class DiceeViewController: UIViewController {

    let diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    var bgImageView:UIImageView!
    var shakeButton:UIButton!
    var resultImage1:UIImageView!
    var resultImage2:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup();
        
    }
    
    func setup (){
        bgImageView = UIImageView(image: UIImage(named: "newbackground"))
        view.addSubview(bgImageView)
        
        shakeButton = UIButton(type: .custom)
        shakeButton.setTitle("摇一摇", for: .normal)
        shakeButton.addTarget(self, action: #selector(shake), for: .touchUpInside)
        view.addSubview(shakeButton)
        
        resultImage1 = UIImageView()
        resultImage1.backgroundColor = .red
        view.addSubview(resultImage1)
        
        resultImage2 = UIImageView()
        resultImage2.backgroundColor = .red
        view.addSubview(resultImage2)
        
        bgImageView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        shakeButton.snp_makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 200, height: 50))
            make.bottom.equalTo(view).offset(-100)
        }
        resultImage1.snp_makeConstraints { (make) in
            make.centerY.equalTo(view)
            make.centerX.equalTo(view).offset(-100)
            make.size.equalTo(100)
        }
        resultImage2.snp_makeConstraints { (make) in
            make.centerY.equalTo(view)
            make.centerX.equalTo(view).offset(100)
            make.size.equalTo(100)
        }
    }

    @objc func shake() {
        updateResult()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateResult()
    }
    
    func updateResult() {
        let index1 = Int.random(in: 0...5)
        let index2 = Int.random(in: 0...5)
        resultImage1.image = UIImage(named: diceArray[index1])
        resultImage2.image = UIImage(named: diceArray[index2])
    }

}
