//
//  ContentView.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 12.08.2024.
//

import SwiftUI

struct ContentView: View {
  @State var selected = 1
  
  @ObservedObject var listViewModel = ListViewModel()
  
    var body: some View {
      ZStack {
        TabView(selection: $selected) {
          ListView()
            .padding(.horizontal, 15)
            .environmentObject(listViewModel)
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
          LinksView()
            .padding(.horizontal, 15)
            .tag(3)
            .tabItem {
              VStack {
                Image(systemName: "link")
                Text("Links")
              }
            }
        }
        
        if listViewModel.isShowAddView {
          AddNewWordView()
            .environmentObject(listViewModel)
        }
      }
    }
}

#Preview {
    ContentView()
}
