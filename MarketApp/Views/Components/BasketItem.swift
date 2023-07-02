//
//  BasketItem.swift
//  MarketApp
//
//  Created by Алексей Авер on 02.07.2023.
//

import SwiftUI

struct BasketItem: View {
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            DishesImageView(dishesItem: DishesItem(id: 1, name: "", price: 120, weight: 324, description: "swdf", imageURL: "https://lh3.googleusercontent.com/fife/APg5EOaLWcbpHE0FUlQQ1SZwKMLTc1RcWsZnh7OS_GfCXU2r538v-pk5Hdar1zEBXBL6eUO1dWLw1XlGIvdNJsX3K6z3koKoeraaiUPbB85RiUbAPVuKSZomK6Cj0eTBmIQWAvmB6eLoJNJKzZ4rMlNw92Ddsi6_Bo1EqdMrjFVq7Dayt-YvzfL_zxrBH5680f9xCZPsUgbPtIKel_929KBVlxQdOzpzzsfodsKgs1g7VaCdf7ZAn6lxf4o218DYvJdFeLFwqu4JlShN2bx4Dt-5luy4ID0YDV23-7NLboCoE0dJToNe8umKY9I6ViS0XybW7WuEcLJZ0tsSw7ouANq8YSzWi0b6P5jELKthmz0-8GereEPPfQ_P-1-AWmTjNyHh6-Cv7rHEUG3bInqjBIfcb-zhUknBJ33ORpdB1M-wD-fG5bmQHKbZhHlLe576vDEGepT1zC2YOvcuHcOWqJ1Q1yLb8xlNbq0VU7VUrevmY4VdNAGuQRjCiZK0JHQs996EiMucSITgGY43Vbgo_LqaL-p6ZYK2bdIEPaw-OD1QXf5u5oNKzGaPhrj_MkInICSDfLDxzZPz4Z-gE2BYQv0gYrLr_Y_VC4JvXKOzoRjBFsrouV3tMdLftM0TKKX2QdWIrn8f6qL_UThHi7Dvdiu2-MynOKTo9SCvflysGHZ6h32_r_RFNbYvlDDpgYzmj1_8J5L0p4tqlX9PCWIPoRhhbIkQjojcnYExhrZPJdUz-OXE2vOV2uVAeP2Ya5Nl97AuPvfEGJohrBqi2n8M4cYqOu2K_JhN-Dtb1oQtGfknhU2rsiZpkpmKwvK-TLRQAxGo0slHuqdJ_GWlYEMqdT2CfCj8B4BqPIUlfvDIQ04w8iePh3UFTh__DWvNZuPrbV1gBoPhTaHKvSQBkdlAPtUwV3rRFcuBlrkvNepBymiSRjxTFZ2ZvM30VCyuUYL4fDZRco1ps5-FVKqscFVV9T7fMIgAwgdiSwzfeKDDoYUQ19FQMGAvxCIiuIYqImbjBaInqUpKLvbB4hL6ptm_5703eKasaj83-lO-qV63V-IFpQm93xo4EBPx14m-4BR4VLrEdU3fSypjlg3620uG04Kst29g46Q3WNolZiZoyBx-WdMm8UexzBE9WcZsNMCNpQxk9DndQ0DNwZSHyflK207A66yf6e9p29vVwxhHisfXWwk3xL_mOIL94NOaGMgZ2co2t25YccnSNBfH3pSobSGK1qhhrdXi867F8uEN3pT7LioEAZpA3npYGB9xk1SNQO9hTU2GVuW75WWI-RPd0P3g60po1Kgu7CvqsqroD7cXu968humurg6f2oN7ycaO-9LaM9_fPfv_BW9hZvn-o9MBpUYcRfIL66MMLfvcJKKymQJedtuJr4_V4X3T8JU5V6NU_pSwSpXtcL_3EeQ4wB-842yYW3-nIgF3Ff6pyn8akGbBYrJfriGDLcnw4eO7j59JWrBCLwRMHqrqlEQ_-H8GXTsy2SM_IucKJzmrM1A5an10rW7cF39i91XEU8K4DI7YUJwA1ic9MS2Kd-4ovTGbog9BH0mDEVKeXkIB81GAvybOVfXjCMkKjcOymWWiyrHICO2I3SVge1q9Zl5S-t8xrBr33ZpfJUrl3kbPSRLpw8gXtBlFiBbn=w1366-h617", tags: [.всеМеню]))
                .frame(width: 62)
            HStack(alignment: .center){
                VStack(alignment: .leading, spacing: 4) {
                    Text("123")
                    HStack(alignment: .top) {
                        Text("456")
                        Text("789")
                    }
                    
                }
                Spacer()
                CustomStepper()
            }
            
            
        }.padding(0)
    }
}

struct BasketItem_Previews: PreviewProvider {
    static var previews: some View {
        BasketItem()
    }
}
