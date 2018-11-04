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
    
    func getContaxtsData(completion: @escaping JsonResponseCompletion) {
        
        guard let url = URL(string: "https://private-bc5bb-engagingtech.apiary-mock.com/user") else { return}
        
        let task = URLSession.shared.dataTask(with: url)  { (data, response, error) in
            
            guard error == nil else {
                completion(nil)
                print("Error: \(error)")
                return
            }
            
            guard let data = data else { return}
            
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode( Contact.self, from: data)
                completion(json)
//                guard let json = jsonAny as? [String: Any]  else { return}
                print("Succesfully decoded data is: \(json)")
                
            } catch let err{
                print("There is an error: \(err)")
                
            }
//            print("Data = \(data)")
//            print("response = \(response)")
        }
        task.resume()
    }
    
    fileprivate let downloadQueue = DispatchQueue.global(qos: .background)
    
    func downloadImage(from url: URL, completion: @escaping (_ image: UIImage) -> Void) {
        downloadQueue.async(execute: { () -> Void in
            do {
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                    completion(image) }
                   } else { print("Cpild not decode image") }
                } catch {
                   print("Could not load URL: \(url): \(error)")
                }
        })
    }

}
