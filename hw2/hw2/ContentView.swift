//
//  ContentView.swift
//  hw2
//
//  Created by 李品安 on 2025/9/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(UIColor(red: 204/255, green: 192/255, blue: 166/255, alpha: 1.0))
            .ignoresSafeArea()
            .border(Color.black, width: 8)
            VStack{
                Text("WANTED")
                    .font(.system(size: 100))
                    .bold()
                    .scaleEffect(y: 1.4, anchor: .center)
                    .monospaced()
            }
            .offset(y:-280)

            VStack{
                ZStack {
                    Rectangle()
                        .stroke(Color.black, lineWidth: 3)
                        .frame(width: 360, height: 350)
                        .background(
                                    Image("background")
                                        .resizable()
                                        .scaledToFill() // 確保填滿
                                )
                                .clipped() // 超出部分裁掉
                        .overlay(
                            LuffyFace()
                                .scaleEffect(0.7)
                        )
                }

            }
            .offset(x: 0, y: 0)

            VStack(spacing: 5) {
                Text("DEAD OR ALIVE")
                    .font(.system(size: 45))
                    .scaleEffect(y: 0.6, anchor: .center)
                    .bold()
                    .monospaced()

                Text("MONKEY D LUFFY")
                    .font(.system(size: 40))
                    .bold()
                    .scaleEffect(y: 2, anchor: .center)
                    .monospaced()

                Text("B300,000,000-")
                    .font(.system(size: 40))
                    .bold()
                    .monospaced()
                Text("MARINE")
                    .font(.system(size: 40))
                    .bold()
                    .offset(x: 100)
            }
            .offset(y: 250)
            .padding(.top, 50)


                
        }
    }
}

#Preview {
    ContentView()
}
