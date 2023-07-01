//
//  DetailsView.swift
//  MarketApp
//
//  Created by Алексей Авер on 29.06.2023.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    var body: some View {
        VStack(alignment: .center) {
            Circle().frame(width: 156, height: 156).foregroundColor(.gray).padding()
            Text("You are presenting modal view controller with SwiftUI.").lineLimit(nil).multilineTextAlignment(.center).padding()
            
            Button(action: {
                self.viewControllerHolder?.dismiss(animated: true, completion: nil)
            }) {
                Text("Dismiss")
            }.foregroundColor(.red).padding(.bottom)
            
        }.background(Color.white).clipShape(RoundedRectangle(cornerRadius: 3.0)).frame(width: UIScreen.main.bounds.size.width - 32)
            .shadow(radius: 3)
            .cornerRadius(15)
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
