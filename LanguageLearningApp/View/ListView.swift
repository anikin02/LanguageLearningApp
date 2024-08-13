//
//  ListView.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 12.08.2024.
//

import SwiftUI
import RealmSwift

struct ListView: View {
  @State var searhText = String()
  
  @EnvironmentObject var listViewModel: ListViewModel
  
  @ObservedResults(WordModel.self, sortDescriptor: SortDescriptor(keyPath: "word", ascending: true)) var wordItems
  
  var body: some View {
    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
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
          .searchable(text: $searhText, collection: $wordItems, keyPath: \.word)
          
          // cards
          VStack(spacing: 20) {
            ForEach(wordItems, id: \.id) { item in
              CardItem(wordItem: item) {
                $wordItems.remove(item)
              }
            }
          }
        }
        .padding(.horizontal, 15)
      }
      
      Button {
        listViewModel.isShowAddView.toggle()
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
  }
}

struct CardItem: View {
  
  @State var offsetX: CGFloat = 0
  var wordItem: WordModel
  var onDelete: ()->()
  
  var body: some View {
    
    ZStack(alignment: .trailing) {
      removeImage()
      
      VStack(alignment: .leading, spacing: 10) {
        VStack(alignment: .leading) {
          Text(wordItem.location)
            .font(.system(size: 12, weight: .black))
            .padding(.bottom, 5)
          Text(wordItem.word)
            .font(.system(size: 18, weight: .black))
            .padding(.bottom, 1)
          Text(wordItem.wordTranslate)
            .font(.system(size: 16, weight: .light))
        }
        
        if wordItem.wordDescription.count > 0 {
          Divider()
          
          VStack(alignment: .leading) {
            Text("Description:")
              .font(.system(size: 12, weight: .black))
              .foregroundColor(Color("GRAY1"))
            Text(wordItem.wordDescription)
          }
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(20)
      .background(Color("GRAY"))
      .cornerRadius(10)
      .offset(x: offsetX)
      .gesture(DragGesture()
        .onChanged { value in
          if value.translation.width < 0 {
            offsetX = value.translation.width
          }
        }
        .onEnded { value in
          withAnimation {
            if screenSize().width * 0.8 < -value.translation.width {
              withAnimation {
                offsetX = -screenSize().width
                onDelete()
              }
            } else {
              offsetX = 0
            }
          }
        }
      )
    }
  }
  
  @ViewBuilder
  func removeImage() -> some View {
    Image(systemName: "xmark")
      .resizable()
      .frame(width: 10, height: 10)
      .offset(x: 30)
      .offset(x: offsetX * 0.5)
      .scaleEffect(CGSize(width: -offsetX * 0.006,
                          height: -offsetX * 0.006))
  }
  
}

extension View {
  func screenSize() -> CGSize {
    guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
      return .zero
    }
    return window.screen.bounds.size
  }
}

#Preview {
  ContentView()
}
