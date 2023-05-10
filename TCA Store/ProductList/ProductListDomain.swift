//
//  ProductListDomain.swift
//  TCA Store
//
//  Created by Muhammad Rifki Widadi on 10/05/23.
//

import Foundation
import ComposableArchitecture

struct ProductListDomain: ReducerProtocol {
    struct State: Equatable {
        var productList: IdentifiedArrayOf<ProductDomain.State> = []

    }

    enum Action: Equatable {
        case fetchProducts
        case fetchProductResponse(TaskResult<[Product]>)
        case product(id: ProductDomain.State.ID, action: ProductDomain.Action)
    }


    let fetchProducts: () async throws -> [Product]



    var body: some ReducerProtocol<State, Action> {

        Reduce { state, action in
            switch action {
            case .fetchProducts:

                return .task {
                    await .fetchProductResponse(
                        TaskResult {
                            try await fetchProducts()
                        }
                    )
                }
            case .fetchProductResponse(.success(let products)):
                state.productList = IdentifiedArrayOf(
                    uniqueElements: products.map {
                        ProductDomain.State(id: UUID(), product: $0)
                    }
                )
                return.none
            case .fetchProductResponse(.failure(let error)):
                print(error)
                return .none
            case .product:
                return .none
            }
        }.forEach(\.productList, action: /Action.product(id:action:)) {
            ProductDomain()
        }
    }


}
