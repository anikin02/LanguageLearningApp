//
//  LinksView.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 12.08.2024.
//

import SwiftUI

struct LinksView: View {
  
  @EnvironmentObject var linksViewModel: LinksViewModel
  
    var body: some View {
      ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
        ScrollView() {
          VStack(spacing: 10) {
            LinkItem(name: "Lesson 1")
            LinkItem(name: "English Sentence Structure")
            LinkItem(name: "British and American English Pronunciation")
            LinkItem(name: "To and For – 5 Levels")
          }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        Button {
          linksViewModel.isShowAddView.toggle()
        } label: {
          ZStack {
            Circle()
              .frame(width: 56, height: 56)
              .foregroundColor(Color("MAIN"))
            Image(systemName: "plus")
              .resizable()
              .frame(width: 20, height: 20)
              .foregroundColor(.white)
          }
        }
        .offset(x: -20, y: -30)
      }
      .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct LinkItem: View {
  var name: String
  var body: some View {
    HStack {
      HStack(spacing: 15) {
        Image(systemName: "link")
        Text(name)
      }
      Spacer()
      Button() {
        
      } label: {
        Image(systemName: "xmark")
          .foregroundColor(.black)
      }
    }
    .frame(maxWidth: .infinity)
    .padding(20)
    .background(Color("GRAY"))
    .cornerRadius(10)
  }
}

#Preview {
    ContentView()
}
