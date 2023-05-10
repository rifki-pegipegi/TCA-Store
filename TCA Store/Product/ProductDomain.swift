//
//  ProductDomain.swift
//  TCA Store
//
//  Created by Muhammad Rifki Widadi on 09/05/23.
//

import Foundation
import ComposableArchitecture

struct ProductDomain: ReducerProtocol {
    struct State: Equatable, Identifiable {
        let id: UUID
        let product: Product
        var addToCartdState = AddToCartDomain.State()
    }

    enum Action: Equatable {
        case addToCart(AddToCartDomain.Action)
    }

    struct Environment {}


    var body: some ReducerProtocol<State, Action> {
        Scope(state: \.addToCartdState, action: /Action.addToCart) {
            AddToCartDomain()
        }

        Reduce { state, action in
            switch action {
            case .addToCart(.didTapAddButton):
                return .none
            case .addToCart(.didTapMinButton):
                state.addToCartdState.count = max(0, state.addToCartdState.count)
                return .none
            }
        }

    }

}
