//
//  ContentView.swift
//  H4X0R News
//
//  Created by Marlon Junior on 05/05/22.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var networkingManager = NetworkingManager()
    
    var body: some View {
        NavigationView{
            List(networkingManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                    
                }
            }
            .navigationBarTitle("News")
        }
        .onAppear{
            self.networkingManager.fetchData()
        }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


