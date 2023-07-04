//
//  CustomStepper.swift
//  MarketApp
//
//  Created by Алексей Авер on 02.07.2023.
//

import SwiftUI

class CustomStepperViewModel: ObservableObject {

}

struct CustomStepper: View {
    @EnvironmentObject var dataService: CartDataService
    @StateObject var viewModel = CustomStepperViewModel()
    var count: Int
    var id: Int
    init(count: Int, id: Int) {
        self.count = count
        self.id = id
    }
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Button {
                dataService.decrease()
//                viewModel.changeCounter(action: .minus, id: id)
            } label: {
                Image("minus")
            }
            Text("\(count)")
            Button {
                dataService.increase()
//                viewModel.changeCounter(action: .plus, id: id)
            } label: {
                Image("plus")
            }

        }
        .padding(.horizontal, 6)
        .padding(.vertical, 4)
        .background(Color(red: 0.94, green: 0.93, blue: 0.93))
        .cornerRadius(10)
    }
}

struct CustomStepper_Previews: PreviewProvider {
    static var previews: some View {
        CustomStepper(count: 0, id: 1)
    }
}
