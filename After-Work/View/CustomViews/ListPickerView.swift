//
//  ListPickerView.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 05/10/2021.
//

import SwiftUI

struct ListPickerView: View {
    
    @Binding var selection: Int
    
    private let all = "All"
    private let favorites = "Favorites"
    
    var body: some View {
        Picker("ListState", selection: $selection) {
            Text(all).tag(1)
            Text(favorites).tag(2)
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct ListPickerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListPickerView(selection: .constant(1))
                .previewLayout(.fixed(width: 500, height: 50))
            ListPickerView(selection: .constant(2))
                .previewLayout(.fixed(width: 500, height: 50))
        }
    }
}
