//
//  AspectVGrid.swift
//  CardGame
//
//  Created by Elizabeth Yu on 2022/02/08.
//

import SwiftUI

struct AspectVGrid<Item,ItemView>: View where ItemView: View, Item: Identifiable{
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
    
    //whenever you have a function that you are passing that  escapes. mark it @escaping. We are holding onto the function.
    // @escaping is used to inform callers of a function that takes a closure that the closure might be stored or otherwise outlive the scope of the receiving function
    init(items:[Item], aspectRatio: CGFloat , @ViewBuilder content: @escaping (Item) -> ItemView ){
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader{geometry in
            let width: CGFloat =  widthThatFits(itemCount: items.count, size: geometry.size, itemAspectRatio: aspectRatio)
            LazyVGrid(columns:[adaptiveGridItem(width: width)], spacing: 0){
                ForEach(items){ item in
                    content(item).aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
        }
    }

    //Determines the adaptiveGridItem, out goals is to remove scroll view and be able to look at all
    //the cards from the given display 
    private func adaptiveGridItem(width: CGFloat) -> GridItem{
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    //Determines the wisth of each card.
    private func widthThatFits(itemCount: Int, size:CGSize, itemAspectRatio: CGFloat) -> CGFloat{
        var columnCount = 1
        var rowCount = itemCount
        
        repeat{
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / itemAspectRatio
            if CGFloat(rowCount) * itemHeight < size.height{
                break
            }
            columnCount += 1
            rowCount = (itemCount + (columnCount - 1 )) / columnCount
        } while columnCount < itemCount
        if columnCount > itemCount{
          columnCount = itemCount
        }
        return floor(size.width / CGFloat(columnCount))
    }
    
}

//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid()
//    }
//}
