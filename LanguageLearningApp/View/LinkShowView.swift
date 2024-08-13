//
//  LinkShowView.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 13.08.2024.
//

import SwiftUI

struct LinkShowView: View {
  @Binding var urlString: String
  
  @State var isLoaded = false
  @State var title = String()
  
  @EnvironmentObject var linksViewModel: LinksViewModel
  
  
    var body: some View {
      ZStack {
        VStack(spacing: 0) {
          HStack {
            Circle()
              .frame(width: 30)
              .foregroundColor(isLoaded ? Color("MAIN") : .black)
            Spacer()
            Text(title)
              .padding(.trailing, 30)
              .fontWeight(.bold)
            Spacer()
            Button {
              linksViewModel.isShowLinkContent.toggle()
            } label: {
              Image(systemName: "xmark")
                .foregroundColor(.black)
            }
          }
          .padding(.horizontal, 15)
          .padding(.bottom, 10)
          .background(Color("GRAY"))
          
          WebView(urlString: $urlString) { isLoad in
            self.isLoaded = isLoad
          }
        }
      }
      .onAppear {
        if let url = URL(string: urlString) {
          title = url.host() ?? ""
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
