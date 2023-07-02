//
//  TagsView.swift
//  MarketApp
//
//  Created by Алексей Авер on 02.07.2023.
//

import SwiftUI

struct TagsView: View {
    @StateObject private var viewModel = TagsViewViewModel()
    @Binding var isSelected: Bool
    @State var color: Color
    @Binding var searchTag: Tag
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                let tags = viewModel.text
                ForEach(tags, id: \.self) { tag in
                    Text("\(tag)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 30)
                        .background(isSelected ? .blue : .gray, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .padding(.horizontal, 1)
                        .onTapGesture {
                            searchTag = Tag(rawValue: tag) ?? .всеМеню
                            isSelected.toggle()
    
                        }
                }
            }
        }
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(isSelected: .constant(false), color: .gray, searchTag: .constant(.всеМеню))
        
    }
}
