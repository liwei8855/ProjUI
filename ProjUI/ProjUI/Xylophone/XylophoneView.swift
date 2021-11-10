//
//  XylophoneView.swift
//  ProjUI
//
//  Created by 李威 on 2021/11/10.
//

import UIKit
import AVFoundation

class XylophoneView: UIView, NibLoadable{

    var player:AVAudioPlayer!//创建一个播放器（类似于CD机）
    let sounds = ["note1","note2","note3","note4","note5","note6","note7"]//全局变量
    
    @IBAction func tapButton(_ sender: UIButton) {
        play(index: sender.tag)
    }
    
    func play(index: Int) {
        print(sounds[index])
        let url = Bundle.main.url(forResource: sounds[index], withExtension: "wav")
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player.play()
        } catch {
            print(error)
        }
    }

}
