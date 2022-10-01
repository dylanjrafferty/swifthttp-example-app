//
//  ContentView.swift
//  SwiftHTTPExample
//
//  Created by Dylan Rafferty on 9/28/22.
//

import SwiftUI
import SwiftHTTP

struct ContentView: View {
    
    @State private var redWines = [Wine]()
    @State private var isRefreshing = false
    
    var body: some View {
        NavigationView {
            Button("Refresh") {
                Task.detached {
                    await refreshRedWines()
                }
            }
            List(redWines) { wine in
                HStack {
                    Spacer()
                    WineView(wine: wine)
                    Spacer()
                }
            }
        }
        .task {
            await refreshRedWines()
        }
    }
    
    private func refreshRedWines() async {
        do {
            guard !isRefreshing else { return }
            isRefreshing = true
            guard let url = URL(string: "https://api.sampleapis.com/wines/reds") else { return }
            redWines = try await WineRequest()
                .networkingEnvironment(\.baseURL, url)()
            isRefreshing = false
        } catch {
            print("Failed to get data: ", error.localizedDescription)
            isRefreshing = false
        }
    }
}

final class WineRequest: Requestable {
    
    @NetworkingEnvironment(\.baseURL) private var baseURL: URL
    
    typealias ResponseType = [Wine]
    
    var request: Request {
        Request(url: baseURL) {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
