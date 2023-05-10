//
//  TCA_StoreApp.swift
//  TCA Store
//
//  Created by Muhammad Rifki Widadi on 07/04/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_StoreApp: App {
    var body: some Scene {
        WindowGroup {
            ProductListView(
                store: Store(
                    initialState: ProductListDomain.State(),
                    reducer: ProductListDomain(
                        fetchProducts: {
                            Product.sample
                        }
                    )._printChanges()
                )
            )
        }
    }
}
