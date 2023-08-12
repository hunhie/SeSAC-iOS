//
//  MovieContributor.swift
//  Media Project
//
//  Created by walkerhilla on 2023/08/12.
//

import Foundation

class MovieContributor {
  enum genderType {
    case male
    case female
  }
  
  enum CreditRoleType {
    case cast
    case crew
  }
  
  let id: Int
  let role: CreditRoleType
  let name: String
  let genderNumber: Int
  let department: String
  let profilePath: String
  
  init(id: Int, role: CreditRoleType, name: String, genderNumber: Int, department: String, profilePath: String) {
    self.id = id
    self.role = role
    self.name = name
    self.genderNumber = genderNumber
    self.department = department
    self.profilePath = profilePath
  }
  
  var gender: genderType {
    genderNumber == 0 ? .male : .female
  }
  
  var profileImageURL: String {
    MovieAPIManager.imageCDN + profilePath
  }
}

final class Cast: MovieContributor {
  let character: String
  
  init(id: Int, role: MovieContributor.CreditRoleType, name: String, genderNumber: Int, department: String, profilePath: String, character: String) {
    self.character = character
    super.init(id: id, role: role, name: name, genderNumber: genderNumber, department: department, profilePath: profilePath)
  }
}

final class Crew: MovieContributor {
  let job: String
  
  init(id: Int, role: MovieContributor.CreditRoleType, name: String, genderNumber: Int, department: String, profilePath: String, job: String) {
    self.job = job
    super.init(id: id, role: role, name: name, genderNumber: genderNumber, department: department, profilePath: profilePath)
  }
}
