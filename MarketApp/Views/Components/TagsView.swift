//
//  TagsView.swift
//  MarketApp
//
//  Created by Алексей Авер on 02.07.2023.
//

import SwiftUI

struct TagsView: View {
    @StateObject private var viewModel = TagsViewViewModel()
    @Binding var searchTag: Tag
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                
                ForEach(Tag.allCases, id: \.self) { tag in
                    
                    Button {
                        withAnimation {
                            viewModel.choosenTag = tag
                            searchTag = tag
                        }
                        
                    } label: {
                        Text("\(tag.rawValue)")
                            .font(Font.system(size: 14))
                            .kerning(0.14)
                            .foregroundColor(viewModel.choosenTag == tag ? Color.white : Color.black)
                            .frame(width: 109, height: 30, alignment: .center)
                            .background(viewModel.choosenTag == tag ? Color(red: 0.2, green: 0.39, blue: 0.88) : Color(red: 0.97, green: 0.97, blue: 0.96), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    }
                    
                }
            }
        }
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(searchTag: .constant(.всеМеню))
        
    }
}
