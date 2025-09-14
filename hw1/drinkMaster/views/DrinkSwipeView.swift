//
//  DrinkSwipeView.swift
//  drinkMaster
//
//  Created by 李品安 on 2025/9/11.
//
import SwiftUI

struct DrinkSwipeView: View {
    @StateObject private var vm = DrinkSwipeViewModel()
    @State private var offsets: [UUID: CGSize] = [:]
    
    var body: some View {
        ZStack {
            ForEach(vm.drinks) { drink in
                let index = vm.drinks.firstIndex(where: { $0.id == drink.id }) ?? 0
                DraggableDrinkCard(
                    drink: drink,
                    index: index,
                    total: vm.drinks.count,
                    offset: Binding(
                        get: { offsets[drink.id] ?? .zero },
                        set: { offsets[drink.id] = $0 }
                    ),
                    onRemove: { removedDrink, _ in
                        vm.removeDrink(removedDrink)
                    }
                )
            }
        }
        .padding()
    }
}
//#Preview {
//    DrinkSwipeView()
//}
