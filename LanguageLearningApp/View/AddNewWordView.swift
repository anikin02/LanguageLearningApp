//
//  AddNewWordView.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 12.08.2024.
//

import SwiftUI
import RealmSwift

struct AddNewWordView: View {
  @State var newWord = String()
  @State var translate = String()
  @State var description = String()
  
  @State var showAlert = false
  
  @EnvironmentObject var listViewModel: ListViewModel
  
  @ObservedResults(WordItem.self) var wordItems
  
    var body: some View {
      VStack {
        HStack {
          Spacer()
          Text("New word")
            .font(.system(size: 20, weight: .black))
            .padding(.leading, 16)
          Spacer()
          Button {
            listViewModel.isShowAddView.toggle()
          } label: {
            Image(systemName: "xmark")
              .resizable()
              .frame(width: 16, height: 16)
              .foregroundColor(.black)
          }
        }
        
        VStack (alignment: .leading) {
          Text("EN")
            .font(.system(size: 12, weight: .black))
          HStack {
            TextField("Word", text: $newWord)
          }
          .padding(.vertical, 13)
          .padding(.horizontal, 23)
          .background(Color("GRAY"))
          .cornerRadius(10)
          HStack {
            TextField("Translate", text: $translate)
          }
          .padding(.vertical, 13)
          .padding(.horizontal, 23)
          .background(Color("GRAY"))
          .cornerRadius(10)
          
          Text("Description")
            .font(.system(size: 14, weight: .black))
            .padding(.top, 23)
            .padding(.leading, 23)
          HStack {
            TextEditor(text: $description)
              .frame(height: 90)
              .colorMultiply(Color("GRAY"))
          }
          .padding(.vertical, 13)
          .padding(.horizontal, 23)
          .background(Color("GRAY"))
          .cornerRadius(10)
        }
        Spacer()
        
        Button {
          if newWord.count == 0, translate.count == 0 {
            showAlert.toggle()
          } else {
            let word = WordItem()
            
            word.word = newWord
            word.wordTranslate = translate
            word.wordDescription = description
            
            $wordItems.append(word)
            
            withAnimation() {
              listViewModel.isShowAddView.toggle()
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
    AddNewWordView()
}
