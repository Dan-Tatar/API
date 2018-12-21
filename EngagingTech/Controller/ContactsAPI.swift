//
//  ContactsAPI.swift
//  EngagingTech
//
//  Created by Dan  Tatar on 03/11/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation
import UIKit

class ContactsAPI {
    

    typealias JsonResponseCompletion = (Contact?) -> Void
    let defaults = UserDefaults.standard
    
    func getContaxtsData(completion: @escaping JsonResponseCompletion) {
        
        guard let url = URL(string: "https://private-bc5bb-engagingtech.apiary-mock.com/user") else { return}
        
        let task = URLSession.shared.dataTask(with: url)  { (data, response, error) in
            
            guard error == nil else {
                 DispatchQueue.main.async {
                completion(nil)
                }
                print("Error for task: \(error)")
                return
            }
            
            guard let data = data else { return}
            
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode( Contact.self, from: data)
              
                self.defaults.set(json.name, forKey: "jsonName")
                
                self.defaults.synchronize()
                DispatchQueue.main.async {
                      completion(json)
                }
              
                print("Succesfully decoded data is: \(json)")
                self.readUserDefaults()
                
            } catch let err{
                print("There is an error: \(err)")
                
            }

        }
        task.resume()
    }
    
    func readUserDefaults() {
        
        let savedName = defaults.object(forKey: "jsonName") as? String ?? ""
        print(" This is the saved name \(savedName)")

        
    }

    
    fileprivate let downloadQueue = DispatchQueue.global(qos: .background)
    
    func downloadImage(from url: URL, completion: @escaping (_ image: UIImage?) -> ()) {

        downloadQueue.async {
            do {
                let data = try Data(contentsOf: url)
                
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                    completion(image) }
                   } else { print("Cpild not decode image") }
                } catch {
                   print("Could not load URL: \(url): \(error)")
                }
        }
    }

}

