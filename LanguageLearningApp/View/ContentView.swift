//
//  ContentView.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 12.08.2024.
//

import SwiftUI

struct ContentView: View {
  @State var selected = 2
    var body: some View {
      TabView(selection: $selected) {
        ListView()
          .padding(.horizontal, 15)
          .tag(1)
          .tabItem {
            VStack {
              Image(systemName: "list.bullet")
              Text("List")
            }
          }
        WordsView()
          .padding(.horizontal, 15)
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
