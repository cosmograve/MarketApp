//
//  CustomStepper.swift
//  MarketApp
//
//  Created by Алексей Авер on 02.07.2023.
//

import SwiftUI
enum StepperAction{
    case minus, plus
}
class CustomStepperViewModel: ObservableObject {
    @Published var counter: Int = 0
    init() {
        
    }
    func changeCounter(action: StepperAction) {
        switch action {
        case .minus:
            if counter == 0 {
                return
            }
            counter -= 1
        case .plus:
            counter += 1
        }
        
    }
}

struct CustomStepper: View {
    @StateObject var viewModel = CustomStepperViewModel()
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Button {
                viewModel.changeCounter(action: .minus)
            } label: {
                Image("minus")
            }
            Text("\(viewModel.counter)")
            Button {
                viewModel.changeCounter(action: .plus)
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
        CustomStepper()
    }
}
