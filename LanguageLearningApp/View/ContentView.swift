//
//  ContentView.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 12.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      TabView {
        Text("List")
          .tag(1)
          .tabItem {
            VStack {
              Image(systemName: "list.bullet")
              Text("List")
            }
          }
        Text("Words")
          .tag(2)
          .tabItem {
            VStack {
              Image(systemName: "textformat.abc")
              Text("Words")
            }
          }
        Text("Links")
          .tag(3)
          .tabItem {
            VStack {
              Image(systemName: "link")
              Text("Links")
            }
          }
      }
    }
}

#Preview {
    ContentView()
}
