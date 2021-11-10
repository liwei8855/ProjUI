//
//  NibLoadable.swift
//  ProjUI
//
//  Created by 李威 on 2021/11/10.
//

import UIKit

protocol NibLoadable {

}
//Self (大写) 当前类对象
extension NibLoadable where Self: UIView {
    //在协议里面不允许定义class 只能定义static
    static func loadFromNib(_ nibName: String? = nil) -> Self {
        //self(小写) 当前对象
        let loadName = nibName == nil ? "\(self)" : nibName!
        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
}
