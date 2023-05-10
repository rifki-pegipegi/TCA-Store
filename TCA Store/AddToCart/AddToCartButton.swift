//
//  AddToCartButton.swift
//  TCA Store
//
//  Created by Muhammad Rifki Widadi on 09/05/23.
//

import SwiftUI
import ComposableArchitecture

struct AddToCartButton: View {
    let store: StoreOf<AddToCartDomain>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            if viewStore.count > 0 {
                PlusMinusButton(store: self.store)
            } else {
                Button {
                    viewStore.send(.didTapAddButton)
                } label: {
                    Text("Add To Cart")
                }
                .buttonStyle(.bordered)
                .foregroundColor(.black)
                .padding()

            }
        }
    }
}

struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButton(
            store: Store(
                initialState: AddToCartDomain.State(),
                reducer: AddToCartDomain()
            )
        )
    }
}
