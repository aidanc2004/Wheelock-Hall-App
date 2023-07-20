//
//  ItemView.swift
//  Wheelock Hall
//
//  Created by Aidan Carey on 2023-07-20.
//

import SwiftUI

struct ItemView: View {
    var item: Item
    // TODO: make tapping item show info (calories, nutrients, etc)
    @State var selected: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .font(.subheadline)
            
            // show item description if it exists
            if item.desc != "~" {
                // TODO: only capitalize first word
                Text(item.desc.capitalized)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            if selected {
                Group {
                    Text("\(item.portion)")
                    Text("\(item.calories)")
                    // probably use seperate view for these
                    Text("Ingredients: TODO")
                    Text("Nutrients: TODO")
                }
                .font(.caption)
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var item: Item = Item(id: "id",
        name: "Item Name",
        desc: "This is an item description.",
        nutrients: [],
        calories: 123,
        portion: "1 each"
    )
    
    static var previews: some View {
        ItemView(item: item)
    }
}