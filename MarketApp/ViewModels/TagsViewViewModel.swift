//
//  TagsViewViewModel.swift
//  MarketApp
//
//  Created by Алексей Авер on 02.07.2023.
//

import Foundation
import SwiftUI

class TagsViewViewModel: ObservableObject {
    @Published var choosenTag: Tag = .всеМеню
    
}
