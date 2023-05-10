//
//  AddToCartDomain.swift
//  TCA Store
//
//  Created by Muhammad Rifki Widadi on 09/05/23.
//

import Foundation
import ComposableArchitecture

struct AddToCartDomain: ReducerProtocol {
    struct State: Equatable {
        var count = 0
    }

    enum Action: Equatable {
        case didTapAddButton
        case didTapMinButton
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch(action) {
        case .didTapAddButton:
            state.count += 1
            return .none
        case .didTapMinButton:
             state.count -= 1
            return .none
        }
    }
}
