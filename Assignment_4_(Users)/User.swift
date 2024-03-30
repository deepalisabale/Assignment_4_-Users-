//
//  User.swift
//  Assignment_4_(Users)
//
//  Created by Deepali on 30/03/24.
//

import Foundation

struct JsonResponse{
    var id : Int
    var name : String
    var username : String
    var email : String
    var jsonResponse : Address
    
    }
struct Address {
    var street : String
    var suite : String
    var city : String
    var zipcode : String
    }
