//
//  BlueButton.swift
//  MarketApp
//
//  Created by Алексей Авер on 27.06.2023.
//

import SwiftUI

struct BlueButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("blue"))
                Text(title)
                    .foregroundColor(Color.white)
                    .font(.system(size: 16))
            }
        } .padding()
    }
}

struct TDLButton_Previews: PreviewProvider {
    static var previews: some View {
        BlueButton(title: "title") {
           
        }
    }
}
