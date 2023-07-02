//
//  TagsViewViewModel.swift
//  MarketApp
//
//  Created by Алексей Авер on 02.07.2023.
//

import Foundation
import SwiftUI

class TagsViewViewModel: ObservableObject {
    @Published var text: [String] = []
    
    init() {
        for tag in Tag.allCases {
            text.append(tag.rawValue)
        }
    }
    func tap() {
        
    }
}
