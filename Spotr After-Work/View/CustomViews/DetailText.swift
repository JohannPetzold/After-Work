//
//  DetailText.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 06/10/2021.
//

import SwiftUI

struct DetailText: View {
    
    var title: String
    var details: [String] = []
    var recipe: String = ""
    
    private let dividerHeight: CGFloat = 1
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(Colors.primary)
                .bold()
            Divider().frame(height: dividerHeight).background(Colors.text)
            if details.count > 0 {
                ForEach(details, id: \.self) { detail in
                    Text(detail)
                }
            } else if recipe != "" {
                Text(recipe)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
        }
    }
}

struct DetailText_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailText(title: "INGREDIENTS", details: ["2-3 oz Light rum", "Juice of 1 lime", "2 tsp Sugar", "2-4 Mint", "Soda water"])
                .previewLayout(.sizeThatFits)
            DetailText(title: "INGREDIENTS", recipe: "Grab your boston tin, fill it with cubes ice and then simply chuck in all your ingredients apart from your lemonade.\nNow it’s time to shake what your mama gave you until all your ingredients are blended to perfection.\nAdd some cubes of ice to your hurricane glass, give them a swill to cool the whole thing down and then strain your raspberry vodka cocktail of wonder into the glass.\nTop with lemonade and chuck a sprig of mint on top for garnish.\nYou can either get drinking at this point or go and try and grab a few butterflies to finish, the choice really is yours.")
                .previewLayout(.sizeThatFits)
        }
        
    }
}
