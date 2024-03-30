//
//  ViewController.swift
//  Assignment_4_(Users)
//
//  Created by Deepali on 30/03/24.
//

import UIKit

class ViewController: UIViewController {
    var url : URL?
    var urlRequest : URLRequest?
    var urlSession : URLSession?
    var users : [JsonResponse] = []

    override func viewDidLoad() {
        super.viewDidLoad()
      jsonSerialization()
        
    }
    
    func jsonSerialization(){
        
        url = URL(string: "https://jsonplaceholder.typicode.com/users")
        urlRequest = URLRequest(url: url!)
        urlRequest?.httpMethod = "GET"
        urlSession = URLSession(configuration: .default)
        
        let dataTask = urlSession?.dataTask(with: urlRequest!) {
            data, response, error in
            let jsonResponse = try! JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
           
            
            for eachUser in jsonResponse {
                
                let eachUserid = eachUser["id"] as! Int
                let eachUserName = eachUser["name"] as! String
                let eachUserUserName = eachUser["username"] as! String
                let eachUserEmail = eachUser["email"] as! String
                
               // jsonResponse is itself a key containing "key-value" pair [String:Any]
                let eachUserAddress = eachUser["jsonResponse"] as! [String:Any]
                
                let eachUserStreet = eachUserAddress["street"] as! String
                let eachUserSuite = eachUserAddress["suite"] as! String
                let eachUserCity = eachUserAddress["city"] as! String
                let eachUserZipCode = eachUserAddress["zipcode"] as! String
                
                let newAddress = Address(street: eachUserStreet, suite: eachUserSuite, city: eachUserSuite, zipcode: eachUserZipCode)
                
                let newUser = JsonResponse(id: eachUserid, name: eachUserName, username: eachUserUserName, email: eachUserEmail, jsonResponse: newAddress)

                self.users.append(newUser)
                print(self.users)
            }
            
            
        }.resume()
        
    }
    
}
