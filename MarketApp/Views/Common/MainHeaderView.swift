//
//  MainHeaderView.swift
//  MarketApp
//
//  Created by Алексей Авер on 27.06.2023.
//

import SwiftUI

struct MainHeaderView: View {
    @StateObject var locationManager = LocationManager()
    @StateObject var viewModel = MainHeaderViewViewModel()
    var body: some View {
        HStack{
            Image("geo")
                .padding(.bottom)
                .padding(.top, 5)
            VStack(alignment: .leading) {
                if let location = locationManager.userLocation {
                    Text("\(location.coordinate.latitude)")
                        .font(.system(size: 18, weight: .medium, design: .default))
                }
               
                Text(viewModel.date)
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(Color.gray )
            }
            
            Spacer()
            Button {
                viewModel.avatarTapped()
            } label: {
                Image("avatar")
            }
            

        }
    }
}

struct MainHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MainHeaderView()
    }
}
