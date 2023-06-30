//
//  DishesHeaderView.swift
//  MarketApp
//
//  Created by Алексей Авер on 29.06.2023.
//

import SwiftUI

struct DishesHeaderView: View {
    @StateObject var viewModel = DishesHeaderViewViewModel()
    @Environment(\.presentationMode) var presentationMode
    private var text: String
    
    init(text: String) {
        self.text = text
    }
    var body: some View {
        HStack{
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image("back")
            }
            Spacer()
            Text(text)
            Spacer()
            Button {
                viewModel.avatarTapped()
            } label: {
                Image("avatar")
            }
            

        }
    }
}

struct DishesHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DishesHeaderView(text: "ymmy")
    }
}
