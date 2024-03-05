//
//  UserProtocol.swift
//  Tenant
//
//  Created by Will Ju on 11/11/23.
//

import Foundation

protocol UserProtocol {
    
    var id: String { get }
    var email: String { get }
    var fullName: String { get }
    
}

extension UserProtocol {
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            //return String(formatter.string(from: components).reversed())
            return formatter.string(from: components)
        }
        //if full name is null
        return ""
    }
}

