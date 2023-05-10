//
//  ProductListView.swift
//  TCA Store
//
//  Created by Muhammad Rifki Widadi on 10/05/23.
//

import SwiftUI
import ComposableArchitecture

struct ProductListView: View {
    let store: StoreOf<ProductListDomain>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            List {
                ForEachStore(
                    self.store.scope(
                        state: \.productList,
                        action: ProductListDomain.Action.product(id:  action: )
                    )
                ) { store in
                    ProductCell(store: store)
                }
            }
            .listStyle(.plain)
            .task {
                viewStore.send(.fetchProducts)
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(
            store: Store(
                initialState: ProductListDomain.State(),
                reducer: ProductListDomain(
                    fetchProducts: {Product.sample}
                )._printChanges()
            )
        )
    }
}
