//
//  LinkModel.swift
//  LanguageLearningApp
//
//  Created by anikin02 on 13.08.2024.
//

import Foundation
import RealmSwift

class LinkModel: Object, ObjectKeyIdentifiable {
  @Persisted(primaryKey: true) var id: ObjectId
  
  @Persisted var nameLink: String
  @Persisted var urlLink: String
  
  override class func primaryKey() -> String? {
    "id"
  }
}
