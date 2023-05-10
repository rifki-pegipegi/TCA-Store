//
//  ProductCell.swift
//  TCA Store
//
//  Created by Muhammad Rifki Widadi on 09/05/23.
//

import SwiftUI
import ComposableArchitecture

struct ProductCell: View {
    let store: StoreOf<ProductDomain>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image(viewStore.product.imageString)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250, alignment: .center)
                    Spacer()
                }
                Text(viewStore.product.title)
                    .font(.system(.title, design: .monospaced, weight: .black))
                    .lineLimit(1)
                Text(viewStore.product.description)
                    .lineLimit(2)
                    .padding(.top, 8)
                Text(viewStore.product.price.formatted(.currency(code: "USD")))
                    .padding(.top, 8)
                HStack {
                    Spacer()

                    AddToCartButton(
                        store: store.scope(
                            state: \.addToCartdState,
                            action: ProductDomain.Action.addToCart
                        )
                    )

                }


            }
            .padding()
            .background(
                RoundedRectangle(
                    cornerRadius: 12,
                    style: .continuous
                )
                .fill(.white)
                .shadow(color: .black.opacity(0.2), radius: 10)
            )
            .padding()
        }

    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(
            store: Store(
                initialState: ProductDomain.State(
                    id: UUID(),
                    product: Product.sample[0]
                ),
                reducer: ProductDomain()._printChanges()
            )
        )
    }
}
