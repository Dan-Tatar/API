//
//  ContactsAPI.swift
//  EngagingTech
//
//  Created by Dan  Tatar on 03/11/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ContactsAPI {

    typealias JsonResponseCompletion = (Contact?) -> Void
    
    func getContaxtsData(completion: @escaping JsonResponseCompletion) {
        
        guard let url = URL(string: "https://private-bc5bb-engagingtech.apiary-mock.com/user") else { return}
        
        let task = URLSession.shared.dataTask(with: url)  { (data, response, error) in
            
            guard error == nil else {
                   self.fetchFromStorage()
                completion(nil)
                print("Error: \(error)")
               
                return
            }
            
            guard let data = data else { return}
            
         
            
            do {
                guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext else {
                    fatalError("Failed to retrieve managed object context")
                }
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
                let context = appDelegate.persistentContainer.viewContext
                let decoder = JSONDecoder()
                
                decoder.userInfo[codingUserInfoKeyManagedObjectContext] = context
                
                let json = try decoder.decode( Contact.self, from: data)
                   //to be deleted
                self.clearStorage()
           
                try context.save()

                DispatchQueue.main.async {
                      completion(json)
                }
              
                print("Succesfully decoded data is: \(json)")
               
            } catch let err{
                print("There is an error: \(err)")
               
            }

        }
        task.resume()
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
private extension ContactsAPI {
    
    func fetchFromStorage(){
    
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Contact>(entityName: "Contact")

        do {
           let contacts = try managedContext.fetch(fetchRequest)
       
            print("Counting contacts. \(contacts.count)")
            print("Loading contacts. \(contacts)")

        } catch let error {
            print("Could not fetch. \(error), \(error._userInfo)")
            
        }
    }
    func clearStorage() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try managedContext.execute(batchDeleteRequest)
        } catch let error as NSError {
            print(error)
        }
    }
}

