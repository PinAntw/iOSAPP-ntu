//
//  DraggableDrinkCard.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/11.
//
import SwiftUI

struct DraggableDrinkCard: View {
    let drink: Drink
    let index: Int
    let total: Int
    
    @Binding var offset: CGSize
    var onRemove: (Drink, Bool) -> Void // Bool: true=右滑, false=左滑
    
    var body: some View {
        ZStack {
            DrinkCardView(drink: drink)
            
            // 浮水印：右滑 → LIKE
            if offset.width > 0 {
                Text("LIKE")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.green, lineWidth: 4)
                    )
                    .rotationEffect(.degrees(-20))
                    .opacity(Double(min(offset.width / 150, 1)))
                    .offset(x: -50, y: -100)
            }
            
            // 浮水印：左滑 → NOPE
            if offset.width < 0 {
                Text("NOPE")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.red, lineWidth: 4)
                    )
                    .rotationEffect(.degrees(20))
                    .opacity(Double(min(-offset.width / 150, 1)))
                    .offset(x: 50, y: -100)
            }
        }
        .offset(offset)
        .rotationEffect(.degrees(Double(offset.width / 20)))
        .stacked(at: index, in: total)
        .gesture(
            DragGesture()
                .onChanged { value in
                    offset = value.translation
                }
                .onEnded { value in
                    handleDrag(value: value)
                }
        )
        .animation(Animation.spring(), value: offset)
    }
    
    private func handleDrag(value: DragGesture.Value) {
        let threshold: CGFloat = 100
        if value.translation.width > threshold {
            // 右滑
            withAnimation {
                offset = CGSize(width: 500, height: 0)
            }
            onRemove(drink, true)
        } else if value.translation.width < -threshold {
            // 左滑
            withAnimation {
                offset = CGSize(width: -500, height: 0)
            }
            onRemove(drink, false)
        } else {
            // 回正
            withAnimation {
                offset = .zero
            }
        }
    }
}

// 疊放效果（卡片堆）
extension View {
    func stacked(at index: Int, in total: Int) -> some View {
        let offset = Double(total - index) * 5
        return self.offset(CGSize(width: 0, height: offset))
    }
}
