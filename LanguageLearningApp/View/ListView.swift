//
//  ListView.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 12.08.2024.
//

import SwiftUI

struct ListView: View {
  @State var searhText = String()
    var body: some View {
      ScrollView (.vertical, showsIndicators: false) {
        VStack(spacing: 25) {
          // search bar
          HStack {
            Image(systemName: "magnifyingglass")
              .resizable()
              .frame(width: 15, height: 15)
            TextField("Search", text: $searhText)
          }
          .frame(maxWidth: .infinity)
          .padding(.horizontal, 20)
          .padding(.vertical, 16)
          .background(Color("GRAY"))
          .cornerRadius(10)
          
          // cards
          VStack(spacing: 20) {
            CardItem()
            CardItem()
            CardItem()
          }
        }
        
      }
    }
}

struct CardItem: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      VStack(alignment: .leading) {
        Text("EN")
          .font(.system(size: 12, weight: .black))
          .padding(.bottom, 5)
        Text("Car")
          .font(.system(size: 18, weight: .black))
          .padding(.bottom, 1)
        Text("Машина")
          .font(.system(size: 16, weight: .light))
      }
      
      Divider()
      
      VStack(alignment: .leading) {
        Text("Description:")
          .font(.system(size: 12, weight: .black))
          .foregroundColor(Color("GRAY1"))
        Text("A road vehicle with an engine, four wheels, and seats for a small number of people")
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(20)
    .background(Color("GRAY"))
    .cornerRadius(10)
  }
}

#Preview {
  ContentView()
}
