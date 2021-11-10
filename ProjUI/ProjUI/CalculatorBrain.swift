//
//  CalculatorBrain.swift
//  ProjUI
//
//  Created by 李威 on 2021/4/2.
//

import Foundation
import SwiftUI

enum CalculatorBrain {
    
    case left(String)
    case leftOp(
        left: String,
        op: CalculatorButtonItem.Op
    )
    case leftOpRight(
        left: String,
        op: CalculatorButtonItem.Op,
        right: String
    )
    case error
    
}

extension CalculatorBrain: Hashable {
    var formatter: NumberFormatter {
        let f = NumberFormatter()
        f.minimumFractionDigits = 0
        f.maximumFractionDigits = 8
        f.numberStyle = .decimal
        return f
    }

//    var output: String {
//        let result: String
//        switch self {
//            case .left(let left): result = left
//        case .leftOp(left: let left, op: let op):
//            <#code#>
//        case .leftOpRight(left: let left, op: let op, right: let right):
//            <#code#>
//        case .error:
//            <#code#>
//        }
//        guard let value = Double(result) else { return "Error" }
//        return formatter.string(from: value as NSNumber)!
//    }
    
    func apply(item: CalculatorButtonItem) -> CalculatorBrain {
        switch item {
            case .digit(let num):
                return apply(item: CalculatorButtonItem.digit(num))
            case .dot:
                return apply(item: CalculatorButtonItem.dot)
            case .op(let op):
                return apply(item: CalculatorButtonItem.op(op))
            case .command(let command):
                return apply(item: CalculatorButtonItem.command(command))
        }
    }
    
}
