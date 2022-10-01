//
//  WineView.swift
//  SwiftHTTPExample
//
//  Created by Dylan Rafferty on 10/1/22.
//

import SwiftUI

struct WineView: View {
    
    let wine: Wine
    
    var body: some View {
        VStack(alignment: .center) {
            Text(wine.wine)
            Text("Winery: \(wine.winery)")
            if let url = wine.imageURL {
                AsyncImage(url: url)
                    .scaledToFill()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 140)
            }
            Text("Rated: \(wine.rating.average)")
        }
    }
}

struct WineView_Previews: PreviewProvider {
    static var previews: some View {
        WineView(wine: Wine(
            winery: "Sample",
            wine: "Standard Red",
            rating: Wine.Rating(
                average: "4.7",
                reviews: "N/A"
            ),
            location: "Philadelphia, Pa",
            image: "TestURL",
            id: 1)
        )
    }
}
