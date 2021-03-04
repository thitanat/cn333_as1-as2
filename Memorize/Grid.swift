//
//  Grid.swift
//  Memorize
//
//  Created by Macintosh HD on 3/3/2564 BE.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView){
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { Geometry in
            body(for: GridLayout(itemCount: items.count, in: Geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            let itemIndex = items.firstIndex(matching: item)
                viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: itemIndex!))
        }
    }
    
}

