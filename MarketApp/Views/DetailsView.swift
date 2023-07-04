//
//  DetailsView.swift
//  MarketApp
//
//  Created by Алексей Авер on 29.06.2023.
//

import SwiftUI
class DetailsViewViewModel: ObservableObject {
    
}

struct DetailsView: View {
    @EnvironmentObject private var dataService: CartDataService
    @StateObject private var viewModel = DetailsViewViewModel()
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var item: DishesItem
    
    init(item: DishesItem) {
        self.item = item
    }
    
    fileprivate func FavoriteButton() -> some View {
        return Button(action: {
            print("fav tapped")
        }) {
            Image("favorite")
                .frame(width: 40, height: 40)
                .background(Color.white)
        }
        .cornerRadius(5)
        .opacity(0.9)
        
    }
    
    fileprivate func CloseButton() -> some View {
        return Button(action: {
            self.viewControllerHolder?.dismiss(animated: true, completion: nil)

        }) {
            Image("cross")
                .frame(width: 40, height: 40)
                .background(Color.white)
        }
        .cornerRadius(5)
        .opacity(0.9)
    }
    
    var body: some View {
        
        ZStack {
                
            VStack(alignment: .leading) {
                
                DishesImageView(dishesItem: item, showingText: false)
                    .frame(height: 232)
                    .padding(.horizontal)
                    .padding(.top)
                    .overlay(
                        FavoriteButton()
                            .padding(.top, 24)
                            .padding(.trailing, 72)
                        , alignment: .topTrailing
                        
                        
                    )
                
                    .overlay(
                        CloseButton()
                            .padding([.top, .trailing], 24)
                        , alignment: .topTrailing
                        
                        
                    )
                
                Text("\(item.name)")
                    .font(Font.system(size: 16))
                    .fontWeight(.medium)
                    .kerning(0.16)
                    .foregroundColor(.black)
                    .frame(alignment: .leading)
                    .padding(.horizontal)
                HStack() {
                    Text("\(item.price) ₽")
                        .font(Font.system(size: 14))
                        .kerning(0.14)
                        .foregroundColor(.black)
                    
                    Text("· \(item.weight)г")
                        .font(Font.system(size: 14))
                        .kerning(0.14)
                        .foregroundColor(.black.opacity(0.65))
                }
                .padding(.horizontal)
                .padding(.vertical, 1)
                Text("\(item.description)")
                    .font(Font.system(size: 14))
                    .kerning(0.14)
                    .foregroundColor(.black.opacity(0.65))
                    
                    .padding(.horizontal)
                
                BlueButton(title: "Добавить в корзину") {
                    self.dataService.addToCart(cartItem: item)
                    self.viewControllerHolder?.dismiss(animated: true, completion: nil)
                }.frame(height: 88)
                
                
            }.background(Color.white).clipShape(RoundedRectangle(cornerRadius: 3.0)).frame(width: UIScreen.main.bounds.size.width - 32)
                .cornerRadius(15)
            
            
        }
        
 
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(item: DishesItem(id: 1, name: "", price: 12, weight: 123, description: "Рыба маринованная со специями, лимонным соком, соевым соусом и запечeнная в духовке с лучком, томатами и картошечкой под золотистой майонезно-сырной шубкой", imageURL: "https://lh3.googleusercontent.com/fife/APg5EOb3-gGunBAb_3E7L5qZLGIx0Wm8kh4UjNn2yow-7Kvf50D7eFb9Iw5g_7W7TQLGKF29-G6VNa7dHS_zEWY8VaSMh9EqUql8UEFISB_WWgiO8nf_mt0YtUhsWFB5uzw-Bfi_eS9Cs-0vLUMiqaqTGgGFDvVhUvak4AypPMEbt2-3mEkxeZNcClEy29x8gEmUU6e9G8s5GDyCxR404OIsgnGHqtIaGIGD7afRoz7PtgtmZdlXC5v7dHujDNh5l28v249qxjpa1rqxoorBb-ywkRsu1bzqDEHGbRDnFNLXHwEGlHoLS1krz9KcD3opkmQckg7-m7PXzEhnQlayqMPiNGP-WpnFYrthFVfJ0TY4zsYFx1azSJZTLa59Xuqr32eagNn9xF6mCPpGqRbunBKrbD-oWidQ_iAXZRRrgjZrv280Joe8z73AluN0A-mXcqRkpVwQo1n3szZ00wX7sD44PriRwHGUfEenTC5IyLVv3MBsYMNXJ9ALa6FZgTrnUhO_ePGoPftELYGNp4yn-xkzfM_GvnQR8A6od0bR8AqqpNketd0kBavJTkaJXBwsfvxinTdLfOTfWsZAhF97XYNEA_9SmTgnnOjt3N8YUxmUeWcor174r7bNdDuDQqq7vWRgFZNorh5v6LANRk0CVsq6B9tVxP2R1zTCc1yXgpu4kNGJsEvNyxMRy-yM3cBvhu01ZUFSalvwAqcS2M9_eBoPCu00KVtcEvyFPoqm_QNHBEkDLjUdtJC7BGcmv7SPa-rV6oH_3zeIYstyKLrgN-Dzewe816A6J7IN4YxSvCIOWbNV9Q6O3hxua_ZrGSk6ijSoBKE0XHUC04cr1O6BzRxL9lwVUhzvBzYfzmBzMPb84Pq-WwBtfCxN2j34NReGu5iABuA1iDNgz0r8WE2Dvvz0XsD6Uc8neX57A7_19J6vyJEhuARJREXGs4tFWHMmjqg-xwYOOPJhxF1BkCaQrUEKtFYBq1pT2N7_h9fMV8JOLP92grJFHRP6TmNrEjPAf9HjfYRFouBAqFMRy614VrJu5hyweBcy-4WbJNYqrvKZH_bXIQyZ6qlv4omHhGTSMMT9cAYTyiMm12bEH5ccThAygPaXlfx6ydA3towLnMpoq0ieByM2-Nql2uh4xPxgAHcmzipRgEqlYDflDKNSfeTVFKKQ4vtTWa43wR505BTjdO3mk5CVoK4sOzwcF1mQA2joVXdW63wbUWtw4wtfa3e9EP1TV01b5M02KKPcr2yxZpNQCo8-Igp6M8t_vqWSKlkq-Z7NaRswW-xQyuFWjCufwgpd1m8i5Z4tnL72DhelmIiI2cXufJb70_eobyMV5VsMUab1nLKWoKwggolnEjl2A1PLrv6T0aRTYmjt3JqFDEV58aIjZhhyrcX6h6Bb_AJzc-OFvFPw1uAuswJaimihZUfYoVuwtNRI27BD7KGnXzMHKthOM4fArK3ICIt61g91DNHAu9qhpWxsj0FrcmujdWE2vJpBf7XoOcgxiRlRKpljQ2c3M6ULTdS1nuypZleouOtwIHOUoxGtT5HJeC8ZcsgI3przMt97iGmSv5Us7xL0j42wVNZbQnyQ6EsIyIG1ZOo2ah9CyA7RqixQUevdzbPhSnJk2w6weuuRCDkdC4H97doLyAV_=w1366-h617", tags: [.всеМеню], quanity: 1))
            .environmentObject(CartDataService())
    }
}
