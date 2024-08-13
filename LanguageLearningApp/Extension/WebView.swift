//
//  WebView.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 13.08.2024.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
  
  @Binding var urlString: String
  var isLoad: (Bool) -> ()
  
  func makeUIView(context: Context) -> some UIView {
    let webView = WKWebView()
    webView.navigationDelegate = context.coordinator
    
    if let openURL = URL(string: urlString) {
      let urlComponent = URLComponents(url: openURL, resolvingAgainstBaseURL: true)
      let request = URLRequest(url: urlComponent?.url ?? openURL)
      webView.load(request)
    }
    
    return webView
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) { }
  
  func makeCoordinator() -> WebViewCoordinator {
    WebViewCoordinator { isLoad in 
      self.isLoad(isLoad)
    }
  }
}

class WebViewCoordinator: NSObject, WKNavigationDelegate {
  let isLoad: (Bool) -> ()
  
  init(isLoad: @escaping (Bool) -> ()) {
    self.isLoad = isLoad
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    isLoad(true)
  }
}
