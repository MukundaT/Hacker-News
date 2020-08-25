//
//  ContentView.swift
//  HackerNews
//
//  Created by Mukunda on 20/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) {
                post in
                NavigationLink(destination: DetailView(url:post.url)) {
                    HStack{
                        //                    Text("\(post.points)")
                        Text(String(post.points))
                        Text(post.title)
                    }

                }
            }
            .navigationBarTitle("HACKER NEWS")
        }
        .onAppear {
            self.networkManager.featchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


