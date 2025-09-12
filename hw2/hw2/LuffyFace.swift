//
//  LuffyFace.swift
//  hw2
//
//  Created by 李品安 on 2025/9/12.
//

import SwiftUI

struct LuffyFace: View {
    var body: some View {
        ZStack {

            // 帽子
            Ellipse()
                .fill(Color(red: 100/255, green: 64/255, blue: 34/255))
                .frame(width: 180, height: 50)
                .offset(x:25, y: -240)
                .rotationEffect(.degrees(-10))
            Ellipse()
                .fill(Color(red: 218/255, green: 183/255, blue: 120/255))
                .frame(width: 400, height: 200)
                .offset(x:30, y: -150)
                .rotationEffect(.degrees(-10))
            
            // 左耳
            Ellipse()
                .trim(from: 0.2, to: 1)
                .fill(Color(red: 225/255, green: 177/255, blue: 121/255))
                .frame(width: 90, height: 50)
                .offset(x:20, y: -100)
                .rotationEffect(.degrees(230))
            // 右耳
            Ellipse()
                .fill(Color(red: 225/255, green: 177/255, blue: 121/255))
                .frame(width: 90, height: 50)
                .offset(x:-60, y: -140)
                .rotationEffect(.degrees(120))
            // 臉
            Ellipse()
                .fill(Color(red: 225/255, green: 177/255, blue: 121/255))
                .frame(width: 320, height: 280)
                .offset(x:50, y: 20)
                .rotationEffect(.degrees(-90))
            // 頭髮圖
            Image("hair")
                .resizable()
                .frame(width: 380, height: 200)
                .offset(x:10, y: -100)
                .rotationEffect(.degrees(-10))
            
            // 左眉毛
            Arc(startAngle: .degrees(0), endAngle: .degrees(270), clockwise: true)
                .stroke(Color.black, lineWidth: 1)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(-60))
                .offset(x:-40, y: -60)
            // 右眉毛
            Arc(startAngle: .degrees(0), endAngle: .degrees(270), clockwise: true)
                .stroke(Color.black, lineWidth: 1)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(-60))
                .offset(x:90, y: -80)
            // 左眼
            Arc(startAngle: .degrees(0), endAngle: .degrees(240), clockwise: true)
                .stroke(Color.black, lineWidth: 6)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(-50))
                .offset(x:-30, y: -10)
            // 右眼
            Arc(startAngle: .degrees(0), endAngle: .degrees(240), clockwise: true)
                .stroke(Color.black, lineWidth: 6)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(-40))
                .offset(x:90, y: -38)

            // 身體
            RoundedRectangle(cornerRadius:30)
                .fill(Color(red: 91/255, green: 38/255, blue: 26/255))
                .frame(width: 390, height: 90)
                .rotationEffect(.degrees(-10))
                .offset(x:60, y: 180)
            // 脖子
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(red: 225/255, green: 177/255, blue: 121/255))
                .frame(width: 70, height: 90)
                .rotationEffect(.degrees(-10))
                .offset(x:-120, y: 50)
                .rotationEffect(.degrees(-90))
            Ellipse()
                .fill(Color(red: 225/255, green: 177/255, blue: 121/255))
                .frame(width: 120, height: 50)
                .offset(x:25, y: 160)
                .rotationEffect(.degrees(-10))

            // 嘴巴
            Ellipse()
                .trim(from: 0.49, to: 1)
                .fill(Color.white)
                .frame(width: 230, height: 200)
                .offset(x:-29, y: -0)
                .rotationEffect(.degrees(170))
            Path { path in
                path.move(to: CGPoint(x: 150, y: 210))   // 起點
                path.addLine(to: CGPoint(x: 340, y: 170)) // 終點
            }
            .stroke(Color.gray, lineWidth: 3)
            
            // 鼻子
            Triangle()
                .fill(Color.black)
                .frame(width: 4, height: 20)
                .offset(x:30, y: -25)
                .rotationEffect(.degrees(-10))


            // 手
            RoundedRectangle(cornerRadius:30)
                .fill(Color(red: 225/255, green: 177/255, blue: 121/255))
                .frame(width: 40, height: 240)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 2)
                )
                .rotationEffect(.degrees(-10))
                .offset(x:200, y: 90)
            Triangle()
                .fill(Color(red: 225/255, green: 177/255, blue: 121/255))
                .frame(width: 250, height: 140)
                .offset(x:-80, y: -280)
                .rotationEffect(.degrees(150))
            RoundedRectangle(cornerRadius:30)
                .fill(Color(red: 225/255, green: 177/255, blue: 121/255))
                .frame(width: 60, height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 2)
                )
                .rotationEffect(.degrees(-70))
                .offset(x:130, y: 200)


        }
        .frame(width: 300, height: 300)
    }
}
struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.width / 2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise
        )
        return path
    }
}
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}



#Preview {
    LuffyFace()
}
