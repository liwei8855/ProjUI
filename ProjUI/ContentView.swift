//
//  ContentView.swift
//  ProjUI
//
//  Created by 李威 on 2021/3/16.
//

import SwiftUI
class test {
    var test1: some View {
        //        Text("Hello, swiftUI!")
        //            .padding()
                Text("+")
        //            .font(.title) //设置字体
        //            .font(.system(size: 48)) //设置字体
                    .font(.custom("Copperplate", size: 48))
                    .foregroundColor(.white)
                    .padding(.top,16)
                    .padding(.bottom,10)
        //            .padding(.leading,8)
        //            .padding(.trailing,8)
                    .background(Color.orange)
                    .padding(.horizontal,8)//与上边两边设置一样
                    .background(Color.blue)
                //在orange后设置padding，orange颜色不作用于padding上
                //后边的blue作用于padding上
    }
}

typealias CalculatorState = CalculatorBrain
typealias CalculatorStateAction = CalculatorButtonItem

struct Reducer {
    static func reduce(
        state: CalculatorState,
        action: CalculatorStateAction
    ) -> CalculatorState {
        return state.apply(item: action)
    }
}

let scale: CGFloat = UIScreen.main.bounds.width / 414
struct ContentView: View {//实际的UI
    var body: some View {
        VStack(alignment: .trailing, spacing: 12, content: {
//            Spacer()//将界面推至屏幕底部
            Text("0")
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)//将显示结果的text右对齐
            CalculatorButtonPad().scaleEffect(scale)
//            CalculatorButtonPad().padding(.bottom)
        })
    }
}

struct ContentView_Previews: PreviewProvider {//dummy界面 xcode预览
    static var previews: some View {
        //显示多个模拟器
//        ContentView().previewDevice("iPhone SE")
        ContentView()
            .previewDevice("iPhone 8")
            .previewDevice("iPad Air")
//            .environment(\.colorScheme, .dark)
    }
}

struct CalculatorButtonPad: View {
    let pad:[[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    var body: some View {
        VStack(alignment: .center, spacing: 8, content: {
            ForEach(pad, id:\.self) { row in
                CalculatorButtonRow(row: row)
            }
        })
    }
}

struct CalculatorButtonRow: View {
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack{
            ForEach(row, id: \.self) { item in
                CalculatorButton (title: item.title, size: item.size, backgroundColorName: item.backgroundColorName) {
                    print("button: \(item.title)")
                }
            }
        }
    }
}

struct CalculatorButton: View {
    let fontSize: CGFloat = 38
    let title:String
    let size:CGSize
    let backgroundColorName:String
    let action: ()->Void
    
    /*
     1.cornerRadius和background换顺序圆角会消失变成方块
       分析：
     */
    //background和cornerRadius画圆圈
//    var body: some View {
//        Button(action: action, label: {
//            Text(title)
//                .font(.system(size: fontSize)) //设置字体
//                .foregroundColor(.white)
//                .frame(width:size.width,height: size.height)
//                .background(Color(backgroundColorName))
//                .cornerRadius(44)
//        })
//    }
    //
    var body: some View {
        Button(action: action, label: {
            ZStack(content: {
                Circle().frame(width: size.width, height: size.height, alignment: .center)
                    .foregroundColor(Color(backgroundColorName))
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: fontSize))
            })
        })
    }
}
