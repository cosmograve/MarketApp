//
//  BucketView.swift
//  MarketApp
//
//  Created by Алексей Авер on 27.06.2023.
//

import SwiftUI

struct BucketView: View {
    @State var value: Int
    var body: some View {
        VStack{
            MainHeaderView()
                .padding(.top, 8)
                .padding(.horizontal, 16)
            ScrollView{
                BasketItem()
                BasketItem()
               
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 0)
            
            BlueButton(title: "qweq") {
                
            }
            .frame(height: 78)
            
        }
        
       
        
    }
}

struct BucketView_Previews: PreviewProvider {
    static var previews: some View {
        BucketView(value: 0)
    }
}
