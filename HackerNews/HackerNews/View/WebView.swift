//
//  WebView.swift
//  HackerNews
//
//  Created by Mukunda on 21/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String?
   
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString{
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
}
}
}
