//
//  WordsView.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 12.08.2024.
//

import SwiftUI
import RealmSwift

struct WordsView: View {
  @ObservedResults(WordModel.self) var wordItems
  
  @State var isShowTranslate = false
  @State var word = WordModel()
  
  @State var offsetX: CGFloat = 0
  @State var opacity: CGFloat = 1
  
    var body: some View {
      ZStack {
        VStack {
          Spacer()
          VStack(spacing: 23) {
            VStack(alignment: .leading) {
              Text("EN")
                .font(.system(size: 12, weight: .black))
                .padding(.bottom, 0)
              Text(word.word)
                .font(.system(size: 36, weight: .black))
            }
            ZStack {
              Text(word.wordTranslate)
                .font(.system(size: 26, weight: .thin))
                .opacity(isShowTranslate ? 1 : 0)
              Button {
                withAnimation {
                  isShowTranslate.toggle()
                }
              } label: {
                Text("Show translate")
                  .padding(.vertical, 13)
                  .padding(.horizontal, 60)
                  .foregroundColor(.white)
                  .background(Color("MAIN"))
                  .clipShape(Capsule())
              }
              .opacity(isShowTranslate ? 0 : 1)
            }
          }
          .opacity(opacity)
          .offset(x: offsetX)
          
          Spacer()
          
          Button {
            withAnimation {
              opacity = 0
              offsetX = -50
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
              setRandomWord()
              offsetX = 50
              isShowTranslate = false
              withAnimation {
                offsetX = 0
                opacity = 1
              }
            }
          } label: {
            HStack {
              Text("Next")
              Image(systemName: "chevron.right")
            }
            .foregroundColor(Color("MAIN"))
          }
          .padding(.bottom, 28)
        }
        .frame(maxWidth: .infinity)
        .onAppear {
          setRandomWord()
        }
      }
    }
  
  func setRandomWord() {
    var randomIndex = Int.random(in: 0..<wordItems.count)
    word = wordItems[randomIndex]
  }
}

#Preview {
    ContentView()
}
