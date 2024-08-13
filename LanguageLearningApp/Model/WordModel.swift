//
//  WordModel.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 13.08.2024.
//

import Foundation
import RealmSwift

class WordModel: Object, ObjectKeyIdentifiable {
  @Persisted(primaryKey: true) var id: ObjectId
  
  @Persisted var location: String = "EN"
  @Persisted var word: String = ""
  @Persisted var wordTranslate: String = ""
  @Persisted var wordDescription: String = ""
  
  @Persisted var weight: Int = 0
  
  override class func primaryKey() -> String? {
    "id"
  }
  
}
