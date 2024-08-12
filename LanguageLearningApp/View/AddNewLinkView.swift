//
//  AddNewLinkView.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 12.08.2024.
//

import SwiftUI

struct AddNewLinkView: View {
  @State var title = String()
  @State var link = String()
  
  @EnvironmentObject var linksViewModel: LinksViewModel
  
    var body: some View {
      VStack {
        HStack {
          Spacer()
          Text("New link")
            .font(.system(size: 20, weight: .black))
            .padding(.leading, 16)
          Spacer()
          Button {
            linksViewModel.isShowAddView.toggle()
          } label: {
            Image(systemName: "xmark")
              .resizable()
              .frame(width: 16, height: 16)
              .foregroundColor(.black)
          }
        }
        
        VStack (alignment: .leading) {
          HStack {
            TextField("Title", text: $title)
          }
          .padding(.vertical, 13)
          .padding(.horizontal, 23)
          .background(Color("GRAY"))
          .cornerRadius(10)
          HStack {
            TextField("Link", text: $link)
          }
          .padding(.vertical, 13)
          .padding(.horizontal, 23)
          .background(Color("GRAY"))
          .cornerRadius(10)
        }
        Spacer()
        
        Button {
          linksViewModel.isShowAddView.toggle()
        } label: {
          Text("Save")
            .padding(.vertical, 13)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color("MAIN"))
            .clipShape(Capsule())
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
      .padding(15)
      .background(.white)
    }
}

#Preview {
    AddNewLinkView()
}
