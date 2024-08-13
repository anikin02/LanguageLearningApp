//
//  AddNewLinkView.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 12.08.2024.
//

import SwiftUI
import RealmSwift

struct AddNewLinkView: View {
  @State var title = String()
  @State var link = String()
  
  @State var showAlert = false
  
  @EnvironmentObject var linksViewModel: LinksViewModel
  
  @ObservedResults(LinkModel.self) var linkItems
  
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
          if title.count == 0 && link.count == 0 {
            showAlert.toggle()
          } else {
            let link = LinkModel()
            link.nameLink = title
            link.urlLink = self.link
            
            $linkItems.append(link)
            
            withAnimation {
              linksViewModel.isShowAddView.toggle()
            }
          }
        } label: {
          Text("Save")
            .padding(.vertical, 13)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color("MAIN"))
            .clipShape(Capsule())
        }
        .alert(Text("Empty fields"), isPresented: $showAlert, actions: {})
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
      .padding(15)
      .background(.white)
    }
}

#Preview {
    AddNewLinkView()
}
