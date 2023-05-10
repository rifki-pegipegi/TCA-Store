//
//  CardView.swift
//  TCA Store
//
//  Created by Muhammad Rifki Widadi on 08/04/23.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("bag")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .infinity, height: 250, alignment: .center)
                Spacer()
            }
            Text("Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops")
                .font(.system(.title, design: .monospaced, weight: .black))
                .lineLimit(1)
            Text("Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday")
                .lineLimit(2)
                .padding(.top, 8)
            Text(109.95.formatted(.currency(code: "USD")))
                .padding(.top, 8)
            HStack {
                Spacer()
//                AddToCartView()
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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
