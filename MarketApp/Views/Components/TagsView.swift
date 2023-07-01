//
//  TagsView.swift
//  MarketApp
//
//  Created by Алексей Авер on 02.07.2023.
//

import SwiftUI

struct TagsView: View {
    @Binding var searchTag: Tag
    @StateObject private var viewModel = TagsViewViewModel()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                 let tags = viewModel.text
                    ForEach(tags, id: \.self) { tag in
                        Text("\(tag)")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .background(.mint, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .padding(.horizontal, 8)
                            .onTapGesture {
                                searchTag = Tag(rawValue: tag) ?? .всеМеню
                            }
                }
                
                
            }
            
        }
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(searchTag: .constant(.всеМеню))    }
}
