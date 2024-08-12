//
//  WordsView.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 12.08.2024.
//

import SwiftUI

struct WordsView: View {
  @State var isShowTranslate = false
    var body: some View {
      ZStack {
        VStack {
          Spacer()
          VStack(spacing: 23) {
            VStack(alignment: .leading) {
              Text("EN")
                .font(.system(size: 12, weight: .black))
                .padding(.bottom, 0)
              Text("Car")
                .font(.system(size: 36, weight: .black))
            }
            ZStack {
              Text("Машина")
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
          
          Spacer()
          
          Button {
            
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
      }
    }
}

#Preview {
    ContentView()
}
