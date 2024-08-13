//
//  LinksViewModel.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 12.08.2024.
//

import Foundation

class LinksViewModel: ObservableObject{
  @Published var isShowAddView = false
  
  @Published var isShowLinkContent = false
  @Published var openUrl = ""
}
