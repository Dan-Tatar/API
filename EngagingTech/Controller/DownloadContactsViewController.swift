//
//  File.swift
//  EngagingTech
//
//  Created by Dan  Tatar on 04/11/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation
import UIKit

class DownloadContactsViewController:  UIViewController{
    
 var getData = ContactsAPI()
    
 var downloadButton = HomeViewController()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        downloadButton.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
//    
//        @objc func buttonPressed(){
//            getData.getContaxtsData()
//        }
}
