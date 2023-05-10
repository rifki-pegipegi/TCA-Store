//
//  AddToCartView.swift
//  TCA Store
//
//  Created by Muhammad Rifki Widadi on 08/04/23.
//

import SwiftUI
import ComposableArchitecture

struct PlusMinusButton: View {
    let store: StoreOf<AddToCartDomain>

    let size:CGFloat = 25

    var body: some View {
        WithViewStore(self.store) { viewStore in
            HStack {

                Button {
                    viewStore.send(.didTapMinButton)
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: size, height: size)
                }

                Text(viewStore.count.description)
                    .monospacedDigit()
                    .padding()

                Button {
                    viewStore.send(.didTapAddButton)
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: size, height: size)
                }
            }.padding()
        }

    }
}

struct PlusMinusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusMinusButton(
            store: Store(
                initialState: AddToCartDomain.State(),
                reducer: AddToCartDomain()
            )
        )
    }
}
