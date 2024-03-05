//
//  model.swift
//  Tenant
//
//  Created by Will Ju on 10/20/23.
//

import Foundation
import SwiftUI

struct User: UserProtocol, Identifiable, Codable {
    
    let id: String
    var email: String
    var fullName: String
    
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, email: "will@choluxuryrentals.com", fullName: "William Ju")
}
